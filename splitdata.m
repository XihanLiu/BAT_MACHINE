function splitdata(data, sr, split_data_length_sec, filename)
%{
Outputs .csv file of split data. 
    - format: Edge Impulse requires first column to be named 'timestamp' in
    millisecond format
        timestamp,volts
        0,0.0209
        0.00001,0.0636
        ...
File name format: "filename_{sample no.}_{length}.csv"
data - matlab variable, 1D array
sr - sample rate (100kHz)
split_data_length_sec - length of each split in seconds
filename - name of file, string
%}

if not(isfolder(filename))
    mkdir(filename)
end
num_samples = size(data,2);
data_length_in_seconds = num_samples/sr;
time_step = data_length_in_seconds/num_samples; % time intervals
time_steps = 0:time_step:data_length_in_seconds-time_step; % row vector
time_steps = time_steps*1000; % convert to milliseconds
increment = split_data_length_sec*sr; % number of samples to store in file
split_no = 1;
for i = 1:increment:num_samples
    if i+increment > num_samples
        splits = data(i:end);
        time = time_steps(i:end);
    else
        splits = data(i:i+increment-1);
        time = time_steps(i:i+increment-1);
    end
    % Create new array with time(row 1) and data(row 2)
    new_data = cat(1,time,splits);
    new_filename = strcat(filename,'/',filename,'_',num2str(split_no),'.csv');
    fileID = fopen(new_filename,'w');
    fprintf('Writing %s ...\n',new_filename)
    fprintf(fileID,'timestamp,volts\n');
    formatSpec = '%1.5f,%1.5f\n';
    fprintf(fileID,formatSpec,new_data);
    fclose(fileID);
%     writematrix(splits,strcat(filename,'/',filename,'_',num2str(split_no), ...
%         '_',num2str(split_data_length_sec),'sec','.csv'));
    split_no = split_no + 1;
end