% Required data to run New England 39 Bus benchmark
% clear
% clc
% Definition for the columns
% system base =100 MVA

K_regulator = 20;
%% Line data Format (line)
% All values are given on the same system base MVA
% 1: From bus  
% 2: To bus   
% 3: Resistance (pu)
% 4: Reactance  (pu)
% 5: Charge     (pu)
% 6: Transformer Tap Amplitute
% 7: base MVA
% 8: Nomonal Voltage (KV) 

%   1   2    3        4       5     6    7   8    
line=[...
    1	2	0.0035	0.0411	0.6987	0	100	345
    1	39	0.001	0.025	0.75	0	100	345
    2	3	0.0013	0.0151	0.2572	0	100	345
    2	25	0.007	0.0086	0.146	0	100	345
    2	30	0	    0.0181	0	  1.025	100	22
    3	4	0.0013	0.0213	0.2214	0	100	345
    3	18	0.0011	0.0133	0.2138	0	100	345
    4	5	0.0008	0.0128	0.1342	0	100	345
    4	14	0.0008	0.0129	0.1382	0	100	345
    5	8	0.0008	0.0112	0.1476	0	100	345
    6	5	0.0002	0.0026	0.0434	0	100	345
    6	7	0.0006	0.0092	0.113	0	100	345
    6	11	0.0007	0.0082	0.1389	0	100	345
    7	8	0.0004	0.0046	0.078	0	100	345
    8	9	0.0023	0.0363	0.3804	0	100	345
    9	39	0.001	0.025	1.2	    0	100	345
    10	11	0.0004	0.0043	0.0729	0	100	345
    10	13	0.0004	0.0043	0.0729	0	100	345
    10	32	0	    0.02	0	  1.07	100	22
    12	11	0.0016	0.0435	0	  1.006	100	345
    12	13	0.0016	0.0435	0	  1.006	100	345
    13	14	0.0009	0.0101	0.1723	0	100	345
    14	15	0.0018	0.0217	0.366	0	100	345
    15	16	0.0009	0.0094	0.171	0	100	345
    16	17	0.0007	0.0089	0.1342	0	100	345
    16	19	0.0016	0.0195	0.304	0	100	345
    16	21	0.0008	0.0135	0.2548	0	100	345
    16	24	0.0003	0.0059	0.068	0	100	345
    17	18	0.0007	0.0082	0.1319	0	100	345
    17	27	0.0013	0.0173	0.3216	0	100	345
    19	33	0.0007	0.0142	0	  1.07	100	22
    19	20	0.0007	0.0138	0	  1.06	100	345
    20	34	0.0009	0.018	0	  1.009	100	22
    21	22	0.0008	0.014	0.2565	0	100	345
    22	23	0.0006	0.0096	0.1846	0	100	345
    22	35	0	    0.0143	0	  1.025	100	22
    23	24	0.0022	0.035	0.361	0	100	345
    23	36	0.0005	0.0272	0	    1	100	22
    25	26	0.0032	0.0323	0.513	0	100	345
    25	37	0.0006	0.0232	0	  1.025	100	22
    26	27	0.0014	0.0147	0.2396	0	100	345
    26	28	0.0043	0.0474	0.7802	0	100	345
    26	29	0.0057	0.0625	1.029	0	100	345
    28	29	0.0014	0.0151	0.249	0	100	345
    29	38	0.0008	0.0156	0	  1.025	100	22
    31	6	0	    0.025	0	    1	100	22];

% line(:,3) = line(:,3)/1000;
% line(:,4) = line(:,4)/1000;

