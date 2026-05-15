clc
clear

theta=[linspace(0,pi/12),linspace(pi/12,pi/8),linspace(pi/8,pi/4),linspace(pi/4,pi/2-pi/12),linspace(pi/2-pi/12,pi/2)];
%%
p=1;
pb=1;
 
[L,S]=GHZ1_LS(theta,p,pb); 
    
figure('Units', 'centimeters', 'Position', [0, 0, 8.5, 4.5]); % 设置图形大小为宽 3.5cm、高 8.5cm
h0=plot(theta,L,'LineStyle','--','Color',[.82 .33 .09],'linewidth',1');

%%
p=0.95;
pb=1;
[L,S]=GHZ1_LS(theta,p,pb); 
hold on
h1=plot(theta,L,'LineStyle','--','Color',[.04 .29 .45],'linewidth',1');



%%
p=0.88;
pb=1;
[L,S]=GHZ1_LS(theta,p,pb); 
hold on
h2=plot(theta,L,'LineStyle','--','Color',[.28 .47 .03],'linewidth',1');
%%
set(gca,'linewidth',1,'FontName', 'Arial');
yline(1,'linewidth',1)
xlabel('\theta');
 legend([h0,h1,h2],{'v=1','v=0.95','v=0.88'});
set(gca, 'xtick', [0,  pi/8, pi/4, 3*pi/8, pi/2]);
set(gca, 'xticklabel', {'0','$ \frac{\pi}{8}$','$\frac{\pi}{4}$','$\frac{3\pi}{8}$','$\frac{\pi}{2}$'}, 'TickLabelInterpreter', 'latex')
ylim([0.8,1.2])

