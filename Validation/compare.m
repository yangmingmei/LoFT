%% Compare LoFT output and OpenFast output
% Case 1:steady wind speed and no waves
% Case 2:turbulent wind speed and JONSWAP waves

load('Case1_OpenFast.mat')
load('Case1_LoFT.mat')

load('Case2_OpenFast.mat')
load('Case2_LoFT.mat')

%%
Tstart = 1;
Tend = 600;
Ts = 0.0125;
Nstart = Tstart/0.0125 +1;
Nend = Tend/Ts+1;
%%
% figure(1);
% fig1.Renderer = 'Painters';
% 
% width=1440;%宽度，像素数
% height=600;%高度
% left=200;%距屏幕左下角水平距离
% bottom=100;%距屏幕左下角垂直距离
% set(gcf,'position',[left,bottom,width,height])%设置图窗大小和位置
% 
% % plot(tout(Nstart:Nend)-Tstart,f1(Nstart:Nend)-0.045,'Color','#D2691E','LineStyle','-','LineWidth',4);
% % hold on;
% plot(simout_1.Time(Nstart:Nend)-Tstart,simout_1.RotSpeed(Nstart:Nend),'Color',"#0072BD",'LineStyle','-','LineWidth',3);
% hold on
% plot(out.simout_1.RotSpeed.time,out.simout_1.RotSpeed.data*30/pi,'Color',"#0072BD",'LineStyle','-','LineWidth',3);
% hold on
% 
% % plot(simout_2.Time(Nstart:Nend)-Tstart,simout_2.RotSpeed(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',3);
% % hold on
% % plot(simout_3.Time(Nstart:Nend)-Tstart,simout_3.RotSpeed(Nstart:Nend),'Color','#D2691E','LineStyle','-','LineWidth',3);
% % hold on
% % plot(simout_4.Time(Nstart:Nend)-Tstart,simout_4.RotSpeed(Nstart:Nend),'Color','#FF0000','LineStyle','-','LineWidth',3);
% % hold on 
% % plot(simout_5.Time(Nstart:Nend)-Tstart,simout_5.RotSpeed(Nstart:Nend),'Color',"#77AC30",'LineStyle','-','LineWidth',3);
% 
% xlabel('\fontname{Times new roman}Time(s)','FontSize',28);
% ylabel('\fontname{Times new roman}Rotor Speed \it\fontname{Times new roman}{\omega_r} \rm\fontname{Times new roman}(m/s)','FontSize',28);  %x,y 轴
% legend('\rm\fontname{Times new roman}FOWT1(7m/s)',...
%        '\rm\fontname{Times new roman}FOWT2(10m/s)',...
%        '\rm\fontname{Times new roman}FOWT3(13m/s)',...
%        '\rm\fontname{Times new roman}FOWT4(16m/s)',...
%        '\rm\fontname{Times new roman}FOWT5(19m/s)',...
%        'NumColumns',1 ,'Location','southeast');  %图例
% set(gca,'FontName','Times New Roman','FontSize',28,'LineWid',4);  %图中的字
% 
% grid on;
% ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
% 
% xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]); 
% ylim([3 9]);
% set(gca,'YTick',[3:3:9]);

%% Hub-height wind speed and effective wind speed estimation
figure(3)
sgtitle('\rm\fontname{Times New Roman}WindSpeed comparison','Fontsize',18)

