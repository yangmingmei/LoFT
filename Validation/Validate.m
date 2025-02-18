clear,clc
load('Validation.mat')

%%
Tstart = 0.5;
Tend = 600;
Ts = 0.0125;
Nstart = Tstart/0.0125 +1;
Nend = Tend/Ts+1;


%% RotSpeed, Power
figure(1);
fig1.Renderer = 'Painters';

width=1440;%宽度，像素数
height=360;%高度
left=200;%距屏幕左下角水平距离
bottom=100;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottom,width,height])%设置图窗大小和位置

subplot(1,2,1)
plot(FAST_outdata.simout_1.Time(Nstart:Nend)-Tstart,FAST_outdata.simout_1.RotSpeed(Nstart:Nend),'Color',"#0072BD",'LineStyle','-','LineWidth',4);
hold on
plot(LoFT_outdata.simout_1.RotSpeed.time,LoFT_outdata.simout_1.RotSpeed.data*30/pi,'Color',"#D95319",'LineStyle','-.','LineWidth',4);
hold on
set(gca,'FontName','Times New Roman','FontSize',22,'LineWid',3);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}Rotor Speed/(rpm)')

legend('\fontname{Times New Roman}OpenFAST', ...
    '\fontname{Times New Roman}LoFT')

subplot(1,2,2)
plot(FAST_outdata.simout_1.Time(Nstart:Nend)-Tstart,FAST_outdata.simout_1.GenPwr(Nstart:Nend)/1e3,'Color',"#0072BD",'LineStyle','-','LineWidth',4);
hold on
plot(LoFT_outdata.simout_1.GenPwr.time,LoFT_outdata.simout_1.GenPwr.data/1e6,'Color',"#D95319",'LineStyle','-.','LineWidth',4); 
hold on
set(gca,'FontName','Times New Roman','FontSize',22,'LineWid',3);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}Power/(MW)')

legend('\fontname{Times New Roman}OpenFAST', ...
    '\fontname{Times New Roman}LoFT')


%% Torque, BldPitch
figure(2);
fig1.Renderer = 'Painters';

width=1440;%宽度，像素数
height=360;%高度
left=200;%距屏幕左下角水平距离
bottom=100;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottom,width,height])%设置图窗大小和位置

subplot(1,2,1)
plot(FAST_outdata.simout_1.Time(Nstart:Nend)-Tstart,FAST_outdata.simout_1.GenTq(Nstart:Nend)/1e3,'Color',"#0072BD",'LineStyle','-','LineWidth',4);
hold on
plot(LoFT_outdata.simout_1.GenTorq.time,LoFT_outdata.simout_1.GenTorq.data/1e6,'Color',"#D95319",'LineStyle','-.','LineWidth',4);
hold on
set(gca,'FontName','Times New Roman','FontSize',22,'LineWid',3);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}Torque/(MN)')

legend('\fontname{Times New Roman}OpenFAST', ...
    '\fontname{Times New Roman}LoFT')



subplot(1,2,2)
plot(FAST_outdata.simout_1.Time(Nstart:Nend)-Tstart,FAST_outdata.simout_1.BldPitch1(Nstart:Nend),'Color',"#0072BD",'LineStyle','-','LineWidth',4);
hold on
plot(LoFT_outdata.simout_1.BldPitch.time,LoFT_outdata.simout_1.BldPitch.data*180/pi,'Color',"#D95319",'LineStyle','-.','LineWidth',4);
hold on
set(gca,'FontName','Times New Roman','FontSize',22,'LineWid',3);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}BldPitch/(deg)')

legend('\fontname{Times New Roman}OpenFAST', ...
    '\fontname{Times New Roman}LoFT')

%% PtfmPitch, PtfmSurge
figure(3);
fig1.Renderer = 'Painters';

width=1440;%宽度，像素数
height=360;%高度
left=200;%距屏幕左下角水平距离
bottom=100;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottom,width,height])%设置图窗大小和位置

subplot(1,2,1)
plot(FAST_outdata.simout_1.Time(Nstart:Nend)-Tstart,FAST_outdata.simout_1.PtfmPitch(Nstart:Nend),'Color',"#0072BD",'LineStyle','-','LineWidth',4);
hold on
plot(LoFT_outdata.simout_1.PtfmPitch.time,LoFT_outdata.simout_1.PtfmPitch.data*180/pi,'Color',"#D95319",'LineStyle','-.','LineWidth',4);
hold on
set(gca,'FontName','Times New Roman','FontSize',22,'LineWid',3);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}Platform Pitch/(deg)')

legend('\fontname{Times New Roman}OpenFAST', ...
    '\fontname{Times New Roman}LoFT')

ylim([-1 4]);
set(gca,'YTick',[-1:2:4]);

subplot(1,2,2)
plot(FAST_outdata.simout_1.Time(Nstart:Nend)-Tstart,FAST_outdata.simout_1.PtfmSurge(Nstart:Nend),'Color',"#0072BD",'LineStyle','-','LineWidth',4);
hold on
plot(LoFT_outdata.simout_1.PtfmSurge.time,LoFT_outdata.simout_1.PtfmSurge.data,'Color',"#D95319",'LineStyle','-.','LineWidth',4);
hold on
set(gca,'FontName','Times New Roman','FontSize',22,'LineWid',3);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}Platform Surge/(m)')

ylim([0 30]);
set(gca,'YTick',[0:10:30]);

