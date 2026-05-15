clc
clear
addpath(genpath('E:\SDUicloudCache\张倩茜\科研\code\bao\code1'))
theta=[linspace(pi/4+0.00001,acos(1/sqrt(3))),linspace(acos(1/sqrt(3)),2*pi/5),linspace(2*pi/5,pi/2-0.00001)];
figure('Units', 'centimeters', 'Position', [0, 0, 8.5, 4.5]);
p=0.9491;
for n=1:size(theta,2)
    state=[0;cos(theta(n));cos(theta(n));0;sqrt(1-2*cos(theta(n))^2);0;0;0];
    PN1=[0;cos(theta(n));0;0;0;0;0;0];
    PN2=[0;0;cos(theta(n));0;0;0;0;0];
    PN3=[0;0;0;0;sqrt(1-2*cos(theta(n))^2);0;0;0];
    PN42=[0;0;0;0;sqrt(1-2*cos(theta(n))^2);0;0;0]*[0;0;cos(theta(n));0;0;0;0;0]'+[0;0;cos(theta(n));0;0;0;0;0]*[0;0;0;0;sqrt(1-2*cos(theta(n))^2);0;0;0]';
    PN41=[0;0;0;0;sqrt(1-2*cos(theta(n))^2);0;0;0]*[0;cos(theta(n));0;0;0;0;0;0]'+[0;cos(theta(n));0;0;0;0;0;0]*[0;0;0;0;sqrt(1-2*cos(theta(n))^2);0;0;0]';
    pro1=p*(state*state')+(1-p)*(PN1*PN1'+PN2*PN2'+PN3*PN3'+PN41);
    pro2=p*(state*state')+(1-p)*(PN1*PN1'+PN2*PN2'+PN3*PN3'+PN42);

    pro=kron(pro1,pro2);
    sigmax=[0 1;1 0];
    sigmaz=[1 0;0 -1];
    sigmay=[0 -1i;1i 0];
    mx(:,:,1)=[1;0]*[1;0]';
    BSM(:,:,1)=1/2*[1;0;0;1]*[1;0;0;1]';
    A0=sigmaz;
    A1=sigmax;
    C0=1/sqrt(2)*(sigmaz+sigmax);
    C1=1/sqrt(2)*(sigmaz-sigmax);
    
    s00(n)=trace(kron(kron(kron(kron(A0,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C0)*pro);
    s01(n)=trace(kron(kron(kron(kron(A0,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C1)*pro);
    s10(n)=trace(kron(kron(kron(kron(A1,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C0)*pro);
    s11(n)=trace(kron(kron(kron(kron(A1,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C1)*pro);
    ss(n)=trace(kron(kron(kron(kron(eye(2),mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),eye(2))*pro);
    
    
    L1(n)=s00(n)+s01(n)+s10(n)-s11(n);
    L2(n)=2.5*ss(n);
    LN(n)=L1(n)/L2(n);
    
   

end

plot(theta,LN,'LineStyle','-','Color',[.16 .38 .5],'linewidth',1')
load('S4.mat');
SN1=max_value_W/4;
hold on
plot(theta0,SN1,'LineStyle','--','Color',[.16 .38 .5],'linewidth',1')
hold on

set(gca, 'xtick', [4*pi/16, 5*pi/16,6*pi/16, 7*pi/16, 8*pi/16]);
set(gca, 'xticklabel', {'$\frac{\pi}{4}$','$\frac{5\pi}{16}$','$\frac{3\pi}{8}$','$\frac{7\pi}{16}$','$\frac{\pi}{2}$'}, 'TickLabelInterpreter', 'latex')

theta1N=[acos(1/sqrt(3)),2*pi/5];
load('13\L_13.mat');
LN11_mean(1)=L_mean;LN11_error(1)=L_error;
load('25\L_25.mat');
LN11_mean(2)=L_mean;LN11_error(2)=L_error;
hold on
errorbar(theta1N,LN11_mean,LN11_error,'o','MarkerSize', 3,'MarkerEdgeColor', [.16 .38 .5],'MarkerFaceColor', [.16 .38 .5],'Color',[.16 .38 .5],'linewidth',1');
load('13\ss2.mat')
SN11_mean(1)=S1_mean; SN11_error(1)=S1_error;
load('25\ss2.mat')
SN11_mean(2)=S1_mean; SN11_error(2)=S1_error;
hold on
errorbar(theta1N,SN11_mean/4,SN11_error/4,'^','MarkerSize', 3,'MarkerEdgeColor', [.16 .38 .5],'MarkerFaceColor', [.16 .38 .5],'Color',[.16 .38 .5],'linewidth',1');


set(gca,'linewidth',1);

yline(1,'linewidth',1)
ylim([0.8,1.45])
xlim([pi/4,pi/2])
xlabel('\theta');