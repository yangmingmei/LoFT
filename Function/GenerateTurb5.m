function Turbwind = GenerateTurb5(U0,I0)
Tw.U0 = U0;          % mean wind speed at hub height(m/s)
Tw.I0 = I0;           % turbulence intensity(%)
Tw.Seed = randi([1 2^31-1]); % random seed
Tw.HubHt = 90;       % hub height
Tw.Ny = 3;          % Grid points along y axis
Tw.Nz = 3;          % Grid points along z axis
Tw.Ly = 140;         % Grid length along y axis(m)
Tw.Lz = 140;         % Grid length along z axis(m)
Tw.dt = 0.05;        % time interval(s)
Tw.T = 500;          % simulation time(s)
Tw.xLu = 340.2;      %
Tw.xLv = 113.4;      %
Tw.xLw = 27.72;      %
Tw.Lc = 340.2;       %
Tw.a = 12;           %

%% TEST WIND FIELD GENERATION
% WF: wind field above Zbottom
% WFtower: wind field below Zbottom
Tw.ww = rand(5,1)+Tw.U0;

Turbwind.WT1 = TurbulentWindFieldGenerator(Tw.ww(1),Tw.I0,Tw.Seed,Tw.HubHt,Tw.Ny,Tw.Nz,Tw.Ly,Tw.Lz,Tw.dt,Tw.T,Tw.xLu,Tw.xLv,Tw.xLw,Tw.Lc,Tw.a);
Turbwind.WT2 = TurbulentWindFieldGenerator(Tw.ww(2) ,Tw.I0,Tw.Seed+1,Tw.HubHt,Tw.Ny,Tw.Nz,Tw.Ly,Tw.Lz,Tw.dt,Tw.T,Tw.xLu,Tw.xLv,Tw.xLw,Tw.Lc,Tw.a);
Turbwind.WT3 = TurbulentWindFieldGenerator(Tw.ww(3) ,Tw.I0,Tw.Seed+2,Tw.HubHt,Tw.Ny,Tw.Nz,Tw.Ly,Tw.Lz,Tw.dt,Tw.T,Tw.xLu,Tw.xLv,Tw.xLw,Tw.Lc,Tw.a);
Turbwind.WT4 = TurbulentWindFieldGenerator(Tw.ww(4) ,Tw.I0,Tw.Seed+3,Tw.HubHt,Tw.Ny,Tw.Nz,Tw.Ly,Tw.Lz,Tw.dt,Tw.T,Tw.xLu,Tw.xLv,Tw.xLw,Tw.Lc,Tw.a);
Turbwind.WT5 = TurbulentWindFieldGenerator(Tw.ww(5) ,Tw.I0,Tw.Seed+4,Tw.HubHt,Tw.Ny,Tw.Nz,Tw.Ly,Tw.Lz,Tw.dt,Tw.T,Tw.xLu,Tw.xLv,Tw.xLw,Tw.Lc,Tw.a);

Turbwind.AvgwindSpeed = (sum(Tw.ww.^3)/5)^(1/3);



end

