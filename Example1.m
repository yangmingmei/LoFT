%% This example shows how to change environmental conditions simulate five FOWTs using LoFT
% FOWTs: floating offshore wind turbines 
% LoFT: Low-Order modelling of FOWTs For Training

clear,clc
addpath(genpath('./../LoFT-main'))

%% Set the random seed and create the set of parameters required for this example.
rng(20240303);  % random seed
param;          % default 

% Generate wind field
U0 = [15,13,11,7,5]';         % mean wind speed
I0 = 5;         % tubulence intensity

Turbwind = GenerateTurbWF(U0,I0);

%% Generate wave disturbances
% This part will be released after the paper is acccepted


%% Generate Mooring Matrix (in different water depth，mooring length and archor radius)
% This part will be released after the paper is acccepted



%% Communication Failures 
% Communication failures will block the command from onshore centralized controllers
% We don't involve a centralized controller in this example. So the local
% controller is adopted.

Communication = [0,0,0,0,0];

%% Conduct simulations and save results
mdl = "LoFT_Example1";
open_system(mdl)
simu.dt = 0.025;

Out  = sim(mdl,'StopTime',num2str(500));
save('Results\Example1.mat',"Out");