legend('\fontname{Times New Roman}OpenFAST', ...
    '\fontname{Times New Roman}LoFT')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RotSpeed, Power
figure(4);
fig1.Renderer = 'Painters';

width=1440;%宽度，像素数
height=360;%高度
left=200;%距屏幕左下角水平距离
bottom=100;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottom,width,height])%设置图窗大小和位置

subplot(1,2,1)
plot(FAST_outdata.simout_2.Time(Nstart:Nend)-Tstart,FAST_outdata.simout_2.RotSpeed(Nstart:Nend),'Color',"#0072BD",'LineStyle','-','LineWidth',4);
hold on
plot(LoFT_outdata.simout_2.RotSpeed.time,LoFT_outdata.simout_2.RotSpeed.data*30/pi,'Color',"#D95319",'LineStyle','-.','LineWidth',4);
hold on
set(gca,'FontName','Times New Roman','FontSize',22,'LineWid',3);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}Rotor Speed/(rpm)')

legend('\fontname{Times New Roman}OpenFAST', ...
    '\fontname{Times New Roman}LoFT')

subplot(1,2,2)
plot(FAST_outdata.simout_2.Time(Nstart:Nend)-Tstart,FAST_outdata.simout_2.GenPwr(Nstart:Nend)/1e3,'Color',"#0072BD",'LineStyle','-','LineWidth',4);
hold on
plot(LoFT_outdata.simout_2.GenPwr.time,LoFT_outdata.simout_2.GenPwr.data/1e6,'Color',"#D95319",'LineStyle','-.','LineWidth',4); 
hold on
set(gca,'FontName','Times New Roman','FontSize',22,'LineWid',3);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}Power/(MW)')

legend('\fontname{Times New Roman}OpenFAST', ...
    '\fontname{Times New Roman}LoFT')

ylim([8 24]);
set(gca,'YTick',[8:4:24]);



%% Torque, BldPitch
figure(5);
fig1.Renderer = 'Painters';

width=1440;%宽度，像素数
height=360;%高度
left=200;%距屏幕左下角水平距离
bottom=100;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottom,width,height])%设置图窗大小和位置

subplot(1,2,1)
plot(FAST_outdata.simout_2.Time(Nstart:Nend)-Tstart,FAST_outdata.simout_2.GenTq(Nstart:Nend)/1e3,'Color',"#0072BD",'LineStyle','-','LineWidth',4);
hold on
plot(LoFT_outdata.simout_2.GenTorq.time,LoFT_outdata.simout_2.GenTorq.data/1e6,'Color',"#D95319",'LineStyle','-.','LineWidth',4);
hold on
set(gca,'FontName','Times New Roman','FontSize',22,'LineWid',3);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}Torque/(MN)')

legend('\fontname{Times New Roman}OpenFAST', ...
    '\fontname{Times New Roman}LoFT')

ylim([18 20]);
set(gca,'YTick',[18:1:20]);


subplot(1,2,2)
plot(FAST_outdata.simout_2.Time(Nstart:Nend)-Tstart,FAST_outdata.simout_2.BldPitch1(Nstart:Nend),'Color',"#0072BD",'LineStyle','-','LineWidth',4);
hold on
plot(LoFT_outdata.simout_2.BldPitch.time,LoFT_outdata.simout_2.BldPitch.data*180/pi,'Color',"#D95319",'LineStyle','-.','LineWidth',4);
hold on
set(gca,'FontName','Times New Roman','FontSize',22,'LineWid',3);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}BldPitch/(deg)')

legend('\fontname{Times New Roman}OpenFAST', ...
    '\fontname{Times New Roman}LoFT')

%% PtfmPitch, PtfmSurge
figure(6);
fig1.Renderer = 'Painters';

width=1440;%宽度，像素数
height=360;%高度
left=200;%距屏幕左下角水平距离
bottom=100;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottom,width,height])%设置图窗大小和位置

subplot(1,2,1)
plot(FAST_outdata.simout_2.Time(Nstart:Nend)-Tstart,FAST_outdata.simout_2.PtfmPitch(Nstart:Nend),'Color',"#0072BD",'LineStyle','-','LineWidth',4);
hold on
plot(LoFT_outdata.simout_2.PtfmPitch.time,LoFT_outdata.simout_2.PtfmPitch.data*180/pi,'Color',"#D95319",'LineStyle','-.','LineWidth',4);
hold on
set(gca,'FontName','Times New Roman','FontSize',22,'LineWid',3);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}Platform Pitch/(deg)')

legend('\fontname{Times New Roman}OpenFAST', ...
    '\fontname{Times New Roman}LoFT')


subplot(1,2,2)
plot(FAST_outdata.simout_2.Time(Nstart:Nend)-Tstart,FAST_outdata.simout_2.PtfmSurge(Nstart:Nend),'Color',"#0072BD",'LineStyle','-','LineWidth',4);
hold on
plot(LoFT_outdata.simout_2.PtfmSurge.time,LoFT_outdata.simout_2.PtfmSurge.data,'Color',"#D95319",'LineStyle','-.','LineWidth',4);
hold on
set(gca,'FontName','Times New Roman','FontSize',22,'LineWid',3);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}Platform Surge/(m)')

ylim([0 30]);
set(gca,'YTick',[0:10:30]);


legend('\fontname{Times New Roman}OpenFAST', ...
    '\fontname{Times New Roman}LoFT')