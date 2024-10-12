function [] = PlotWF(Out, Tstart,Tend,Ts)
%% plot the average dynamics of each row of floating wind turbines

Tplot = Tend - Tstart;
Nstart = round(Tstart/Ts) +1;
Nend = round(Tend/Ts)+1;

tout = Out.tout;
GenPwrs = Out.GenPwrs;
RotorSpeeds = Out.RotSpeeds;

%% plot power
figure(101)
width=1440;%宽度，像素数
height=400;%高度
left=200;%距屏幕左下角水平距离
bottom=100;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottom,width,height])%设置图窗大小和位置

subplot(1,2,1)
plot(tout(Nstart:Nend)-Tstart, sum(GenPwrs(Nstart:Nend,1:7)/1e6,2),'LineStyle','-','LineWidth',4)
hold on
plot(tout(Nstart:Nend)-Tstart, sum(GenPwrs(Nstart:Nend,8:14)/1e6,2),'LineStyle','-','LineWidth',4)
plot(tout(Nstart:Nend)-Tstart, sum(GenPwrs(Nstart:Nend,15:21)/1e6,2),'LineStyle','-','LineWidth',4)
plot(tout(Nstart:Nend)-Tstart, sum(GenPwrs(Nstart:Nend,22:28)/1e6,2),'LineStyle','-','LineWidth',4)
plot(tout(Nstart:Nend)-Tstart, sum(GenPwrs(Nstart:Nend,29:35)/1e6,2),'LineStyle','-','LineWidth',4)
% plot(tout(Nstart:Nend)-Tstart, GenPwrs(Nstart:Nend,6)/1e6,'LineStyle','-','LineWidth',4)
% plot(tout(Nstart:Nend)-Tstart, GenPwrs(Nstart:Nend,7)/1e6,'LineStyle','-','LineWidth',4)
set(gca,'FontName','Times New Roman','FontSize',28,'LineWid',4);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
xlim([0 Tend-Tstart])
set(gca,'XTick',[0:0.25*Tplot:Tplot]);
ylim([40,80])
set(gca,'YTick',[40:20:80]);

ylim([30,80])
set(gca,'YTick',[30:25:80]);

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}Power/(MW)')
% 
legend('\rm\fontname{Times new roman}Row1',...
       '\rm\fontname{Times new roman}Row2',...
       '\rm\fontname{Times new roman}Row3',...
       '\rm\fontname{Times new roman}Row4',...
       '\rm\fontname{Times new roman}Row5',...
       'NumColumns',3 ,'Location','southeast');  %图例



subplot(1,2,2)

plot(tout(Nstart:Nend)-Tstart, sum(GenPwrs(Nstart:Nend,36:42)/1e6,2),'LineStyle','-','LineWidth',4,'Color',"#4DBEEE")
hold on
plot(tout(Nstart:Nend)-Tstart, sum(GenPwrs(Nstart:Nend,43:49)/1e6,2),'LineStyle','-','LineWidth',4,'Color',"#A2142F")
plot(tout(Nstart:Nend)-Tstart, sum(GenPwrs(Nstart:Nend,50:56)/1e6,2),'LineStyle','-','LineWidth',4,'Color',"#FF0000")
plot(tout(Nstart:Nend)-Tstart, sum(GenPwrs(Nstart:Nend,57:63)/1e6,2),'LineStyle','-','LineWidth',4,'Color',	"#0000FF")
plot(tout(Nstart:Nend)-Tstart, sum(GenPwrs(Nstart:Nend,64:70)/1e6,2),'LineStyle','-','LineWidth',4,'Color',	"#FF00FF")
% plot(tout(Nstart:Nend)-Tstart, GenPwrs(Nstart:Nend,6)/1e6,'LineStyle','-','LineWidth',4)
% plot(tout(Nstart:Nend)-Tstart, GenPwrs(Nstart:Nend,7)/1e6,'LineStyle','-','LineWidth',4)
set(gca,'FontName','Times New Roman','FontSize',28,'LineWid',4);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
xlim([0 Tend-Tstart])
set(gca,'XTick',[0:0.25*Tplot:Tplot]);
ylim([40,110])
set(gca,'YTick',[40:30:110]);

ylim([30,110])
set(gca,'YTick',[30:40:110]);

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}Power/(MW)')

