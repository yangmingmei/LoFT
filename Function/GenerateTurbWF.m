function Turbwind = GenerateTurbWF(U0,I0)
Tw.U0 = U0;          % mean wind speed at hub height(m/s)
Tw.I0 = I0;           % turbulence intensity(%)
Tw.Seed = randi([1 2^31-1]); % random seed
Tw.HubHt = 90;       % hub height
Tw.Ny = 7;          % Grid points along y axis
Tw.Nz = 7;          % Grid points along z axis
Tw.Ly = 140;         % Grid length along y axis(m)
Tw.Lz = 140;         % Grid length along z axis(m)
Tw.dt = 0.05;        % time interval(s)
Tw.T = 500;          % simulation time(s)
Tw.xLu = 340.2;      %
Tw.xLv = 113.4;      %
Tw.xLw = 27.72;      %
Tw.Lc = 340.2;       %
Tw.a = 12;           %
Tw.shearExp = 0.12;  % power law exponent
Tw.Thema = 800;      % Wake velocity width
Tw.Cs = 25000;       % Wake velocity depth
Tw.wake_pos = 61;    % Wake centre location
Tw.option = 0;       % an option for plot
%% TEST WIND FIELD GENERATION
% WF: wind field above Zbottom
% WFtower: wind field below Zbottom
nu = length(U0);
Tw.ww = 0.1*rand(nu,1)+Tw.U0;

for i = 1:1:nu
    Turbwind.WF(i,:) = TurbulentWindFieldGenerator(Tw.ww(i),Tw.I0,Tw.Seed+i,Tw.HubHt,Tw.Ny,Tw.Nz,Tw.Ly,Tw.Lz,Tw.dt,Tw.T,Tw.xLu,Tw.xLv,Tw.xLw,Tw.Lc,Tw.a);
end

Turbwind.AvgwindSpeed = (sum(Tw.ww.^3)/nu)^(1/3);



end

