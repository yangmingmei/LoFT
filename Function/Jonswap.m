function [S,Amp,t]=Jonswap(varargin )
% Create Jonswap spectrum and a wave based on that
% Modified from Sayyed Mohsen Vazirizade
% The University of Arizona
% smvazirizade@email.arizona.edu

%%
   p = inputParser;
%Required   
   addParameter(p,'Omega',@isrow); 
   addParameter(p,'Hs',@isnumeric);% significant wave height
   addParameter(p,'Tp',0);         % Peak period (s)
%Optional
   addParameter(p,'Cap',2); %Getting rid of the end of the spectrum 
   addParameter(p,'TEnd',3600*3/15);  % The duration of a the signal
   
   parse(p,varargin{:});   
   Omega=p.Results.Omega;
   Hs=p.Results.Hs;
   Tp=p.Results.Tp; 
   TEnd=p.Results.TEnd;  
   Cap=p.Results.Cap; 
   
%Default Value
g=9.806;     %Gravitational acceleration  m/s^2
disp('JONSWAP Method')
Gamma=3.3;   %peakedness parameter    for Pierson-Moskowitz Gamma=1
Beta=5/4;
SigmaA=0.07;  %spectral width parameter
SigmaB=0.09;  %spectral width parameter
format short
%%
OmegaGap = Omega(2)-Omega(1); 
%----- Jonswap spectrum ------
Omegam    = 2*pi/Tp;
sigma = (Omega<=Omegam)*SigmaA+(Omega>Omegam)*SigmaB;
A     = exp(-((Omega/Omegam-1)./(sigma*sqrt(2))).^2);  
alphabar = 5.058*(1-.287*log(Gamma))*(Hs/Tp^2)^2  ;                                     
alpha =0.0081;
% fprintf('alphabar= %d, alpha= %d \n',alphabar,alpha)
S     = alphabar*g^2 .* Omega.^-5 .* exp(-(Beta*(Omega/Omegam).^-4)) .* Gamma.^A;      %spectra m^2.s
S(Omega>Cap)=0;
Amp   = (2*S.*OmegaGap).^.5    ;                   % Amplitude m
t = linspace(0,TEnd,length(Omega));


