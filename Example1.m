%% This example shows how to change environmental conditions simulate five FOWTs using LoFT
% FOWTs: floating offshore wind turbines 
% LoFT: Low-Order modelling of FOWTs For Training

clear,clc
addpath(genpath('./../LoFT v0.0'))

%% Set the random seed and create the set of parameters required for this example.
rng(20240303);  % random seed
param;          % default 

% Generate wind field
U0 = 12;         % mean wind speed
I0 = 5;         % tubulence intensity
Turbwind = GenerateTurb5(U0,I0);

figure
set(gcf,'unit','centimeters','position',[10 5 40 10]); % 10cm*20cm
plot(Turbwind.WT1.Time, Turbwind.WT1.WindVelX)
hold on 
plot(Turbwind.WT2.Time, Turbwind.WT2.WindVelX)
plot(Turbwind.WT3.Time, Turbwind.WT3.WindVelX)
plot(Turbwind.WT4.Time, Turbwind.WT4.WindVelX)
plot(Turbwind.WT5.Time, Turbwind.WT5.WindVelX)
% plotWindsWaves

%% Generate wave disturbances





%% Generate Mooring Matrix (in different water depth)


% Create_Mooring_Matrix()


%% Communication Failures 
% Communication failures will block the command from onshore centralized controllers

% A random communication failure
Communication = randn([5,1]);
Communication = double( Communication > min(Communication) );

% We don't involve a centralized controller in this example. So the local
% controller is adopted.
Communication = [0,0,0,0,0];

%% Conduct simulations and save results
mdl = "LoFT_Example1";
open_system(mdl)
simu.dt = 0.025;

Out  = sim(mdl,'StopTime',num2str(500));
save('Results\Example1.mat',"Out");