%% Machine Data Format (mac_con)
% 1.  Machine Number
% 2.  Bus Number
% 3.  Base MVA
% 4.  Leakage Reactance x_l(pu)
% 5.  Resistance r_a(pu)
% 6.  d-axis sychronous reactance x_d(pu)
% 7.  d-axis transient reactance x'_d(pu)
% 8.  d-axis subtransient reactance x"_d(pu)
% 9.  d-axis open-circuit time constant T'_do(sec),
% 10. d-axis open-circuit subtransient time constant T"_do(sec)
% 11. q-axis sychronous reactance x_q(pu)
% 12. q-axis transient reactance x'_q(pu)
% 13. q-axis subtransient reactance x"_q(pu)
% 14. q-axis open-circuit time constant T'_qo(sec)
% 15. q-axis open circuit subtransient time constant % T"_qo(sec)
% 16. inertia constant H(sec)
% 17. damping coefficient d_o(pu)
% 18. dampling coefficient d_1(pu)
% 19. bus number
% Note: all the following machines use sub-transient model
% 1  2     3      4      5      6     7    8      9    10    11    12    13    14    15    16    17    18  19
mac_con=[
  1  39  1000.0 0.300 0.0010  0.200 0.060 0.01  7.000 0.003 0.190 0.080 0.03  0.700 0.005 50.00 0.000 0.00 39 ;
  2  31  1000.0 0.350 0.0270  2.950 0.697 0.01  6.560 0.003 2.820 1.7   0.03  1.500 0.005 3.030 0.000 0.00 31 ;
  3  32  1000.0 0.304 .00386  2.495 0.531 0.01  5.700 0.003 2.370 0.876 0.03  1.500 0.005 3.580 0.000 0.00 32 ;
  4  33  1000.0 0.295 .00222  2.620 0.436 0.01  5.690 0.003 2.580 1.66  0.03  1.500 0.005 2.860 0.000 0.00 33 ;
  5  34  1000.0 0.540 0.0014  6.700 1.320 0.01  5.400 0.003 6.200 1.66  0.03  0.440 0.005 2.600 0.000 0.00 34 ;
  6  35  1000.0 0.224 0.0615  2.540 0.500 0.01  7.300 0.003 2.410 0.814 0.03  0.400 0.005 3.480 0.000 0.00 35 ;
  7  36  1000.0 0.322 .00268  2.950 0.490 0.01  5.660 0.003 2.920 1.86  0.03  1.500 0.005 2.640 0.000 0.00 36 ;
  8  37  1000.0 0.280 .00686  2.900 0.570 0.01  6.700 0.003 2.800 0.911 0.03  0.410 0.005 2.430 0.000 0.00 37 ;
  9  38  1000.0 0.298 0.0030  2.106 0.570 0.01  4.790 0.003 2.050 0.587 0.03  1.960 0.005 3.450 0.000 0.00 38 ;
  10 30  1000.0 0.125 0.0014  1.000 0.310 0.01  10.20 0.003 0.690 0.08  0.03  1.500 0.005 4.200 0.000 0.00 30 ];

mac_con(:,5)=0;

% mac_con(:,9) = mac_con(:,9)/2;

p0=[1000 520.81 650 632 508 650 560 540 830 250]'./1000;%Active Power Generation of PV units
Pn(1:10,1)=mac_con(:,3)/1000; % Nominal Power

%% Power System Stabilizer Format (MB)
% Applied power system stabilizer is MBPSS with simplified settings
% Note: All machines use MBPSS with same configuration 
% 1: Global gain (G)
% 2: Frequency of low frequency band (FL) Hz
% 3: Gain of low frequency band (KL)
% 4: Frequency of intermediate frequency band (FI) Hz
% 5: Gain of intermediate frequency band (KI)
% 6: Frequency of high frequency band (FH) Hz
% 7: Gain of high frequency band (KH)
%   1    2  3     4   5      6  7
MB=[1   0.2 30   1.25 40    12 160];

%% Excitation System format (AVR_Data)
% All machines use IEEE type 1 synchronous machine voltage regulator combined to an exciter
% 1. Low pass filter time constant (Tr) sec
% 2. Regulator gain (Ka)
% 3. regulator time constant (Ta) sec
% 4. Lead-lag compensator time constant (Tb) sec
% 5. Lead-lag compensator time constant (Tc) sec
% 6. Terminal voltage (pu)
% 7. Lower limit for regulator output (Emin)   
% 8. Upper limit for regulator output (Emax)
%     1    2      3      4     5     6       7    8
  AVR_Data=[...
    0.01  200    0.015   10    1    1.03    -5    5
    0.01  200    0.015   10    1    1.03    -5    5
    0.01  200    0.015   10    1    1.03    -5    5
    0.01  200    0.015   10    1    1.03    -5    5
    0.01  200    0.015   10    1    1.03    -5    5
    0.01  200    0.015   10    1    1.03    -5    5
    0.01  200    0.015   10    1    1.03    -5    5
    0.01  200    0.015   10    1    1.03    -5    5
    0.01  200    0.015   10    1    1.03    -5    5
    0.01  200    0.015   10    1    1.03    -5    5];
 
C0=829.7e-9;
L0=3.220e-3;
R0=1;
Ns=120*60/(2); %Nominal speed of synchronous machines
s=10;
% PSSModel=1;%1:No pSS //1:MB 
%% Bus data (Bus)
% 1. Bus number
% 2. Nominal phase-phase voltage 
%    1    2
Bus = [ ...
     1   345
     2   345
     3   345
     4   345
     5   345
     6   345
     7   345
     8   345
     9   345
    10   345
    11   345
    12   230
    13   345
    14   345
    15   345
    16   345
    17   345
    18   345
    19   345
    20   345
    21   345
    22   345
    23   345
    24   345
    25   345
    26   345
    27   345
    28   345
    29   345
    30    22
    31    22
    32    22
    33    22
    34    22
    35    22
    36    22
    37    22
    38    22
    39   345];

   zbase=(line(:,8).^2)./line(:,7);
   line(:,3)=line(:,3).*zbase;
   line(:,4)=line(:,4).*zbase/(120*pi);
   line(:,5)=line(:,5)./zbase/(120*pi);
     
PSSMODEL=1;

%%
BusLoad = [190 520 153 500 7.5 320 329 158 628 274 247.5 308.6 224 139 ... 
    281 206 283.5 9.2 1104];