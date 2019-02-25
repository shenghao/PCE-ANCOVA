%%*************************************************************************
% This function return the input and options for base case power flow.
% The mapping table for linking random inputs and models are also returned
%%*************************************************************************
function [Input,Options,Mapping] = caseinput()

%% 1. Specify the computation engine for deterministic simulation.
% *************************************************************************

% specify the function name.
modelopts.mFile = 'uqatc_case_24_simulation';

% Simulation parameters:nMode,nWeibull,nBeta,nNormal.
modelopts.Parameters = [0 3 3 0];

%% 2. Specify the random inputs.
% *************************************************************************
% The probabilistic input model consists of 25 dependent variables:
% 1. Weibull - wind speed
% 2. Beta - solar radiation
% 3. Normal - load active power

modelinputs.Marginals(1).Name = 'WT1';
modelinputs.Marginals(1).Type = 'weibull';
modelinputs.Marginals(1).Parameters = [11.576,2.702];

modelinputs.Marginals(2).Name = 'WT2';
modelinputs.Marginals(2).Type = 'weibull';
modelinputs.Marginals(2).Parameters = [11.576,2.702];

modelinputs.Marginals(3).Name = 'WT15';
modelinputs.Marginals(3).Type = 'weibull';
modelinputs.Marginals(3).Parameters = [11.576,2.702];

modelinputs.Marginals(4).Name = 'PV16';
modelinputs.Marginals(4).Type = 'beta';
modelinputs.Marginals(4).Parameters = [1.110,0.730,0.000,1000.000];

modelinputs.Marginals(5).Name = 'PV18';
modelinputs.Marginals(5).Type = 'beta';
modelinputs.Marginals(5).Parameters = [1.110,0.730,0.000,1000.000];

modelinputs.Marginals(6).Name = 'PV21';
modelinputs.Marginals(6).Type = 'beta';
modelinputs.Marginals(6).Parameters = [1.110,0.730,0.000,1000.000];

%% 3. Dependency definition (Gaussian Copula)
% *************************************************************************
% The distributions of the variables of the input model are already defined inside
% the struct Input. Dependency using a Gaussian copula is added as follows:

modelinputs.Copula.Type = 'Gaussian';
modelinputs.Copula.RankCorr = diag(ones(length(modelinputs.Marginals),1));

modelinputs.Copula.RankCorr(1:3,1:3) = [ 1.0 0.2 0.3; 0.2 1.0 0.1; 0.3 0.1 1.0; ];
modelinputs.Copula.RankCorr(3,4) = -0.2;
modelinputs.Copula.RankCorr(4,3) = -0.2;
modelinputs.Copula.RankCorr(4:6,4:6) = [ 1.0 0.28 0.35; 0.28 1.0 0.16; 0.35 0.16 1.0; ];

% Columns in the modelmaps:
% -------------------------------------------------------------------------
% #01 Input   : The input index in Input.Marginals
% #02 Distrib.: the distribution type, 1-Gaussian; 2-Weibull; 3-Beta
% #03 Gen/Load: generator or load, it leads to change mpc.gen/mpc.bus
% #04 BusNo   : the bus number where the uncertainty will be added at
% #05 Index   : the bus index in mpc.bus or gen index in mpc.gen
% #06 Type    : the bus type change flag, generator may be changed from PQ to PV
% #07 Param_1 : Pr for both wind generator and solar PV
% #08 Param_2 : Vr for wind generator, or Rc for solar PV
% #09 Param_3 : Vin for wind generator, or Rstd for solar PV
% #10 Param_4 : Vout for wind generator
% #11 Param_5 : the ratio of Q/P in base case, used to generate new Q according to new P

% Input Distrib Gen/Load BusNo Index Type Param_1 Param_2 Param_3 Param_4 Param_5
%--------------------------------------------------------------------------------
% Input Distrib Gen/Load BusNo Index Type       0       0       0       0     Q/P
% Input Distrib Gen/Load BusNo Index Type      Pr      Vr     Vin    Vout     Q/P
% Input Distrib Gen/Load BusNo Index Type      Pr      Rc    Rstd       0     Q/P

modelmaps = [
    1    2   1     1     3    2  150.000   13.500    3.500   25.000   0.32868411;
    2    2   1     2     7    2  150.000   13.500    3.500   25.000   0.32868411;
    3    2   1    15    21    2  150.000   13.500    3.500   25.000   0.32868411;
    4    3   1    16    22    2  150.000  150.000 1000.000    0.000   0.00000000;
    5    3   1    18    23    2  150.000  150.000 1000.000    0.000   0.00000000;
    6    3   1    21    24    2  150.000  150.000 1000.000    0.000   0.00000000;
];

%% Step 4. Return inputs and options
% *************************************************************************

Input = modelinputs;
Options = modelopts;
Mapping = modelmaps;
