%% This example shows how to simulate a floating wind farm using LoFT
% The wind farm consists of 7×10 IEA 15MW semi-submersible FOWTs 
% If you run this for the first time, the compile will take some time
% During the DRL traing, the file doesn't need to be compiled again
% 
clear,clc,close all
addpath(genpath('./../LoFT-main'))

%% Set the random seed and create the set of parameters required for this example.
% rng(20240303);
param;
simu.dt = 0.025;
column = 10;
row = 7;
D = 240;  % rotor diameter(m)

[X,Y] = meshgrid((0:column-1)*D*6, (0:row-1)*D*4);

figure; plot(X(:),Y(:),'o')
axis equal
title('Wind farm layout'); xlabel('X-coordinate [m]'); ylabel('Y-coordinate [m]')

%% Steady-state performance of IEA 15MW wind turbine 
% IEA_15MW = readmatrix('IEA_15MW_240_RWT.csv');
load('IEA_15MW_lookup_table.mat')


v = [0;0.5;1;1.5;2;2.5;IEA_15MW(:,1)];
pow = [0;0;0;0;0;0;IEA_15MW(:,2)];
ct = [0;0;0;0;0;0;IEA_15MW(:,5)];

figure
subplot(1,2,1)
plot(v, pow, '.-')
title('Power curve'); xlabel('Wind speed [m/s]'); ylabel('Power [kW]')
subplot(1,2,2)
plot(v, ct, '.-')
title('Thrust curve'); xlabel('Wind speed [m/s]'); ylabel('C_T [-]')

pc.interpolant_power = griddedInterpolant(v, pow, 'linear','nearest'); 
pc.interpolant_ct = griddedInterpolant(v, ct, 'linear','nearest');
pc.rotor_diameter = D; 

%% Define the hub height
hub_height = 145*ones(1,column*row);

u0 = 10; 
nu0 = length(u0);
z0 = 90;

direction = 60; 

ws_corr = (hub_height/z0).^0.1; 

ti0 = 0.09;  

%% wake modelling 

[pow_waked, ws_waked] = TurbOPark(u0,direction,ws_corr,X(:),Y(:),...
    hub_height,pc,ones(1,column*row),ti0); 

format longG

figure(3);
for i = 1:length(u0)
    scatter(X(:), Y(:), 40, (1-ws_waked(:,i)./(u0(i)*ws_corr'))*column*row, 'filled')
    axis equal
    cb = colorbar; cb.Label.String = 'Reduction of wind speed [%]';
    title(['Free wind speed: ', num2str(u0(i)) ,' m/s. Wind direction: ' num2str(direction) '^o']); xlabel('X-coordinate [m]'); ylabel('Y-coordinate [m]')    
end

%% Generate  turbulent wind field
Turbwind = GenerateTurbWF(ws_waked,ti0*100);

Communication = zeros([10,1]); 

%% Conduct simulations and save results
mdl = "LoFT_Example2";
open_system(mdl)
simu.dt = 0.025;
Out  = sim(mdl,'StopTime',num2str(500));
save('Results\Example2.mat',"Out");

%% plot
Tstart = 100;
Tend = 200;
Ts = simu.dt;
PlotWF(Out, Tstart,Tend,Ts)


























