clc
clear
theta=[linspace(pi/4+0.00001,acos(1/sqrt(3))),linspace(acos(1/sqrt(3)),2*pi/5),linspace(2*pi/5,pi/2-0.00001)];
p=1;
[L0]=W1_LS(theta,p);
%%
figure('Units', 'centimeters', 'Position', [0, 0, 8.5, 4.5]); 
h0=plot(theta,L0,'LineStyle','--','Color',[.82 .33 .09],'linewidth',1');

p=0.95;
[L1]=W1_LS(theta,p);
hold on
h1=plot(theta,L1,'LineStyle','--','Color',[.04 .29 .45],'linewidth',1');


p=0.77;
[L2]=W1_LS(theta,p);
hold on
h2=plot(theta,L2,'LineStyle','--','Color',[.28 .47 .03],'linewidth',1');
set(gca, 'xtick', [4*pi/16, 5*pi/16,6*pi/16, 7*pi/16, 8*pi/16]);
set(gca, 'xticklabel', {'$\frac{\pi}{4}$','$\frac{5\pi}{16}$','$\frac{3\pi}{8}$','$\frac{7\pi}{16}$','$\frac{\pi}{2}$'}, 'TickLabelInterpreter', 'latex')
set(gca,'linewidth',1);

yline(1,'linewidth',1)
ylim([0.8,1.2])
xlim([pi/4,pi/2])
xlabel('\theta');
legend([h0,h1,h2],{'p=1','p=0.95','p=0.77'});

t=p*(p-(-1+p)*sqrt(-cos(2*theta))).*sec(theta);