set(gcf,'unit','centimeters','position',[10 5 40 10]); % 10cm*20cm
subplot(2,3,1)
plot(simout_1.Time(Nstart:Nend)-Tstart,Vhat.vhat_1(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on;
plot (simout_1.Time(Nstart:Nend)-Tstart,simout_1.Wind1VelX(Nstart:Nend),'Color',"#EDB120",'LineStyle','-.','LineWidth',0.5);
hold on;
plot (out.simout_1.WindEst.time, out.simout_1.WindEst.data,'Color',"#77AC30",'LineStyle','-','LineWidth',2);
titletext = ['\rm\fontname{Times New Roman}FOWT1(7m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% ylim([0 10]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,2)
plot(simout_1.Time(Nstart:Nend)-Tstart,Vhat.vhat_2(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on;
plot (simout_1.Time(Nstart:Nend)-Tstart,simout_2.Wind1VelX(Nstart:Nend),'Color',"#EDB120",'LineStyle','-.','LineWidth',0.5);
hold on;
plot (out.simout_1.WindEst.time, out.simout_2.WindEst.data,'Color',"#77AC30",'LineStyle','-','LineWidth',2);
titletext = ['\rm\fontname{Times New Roman}FOWT2(10m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,3)
plot(simout_1.Time(Nstart:Nend)-Tstart,Vhat.vhat_3(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on;
plot (simout_1.Time(Nstart:Nend)-Tstart,simout_3.Wind1VelX(Nstart:Nend),'Color',"#EDB120",'LineStyle','-.','LineWidth',0.5);
hold on;
plot (out.simout_1.WindEst.time, out.simout_3.WindEst.data,'Color',"#77AC30",'LineStyle','-','LineWidth',2);
titletext = ['\rm\fontname{Times New Roman}FOWT3(13m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,4)
plot(simout_1.Time(Nstart:Nend)-Tstart,Vhat.vhat_4(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on;
plot (simout_1.Time(Nstart:Nend)-Tstart,simout_4.Wind1VelX(Nstart:Nend),'Color',"#EDB120",'LineStyle','-.','LineWidth',0.5);
hold on;
plot (out.simout_1.WindEst.time, out.simout_4.WindEst.data,'Color',"#77AC30",'LineStyle','-','LineWidth',2);
titletext = ['\rm\fontname{Times New Roman}FOWT4(16m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,5)
plot(simout_1.Time(Nstart:Nend)-Tstart,Vhat.vhat_5(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on;
plot (simout_1.Time(Nstart:Nend)-Tstart,simout_5.Wind1VelX(Nstart:Nend),'Color',"#EDB120",'LineStyle','-.','LineWidth',0.5);
hold on;
plot (out.simout_1.WindEst.time, out.simout_5.WindEst.data,'Color',"#77AC30",'LineStyle','-','LineWidth',2);
titletext = ['\rm\fontname{Times New Roman}FOWT5(19m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)


legend('\rm\fontname{Times New Roman}OpenFast Estimator',...
       '\rm\fontname{Times New Roman}InFlow Wind',...
       '\rm\fontname{Times New Roman}LoFT Filter',...
       'NumColumns',1 ,'Location','Southeast');  %图例

%% Rotor Speed
figure(4)
sgtitle('\rm\fontname{Times New Roman}RotSpeed comparison','Fontsize',18)

set(gcf,'unit','centimeters','position',[10 5 40 10]); % 10cm*20cm
subplot(2,3,1)
plot(simout_1.Time(Nstart:Nend)-Tstart,simout_1.RotSpeed(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_1.RotSpeed.time,out.simout_1.RotSpeed.data*30/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT1(7m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)


subplot(2,3,2)
plot(simout_2.Time(Nstart:Nend)-Tstart,simout_2.RotSpeed(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_2.RotSpeed.time,out.simout_2.RotSpeed.data*30/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT2(10m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,3)
plot(simout_3.Time(Nstart:Nend)-Tstart,simout_3.RotSpeed(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_3.RotSpeed.time,out.simout_3.RotSpeed.data*30/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT3(13m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,4)
plot(simout_4.Time(Nstart:Nend)-Tstart,simout_4.RotSpeed(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_4.RotSpeed.time,out.simout_4.RotSpeed.data*30/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT4(16m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,5)
plot(simout_5.Time(Nstart:Nend)-Tstart,simout_5.RotSpeed(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_5.RotSpeed.time,out.simout_5.RotSpeed.data*30/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT5(19m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)


legend('\rm\fontname{Times New Roman}OpenFast',...
       '\rm\fontname{Times New Roman}LoFT',...
       'NumColumns',2 ,'Location','Southeast');  %图例

%%
figure(10)
sgtitle('\rm\fontname{Times New Roman} RotThrust comparison/(MN)','Fontsize',18)

set(gcf,'unit','centimeters','position',[10 5 40 10]); % 10cm*20cm
subplot(2,3,1)
plot(simout_1.Time(Nstart:Nend)-Tstart,simout_1.RotThrust(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_1.RotThrust.time,out.simout_1.RotThrust.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT1(7m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
ylim([0,2])
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,2)
plot(simout_2.Time(Nstart:Nend)-Tstart,simout_2.RotThrust(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_2.RotThrust.time,out.simout_2.RotThrust.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT2(10m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
ylim([0,4])
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,3)
plot(simout_3.Time(Nstart:Nend)-Tstart,simout_3.RotThrust(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_3.RotThrust.time,out.simout_3.RotThrust.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT3(13m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
ylim([0,4])
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,4)
plot(simout_4.Time(Nstart:Nend)-Tstart,simout_4.RotThrust(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_4.RotThrust.time,out.simout_4.RotThrust.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT4(16m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
ylim([0,4])
% set(gca,'XTick',[0:100:Tend]);
grid on

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,5)
plot(simout_5.Time(Nstart:Nend)-Tstart,simout_5.RotThrust(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_5.RotThrust.time,out.simout_5.RotThrust.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT5(19m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
ylim([0,5])
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)


legend('\rm\fontname{Times New Roman}OpenFast',...
       '\rm\fontname{Times New Roman}LoFT',...
       'NumColumns',2 ,'Location','Southeast');  %图例

%%
figure(5)
sgtitle('\rm\fontname{Times New Roman}PtfmPitch comparison','Fontsize',18)

set(gcf,'unit','centimeters','position',[10 5 40 10]); % 10cm*20cm
subplot(2,3,1)
plot(simout_1.Time(Nstart:Nend)-Tstart,simout_1.PtfmPitch(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_1.PtfmPitch.time,out.simout_1.PtfmPitch.data*180/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT1(7m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
ylim([-1,4])
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,2)
plot(simout_2.Time(Nstart:Nend)-Tstart,simout_2.PtfmPitch(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_2.PtfmPitch.time,out.simout_2.PtfmPitch.data*180/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT2(10m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
ylim([-1,6])
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,3)
plot(simout_3.Time(Nstart:Nend)-Tstart,simout_3.PtfmPitch(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_3.PtfmPitch.time,out.simout_3.PtfmPitch.data*180/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT3(13m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,4)
plot(simout_4.Time(Nstart:Nend)-Tstart,simout_4.PtfmPitch(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_4.PtfmPitch.time,out.simout_4.PtfmPitch.data*180/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT4(16m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,5)
plot(simout_5.Time(Nstart:Nend)-Tstart,simout_5.PtfmPitch(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_5.PtfmPitch.time,out.simout_5.PtfmPitch.data*180/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT5(19m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)


legend('\rm\fontname{Times New Roman}OpenFast',...
       '\rm\fontname{Times New Roman}LoFT',...
       'NumColumns',2 ,'Location','Southeast');  %图例

%%
figure(6)
sgtitle('\rm\fontname{Times New Roman}PtfmSurge comparison','Fontsize',18)

set(gcf,'unit','centimeters','position',[10 5 40 10]); % 10cm*20cm
subplot(2,3,1)
plot(simout_1.Time(Nstart:Nend)-Tstart,simout_1.PtfmSurge(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_1.PtfmSurge.time,out.simout_1.PtfmSurge.data,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT1(7m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,2)
plot(simout_2.Time(Nstart:Nend)-Tstart,simout_2.PtfmSurge(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_2.PtfmSurge.time,out.simout_2.PtfmSurge.data,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT2(10m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,3)
plot(simout_3.Time(Nstart:Nend)-Tstart,simout_3.PtfmSurge(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_3.PtfmSurge.time,out.simout_3.PtfmSurge.data,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT3(13m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,4)
plot(simout_4.Time(Nstart:Nend)-Tstart,simout_4.PtfmSurge(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_4.PtfmSurge.time,out.simout_4.PtfmSurge.data,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT4(16m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,5)
plot(simout_5.Time(Nstart:Nend)-Tstart,simout_5.PtfmSurge(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_5.PtfmSurge.time,out.simout_5.PtfmSurge.data,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT5(19m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)


legend('\rm\fontname{Times New Roman}OpenFast',...
       '\rm\fontname{Times New Roman}LoFT',...
       'NumColumns',2 ,'Location','Southeast');  %图例

%%
figure(7)

set(gcf,'unit','centimeters','position',[10 5 40 10]); % 10cm*20cm
sgtitle('\rm\fontname{Times New Roman}BldPitch comparison','Fontsize',18)

subplot(2,3,1)
plot(simout_1.Time(Nstart:Nend)-Tstart,simout_1.BldPitch1(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_1.BldPitch.time,out.simout_1.BldPitch.data*180/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT1(7m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,2)
plot(simout_2.Time(Nstart:Nend)-Tstart,simout_2.BldPitch1(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_2.BldPitch.time,out.simout_2.BldPitch.data*180/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT2(10m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,3)
plot(simout_3.Time(Nstart:Nend)-Tstart,simout_3.BldPitch1(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_3.BldPitch.time,out.simout_3.BldPitch.data*180/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT3(13m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,4)
plot(simout_4.Time(Nstart:Nend)-Tstart,simout_4.BldPitch1(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_4.BldPitch.time,out.simout_4.BldPitch.data*180/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT4(16m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,5)
plot(simout_5.Time(Nstart:Nend)-Tstart,simout_5.BldPitch1(Nstart:Nend),'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_5.BldPitch.time,out.simout_5.BldPitch.data*180/pi,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT5(19m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)


legend('\rm\fontname{Times New Roman}OpenFast',...
       '\rm\fontname{Times New Roman}LoFT',...
       'NumColumns',2 ,'Location','Southeast');  %图例



%%

figure(8)
sgtitle('\rm\fontname{Times New Roman}GenPwr comparison/MW','Fontsize',18)

set(gcf,'unit','centimeters','position',[10 5 40 10]); % 10cm*20cm
subplot(2,3,1)
plot(simout_1.Time(Nstart:Nend)-Tstart,simout_1.GenPwr(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_1.GenPwr.time,out.simout_1.GenPwr.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT1(7m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,2)
plot(simout_2.Time(Nstart:Nend)-Tstart,simout_2.GenPwr(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_2.GenPwr.time,out.simout_2.GenPwr.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT2(10m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,3)
plot(simout_3.Time(Nstart:Nend)-Tstart,simout_3.GenPwr(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_3.GenPwr.time,out.simout_3.GenPwr.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT3(13m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,4)
plot(simout_4.Time(Nstart:Nend)-Tstart,simout_4.GenPwr(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_4.GenPwr.time,out.simout_4.GenPwr.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT4(16m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,5)
plot(simout_5.Time(Nstart:Nend)-Tstart,simout_5.GenPwr(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_5.GenPwr.time,out.simout_5.GenPwr.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT5(19m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)


legend('\rm\fontname{Times New Roman}OpenFast',...
       '\rm\fontname{Times New Roman}LoFT',...
       'NumColumns',2 ,'Location','Southeast');  %图例

%%
figure(9)
sgtitle('\rm\fontname{Times New Roman}GenTorq comparison/(MN·m)','Fontsize',18)

set(gcf,'unit','centimeters','position',[10 5 40 10]); % 10cm*20cm
subplot(2,3,1)
plot(simout_1.Time(Nstart:Nend)-Tstart,simout_1.GenTq(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_1.GenTorq.time,out.simout_1.GenTorq.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT1(7m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,2)
plot(simout_2.Time(Nstart:Nend)-Tstart,simout_2.GenTq(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_2.GenTorq.time,out.simout_2.GenTorq.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT2(10m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,3)
plot(simout_3.Time(Nstart:Nend)-Tstart,simout_3.GenTq(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_3.GenTorq.time,out.simout_3.GenTorq.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT3(13m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,4)
plot(simout_4.Time(Nstart:Nend)-Tstart,simout_4.GenTq(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_4.GenTorq.time,out.simout_4.GenTorq.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT4(16m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)

subplot(2,3,5)
plot(simout_5.Time(Nstart:Nend)-Tstart,simout_5.GenTq(Nstart:Nend)/1e3,'Color','#0000FF','LineStyle','-','LineWidth',2);
hold on
plot(out.simout_5.GenTorq.time,out.simout_5.GenTorq.data/1e6,'Color',"#77AC30",'LineStyle','-.','LineWidth',2);
hold on
titletext = ['\rm\fontname{Times New Roman}FOWT5(19m/s)'];
title(titletext)
xlim([0 Tend-Tstart]);
% set(gca,'XTick',[0:100:Tend]);
grid on
ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
set(gca,'FontName','Times New Roman','FontSize',14,'LineWid',2);  %图中的字
title(titletext,'fontsize', 16)


legend('\rm\fontname{Times New Roman}OpenFast',...
       '\rm\fontname{Times New Roman}LoFT',...
       'NumColumns',2 ,'Location','Southeast');  %图例


