%% This file contains parameters for LoFT, IEA 15MW UMaineSemi.
% There are 4 dofs reserved in LoFT : Azumith, Surge, Heave, Pitch

load('IEA15MW_UMaineSemi.mat')

% Surge Sway Heave Roll Pitch Yaw
%% Controlller and wind turbine
% Please refer to our manuscript[1] for details about a centralized controller.
% A reference FOWT contoller is ROSCO[2], fully activated during communication failures.


%% Basic properties
LoFT.Property.pitchinertia = 4.3716497074*1e10 -1.0662*1e10;
LoFT.Property.masstot = 20095000;
LoFT.Property.rotorinertia = 3.524605*1e8;
LoFT.Property.volume = 20075;

%% hydrostatic stiffness calcaulated by WAMIT. Parameters from IEA-15-240-RWT-UMaineSemi.hst 
LoFT.Hydro.hydrostatic = [  0         0	      0        ;
                       0	     445087	  406.1    ;
                       0	     406.1	  2.35*1e9];

% LoFT.Hydro.hydrostatic = [  0         0	      0        ;
%                        0	     445087*1	  0    ;
%                        0	     0	  2.35*1e9];

%% hydrodynamics : 1. radiation force 2. diffraction and F-K force(or summarized in excitation force) 3.viscious drag

% The radiation force is represented as "constant matrix". This trick
% was verified in a phd thesis [3] from the University of Stuttgart. The
% equal damping is alse extracted.
LoFT.Hydro.radiationaddedmass = [9720059.64789761	3234.24299945601	38802848.7423526
                            3763.25487325177	24808385.7041384	19207.7047974771
                            37917223.2319183	29235.2966715385	10662242324.1696];
LoFT.Hydro.radiationdamping = [3381.59764255390*10	-0.0672006060101557	37214.4496795139
                          0.796397942229252	154.811839174228	9.53556234079747
                          37002.9269624573	0.928595887788229	467443.863814201*1000];

% This is essential for decoupling algebraic loop and increassing numerical stability.
LoFT.Property.pitchinertia = LoFT.Property.pitchinertia+ LoFT.Hydro.radiationaddedmass(3,3);

LoFT.Property.masstot = LoFT.Property.masstot + 9720059.64789761;

LoFT.Hydro.radiationaddedmass = [0 3234.24299945601	38802848.7423526
                            3763.25487325177	24808385.7041384	19207.7047974771
                            37917223.2319183	29235.2966715385	0];

% The linear wave excitation force is caculated in-prior,
% ignoring phase shifting caused by platform surge/sway.


% viscious drag: F_vis  = B_vis*v*|v|
% Parameters from IEA-15-240-RWT-UMaineSemi_HydroDyn.dat
LoFT.Hydro.viscious = [923000	     0	     -8920000;
                  0	             2300000*200	0
                  -8920000	     0	     16800000000];

%% Mooring parameters.
% The mooring look-up table can be generated from Moordyn[4]. We also recommand 
% an alternative MOST[5] for a quasi-static implementation of mooring system.
LoFT.Mooring.option = 'Look-up table from Moordyn';


%% Aerodynamics
% Look-up tables for azumith-averaged Cp and Ct can be generated using a
% blade element momentum theory described in CCBlade[6]. 
LoFT.Aero.option = 'Look-up table from CCBlade';
LoFT.Aero.Ch = 1.63;          % height coefficient: 150m height                
LoFT.Aero.Cs = 0.5;           % shape coefficient: cylinder
LoFT.Aero.S =  1500;          % tower shadow: tower height × tower diameter

%% references
% [1] Coordinated control of floating offshore wind turbines for primary frequency response
% [2] A reference open-source controller for fixed and floating offshore wind turbines
% [3] Low-Order Modeling, Controller Design and Optimization of Floating Offshore Wind Turbines
% [4] Moordyn v2: New capabilities in mooring system components and load cases
% [5] Dynamic Modeling of an Offshore Floating Wind Turbine for Application in the Mediterranean Sea
% [6] CCBlade Documentation: Release 0.1.0
