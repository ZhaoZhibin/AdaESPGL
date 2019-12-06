function [x , cost] = AdaESPGL( Sig, Params)
% This function realizes adaptive enhanced sparse period-group
% lasso (AdaESPGL) algorithm

% Input :
%       Sig : the input signal (1D)
% Params: a struct contains all the parameters
%       Params.N1:            The samples of one impulse
%       Params.M:             The number of periods
%       Params.Fn_N:          A vector which contains the period of each component (Fs / fc)
%       Params.lam:           The parameter related to sparsity across groups
%       Params.mu:            The parameter related to sparsity within groups
%       Params.pen:           The penalty function
%       Params.rho:           The degree of nonconvex
%       Params.Nit:           Number of iterations (default: 100)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Output %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       x:                    The denoised signal
%       cost:                 The history of the cost function
% 
% Output : 
%       x : the denosied signal
%       cost : the cost function 
%
% Reference: 'Enhanced sparse period-group lasso for bearing fault
% diagnosis', IEEE Transactions on Industrial Electronics, 2018
% HomePages: https://zhaozhibin.github.io/
% Author   : Zhibin Zhao
% Place    : Xi'an Jiaotong University
% Email    : zhibinzhao1993@gmail.com
% Date     : 2017.10
N1   = Params.N1;
M    = Params.M;
Fn_N = Params.Fn_N;
lam  = Params.lam;
mu   = Params.mu;
pen  = Params.pen;
rho  = Params.rho;
Nit  = Params.Nit;

Sig = Sig(:);
x = Sig; % this initialization will avoid the zero at the denominator
cost = zeros(1 , Nit);

for iter = 1 : Nit
    P = Estimate_Period(x , Fn_N);
    N0 = P - N1;
    h = binaryblock(1 , N0 , N1 , M );
    N = sum(h);   
    a_max = 1/(lam*N);
    a = rho * a_max;
    [phi , wfun] = pen_fun(a , pen);
    a = sqrt( conv(abs(x).^2, h, 'full') );
    w = 1 ./ (abs(x) + eps);
    cost(iter) = 0.5 * sum(abs(x-Sig).^2) + lam * (sum(phi(a)) + mu * N * sum(abs(x) .* w));
    b = 1 ./ (wfun(a) + eps);
    r = conv(b , h , 'valid');
    x = Sig ./ (1 + lam * r + eps);
    T = lam * mu * N ./ (1 + lam * r + eps) .* w;
    x = softth(x , T);
end

end




