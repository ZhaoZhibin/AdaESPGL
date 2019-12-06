function [ Params ] = Config()
% This function performs parameter configuration
% Author : Zhibin Zhao
% Place  : Xi'an Jiaotong University
% Email  : zhibinzhao1993@gmail.com
% Date   : 2018.6

%% Set the random seed to make sure the reproducibility
Params.random_seed = 25;          % The random state

%% Parameters of Generating Simulation
Params.Fs            = 6400;     % The sampling frequency of the simulation signal
Params.N             = 8192;      % The length of the signal
Params.Fn            = 80;        % The fault characteristic frequency
Params.F             = 2000;      % The amplitude of the impulse
Params.mixture_ratio = [1, 1.3]; % The mixing ratio of [impulses, harmonic, noise].
% noise type
Params.noise_type = 'Gaussian';   % The noise type can be 'Gaussian' or 'Laplacian'


%% Parameters of the AdaESPGL
% TQWT parameters
Params.N1    = 4;              % The samples of one impulse
Params.M     = 4;              % The number of periods
Params.Fn_N  = Params.Fs/Params.Fn;           % a vector which contains the period of each component (Fs / fc)
Params.lam   = 0.272*Params.mixture_ratio(2) + 0.044;   % The parameter related to sparsity across groups
Params.mu    = 9.235e-4;       % The parameter related to sparsity within groups
Params.pen   = 'atan';         % The penalty function
Params.rho   = 1;              % The degree of nonconvex
Params.Nit   = 100;            % The number of iteration 
end