legend('\rm\fontname{Times new roman}Row6',...
       '\rm\fontname{Times new roman}Row7',...
       '\rm\fontname{Times new roman}Row8',...
       '\rm\fontname{Times new roman}Row9',...
       '\rm\fontname{Times new roman}Row10',...
       'NumColumns',3 ,'Location','southeast');  %图例

%% plot RotSpeeds
figure(102)
width=1440;%宽度，像素数
height=400;%高度
left=200;%距屏幕左下角水平距离
bottom=100;%距屏幕左下角垂直距离
set(gcf,'position',[left,bottom,width,height])%设置图窗大小和位置

subplot(1,2,1)
plot(tout(Nstart:Nend)-Tstart, sum(RotorSpeeds(Nstart:Nend,1:7)/7,2),'LineStyle','-','LineWidth',4)
hold on
plot(tout(Nstart:Nend)-Tstart, sum(RotorSpeeds(Nstart:Nend,8:14)/7,2),'LineStyle','-','LineWidth',4)
plot(tout(Nstart:Nend)-Tstart, sum(RotorSpeeds(Nstart:Nend,15:21)/7,2),'LineStyle','-','LineWidth',4)
plot(tout(Nstart:Nend)-Tstart, sum(RotorSpeeds(Nstart:Nend,22:28)/7,2),'LineStyle','-','LineWidth',4)
plot(tout(Nstart:Nend)-Tstart, sum(RotorSpeeds(Nstart:Nend,29:35)/7,2),'LineStyle','-','LineWidth',4)

set(gca,'FontName','Times New Roman','FontSize',28,'LineWid',4);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
xlim([0 Tend-Tstart])
set(gca,'XTick',[0:0.25*Tplot:Tplot]);

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}Avg. Rot./(rad/s)')
% 
legend('\rm\fontname{Times new roman}Row1',...
       '\rm\fontname{Times new roman}Row2',...
       '\rm\fontname{Times new roman}Row3',...
       '\rm\fontname{Times new roman}Row4',...
       '\rm\fontname{Times new roman}Row5',...
       'NumColumns',3 ,'Location','southeast');  %图例

ylim([0.5,0.8])
set(gca,'YTick',[0.5:0.15:0.8]);

subplot(1,2,2)

plot(tout(Nstart:Nend)-Tstart, sum(RotorSpeeds(Nstart:Nend,36:42)/7,2),'LineStyle','-','LineWidth',4,'Color',"#4DBEEE")
hold on
plot(tout(Nstart:Nend)-Tstart, sum(RotorSpeeds(Nstart:Nend,43:49)/7,2),'LineStyle','-','LineWidth',4,'Color',"#A2142F")
plot(tout(Nstart:Nend)-Tstart, sum(RotorSpeeds(Nstart:Nend,50:56)/7,2),'LineStyle','-','LineWidth',4,'Color',"#FF0000")
plot(tout(Nstart:Nend)-Tstart, sum(RotorSpeeds(Nstart:Nend,57:63)/7,2),'LineStyle','-','LineWidth',4,'Color',	"#0000FF")
plot(tout(Nstart:Nend)-Tstart, sum(RotorSpeeds(Nstart:Nend,64:70)/7,2),'LineStyle','-','LineWidth',4,'Color',	"#FF00FF")

set(gca,'FontName','Times New Roman','FontSize',28,'LineWid',4);  %图中的字
grid on;

ax=gca;ax.GridLineStyle = ':';ax.GridColor = 'black';ax.GridAlpha = 1;  %网格属性
xlim([0 Tend-Tstart])
set(gca,'XTick',[0:0.25*Tplot:Tplot]);

xlabel('\fontname{Times New Roman}Time/s')
ylabel('\fontname{Times New Roman}Avg. Rot./(rad/s)')

ylim([0.5,0.8])
set(gca,'YTick',[0.5:0.15:0.8]);

legend('\rm\fontname{Times new roman}Row6',...
       '\rm\fontname{Times new roman}Row7',...
       '\rm\fontname{Times new roman}Row8',...
       '\rm\fontname{Times new roman}Row9',...
       '\rm\fontname{Times new roman}Row10',...
       'NumColumns',3 ,'Location','southeast');  %图例


end

