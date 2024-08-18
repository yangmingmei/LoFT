clear,clc
addpath(genpath('./../LoFT v0.0'))
clear;clc;%close all
%%
%%input data
Hs=10; %                                                                         significant wave height (m)
%Tm=10*(0.327*exp(-0.315*3.3)+1.17); %                                            Peak period (s)                       Tm=Tp=T0
Tp=11.3;                          %                                                zero-crossing period (s)

omega=linspace(0.01,3,500);
% omega = 0.01:0.01:3;
dw = (omega(2)-omega(1))*ones(1,length(omega));
% load('omega.mat
load('fext.mat')
Cap=2;                           %this is the maximum considered Omega
TEnd=50;
spread = 1;
%type 1 is Jonswap and type 2 is Pierson-Moskowitz
[S,Amp,t]=Jonswap('Omega', omega ,'Hs', Hs,'Tp' ,Tp, 'TEnd',TEnd,'Cap',Cap);

%%
%Generating signal using first method
rng(20240718)                                         % setting seed number
PhaseDiff=2 * pi * rand(1,length(omega)) ;         % random phase, no phase difference
Signal1=sum(Amp' .* cos(omega'.*t + PhaseDiff'));

L = 120*ones(1,length(omega));
% omega = omega';
% tic
% ii = 1;
% % for time = 1:0.025:600
% %     Fext(ii,:) = irregExcF(Amp,omega,fExt.re,fExt.im,PhaseDiff,dw,time,0,spread,fExt.md);
% %     ii = ii+1;
% % end
% % toc
%%
% column = 10;
% row = 7;
% D = 5;  % rotor diameter(m)
% [X,Y] = meshgrid((0:column-1)*D*6, (0:row-1)*D*4);
Nx = 500;
Nt = length(omega);

x = linspace(0,500,Nx);
x = x.*ones([500,Nx]);

wavespeed = (omega/(2*pi) .*L);
wavespeed = wavespeed.*ones([Nx,500]);
wavespeed = wavespeed';
Phaseshift = x./wavespeed .*(omega .*ones([Nx,500]))';

Signal2 = sum(Amp' .* cos(omega'.*t + PhaseDiff'+Phaseshift(:,10)));
Signal3 = sum(Amp' .* cos(omega'.*t + PhaseDiff'+Phaseshift(:,20)));

elevation_map = zeros(Nx,500);
for i = 1:1:Nx
    elevation_map(i,:) = sum(Amp' .* cos(omega'.*t + PhaseDiff'+Phaseshift(:,i)));
end

X = linspace(0,500,Nx);
Y = linspace(0,TEnd,Nx);
figure(3)
gpa  = pcolor(X,Y,elevation_map); 
set(gpa, 'LineStyle','none'); % 去掉pcolor网格
set(gca, 'fontname', 'Times New Roman' ...
    ,'fontsize', 12)

CoolWarm = colMapGen([0.706, 0.016, 0.150],[0.230, 0.299, 0.754],200);
colormap(CoolWarm)

set(gcf,'unit','centimeters','position',[15 10 16 7]);
cb = colorbar; 
cb.Label.String = '\fontname{Times New Roman} Wave Elevation /m';
cb.FontSize = 12;
xlabel('\fontname{Times New Roman}Space /m','FontSize',12); 
ylabel('\fontname{Times New Roman}Time /s','FontSize',12);


% xlim([0, 500])
% xticks([0:100:500])
% set(gca,'XTick',[0:100:500],'FontSize',10,'Fontname','Times New Roman');
% ylim([0,100])
% set(gca,'YTick',[0:20:TEnd],'FontSize',10,'Fontname','Times New Roman');




%%
figure(1)
YRange=max(max(abs(Signal1)));
subplot(3,1,1)
hold on 
plot(omega,S)
xlabel('Omega (rad/s)');ylabel('Spectrum (m^2.s)');
xlim([0, Cap])
grid;

subplot(3,1,2)
plot(omega,Amp)
xlabel('Omega (rad/s)');ylabel('Amplitude (m)');
xlim([0, Cap])
grid;

subplot(3,1,3)
plot(t,Signal1)
xlabel('time (s)');ylabel('Magnitude (m)');
title('sum(Amp.* cos(Omega.*t+PhaseDiff)')
grid;
ylim(1.2*[-YRange,YRange])

%%
figure(2)
subplot(3,1,1)
plot(t,Signal1)
xlabel('time (s)');ylabel('Magnitude (m)');
title('sum(Amp.* cos(Omega.*t+PhaseDiff)')
grid;
ylim(1.2*[-YRange,YRange])

subplot(3,1,2)
plot(t,Signal2)
xlabel('time (s)');ylabel('Magnitude (m)');
title('sum(Amp.* cos(Omega.*t+PhaseDiff)')
grid;
ylim(1.2*[-YRange,YRange])

subplot(3,1,3)
plot(t,Signal3)
xlabel('time (s)');ylabel('Magnitude (m)');
title('sum(Amp.* cos(Omega.*t+PhaseDiff)')
grid;
ylim(1.2*[-YRange,YRange])
%%

