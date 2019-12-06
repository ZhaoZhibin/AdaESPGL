%% Demo1: 
% HomePages: https://zhaozhibin.github.io/
% Author   : Zhibin Zhao
% Place    : Xi'an Jiaotong University
% Email    : zhibinzhao1993@gmail.com
% Date     : 2019.12
clc
clear all
close all
addpath(genpath(fileparts(mfilename('fullpath'))));

Params = Config();
rng('default')
rng(Params.random_seed)
[ Sig , t] = Generate_Simulation(Params);
%% Perform 
tic
[y_AdaESPGL] = AdaESPGL(Sig, Params);
time_AdaESPGL = toc;

%% Plot the results
figure(1)
subplot(211)
plot(t, Sig)
title('Original Signal')
ylabel('Amp (g)')
subplot(212)
plot(t, y_AdaESPGL)
title(['AdaESPGL, Computational time = ' num2str(time_AdaESPGL) 's'])
ylabel('Amp (g)')
xlabel('Time (s)')
filename = ['results', filesep, sprintf('Demo1_Extracted_Time.pdf')];
print(filename, '-dpdf');

% If you feel our AdaESPGL is useful for your research, please consider citing our paper:
% @article{zhao2018enhanced,
%   title={Enhanced sparse period-group lasso for bearing fault diagnosis},
%   author={Zhao, Zhibin and Wu, Shuming and Qiao, Baijie and Wang, Shibin and Chen, Xuefeng},
%   journal={IEEE Transactions on Industrial Electronics},
%   volume={66},
%   number={3},
%   pages={2143--2153},
%   year={2018},
%   publisher={IEEE}
% }