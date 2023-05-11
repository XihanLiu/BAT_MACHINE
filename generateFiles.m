%% Generate Files
clearvars
load Moth_data.mat
sample_rate = 100000; % 100kHz
split_file_length = 0.5; % 0.5 second files

%% Big Moth Data
filename = 'Big_moth_close';
Big_moth_close = [Big_moth_close1, Big_moth_close2];
splitdata(Big_moth_close,sample_rate,split_file_length,filename);

filename = 'Big_moth_far';
Big_moth_far = [Big_moth_far1, Big_moth_far2];
splitdata(Big_moth_far,sample_rate,split_file_length,filename);

%% Medium Moth Data
filename = 'Medium_moth_close';
Medium_moth_close = [Medium_moth_close1, Medium_moth_close2];
splitdata(Medium_moth_close,sample_rate,split_file_length,filename);

filename = 'Medium_moth_far';
Medium_moth_far = [Medium_moth_far1, Medium_moth_far2];
splitdata(Medium_moth_far,sample_rate,split_file_length,filename);

%% Small Moth Data
filename = 'Small_moth_close';
Small_moth_close = [Small_moth_close1, Small_moth_close2];
splitdata(Small_moth_close,sample_rate,split_file_length,filename);

filename = 'Small_moth_far';
Small_moth_far = [Small_moth_far1, Small_moth_far2];
splitdata(Small_moth_far,sample_rate,split_file_length,filename);
