clc
clear
theta=[linspace(0,pi/12),linspace(pi/12,pi/8),linspace(pi/8,pi/4),linspace(pi/4,pi/2-pi/12),linspace(pi/2-pi/12,pi/2)];
p=1;
for n=1:size(theta,2)
    state=[cos(theta(n));0;0;0;0;0;0;sin(theta(n))];
    PN1=[cos(theta(n));0;0;0;0;0;0;0];
    PN2=[0;0;0;0;0;0;0;sin(theta(n))];
    pro0=p*(state*state')+(1-p)*(PN1*PN1'+PN2*PN2');
    pro=kron(pro0,pro0);
    sigmax=[0 1;1 0];
    sigmaz=[1 0;0 -1];
    sigmay=[0 -1i;1i 0];
    mx(:,:,1)=[sin(pi/4);cos(pi/4)]*[sin(pi/4);cos(pi/4)]';
    BSM(:,:,1)=1/2*[0;1;1;0]*[0;1;1;0]';
    A0=sigmay;
    A1=sigmax;
    C0=1/sqrt(2)*(sigmax+sigmay);
    C1=1/sqrt(2)*(sigmay-sigmax);
    
    s00(n)=trace(kron(kron(kron(kron(A0,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C0)*pro);
    s01(n)=trace(kron(kron(kron(kron(A0,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C1)*pro);
    s10(n)=trace(kron(kron(kron(kron(A1,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C0)*pro);
    s11(n)=trace(kron(kron(kron(kron(A1,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C1)*pro);
    ss(n)=trace(kron(kron(kron(kron(eye(2),mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),eye(2))*pro);
    
    
    L1(n)=s00(n)+s01(n)+s10(n)-s11(n);
    L2(n)=2.5*ss(n);
    L(n)=L1(n)/L2(n);
    A0=sigmay;
    A1=sigmax;
    B0=sigmay;
    B1=sigmax;
    C0=sigmay;
    C1=sigmax;
    M(n)=abs(trace(kron(A0,kron(B0,C1))*pro0)+trace(kron(A0,kron(B1,C0))*pro0)+trace(kron(A1,kron(B0,C0))*pro0)-trace(kron(A1,kron(B1,C1))*pro0))/2;

    if 3*sin(2*theta(n))^2>=1
        A0=sigmay;
        A1=sigmax;
        B0=1/sqrt(2)*(sigmax+sigmay);
        B1=1/sqrt(2)*(sigmax-sigmay);
        C0=sigmay;
        C1=sigmax;
    else
        A0=sigmaz;
        A1=sigmaz;
        B0=sigmaz;
        B1=-sigmaz;
        C0=-sigmaz;
        C1=-sigmaz;
    end
    
    S(n)=abs(-trace(kron(A0,kron(B0,C0))*pro0)-trace(kron(A0,kron(B0,C1))*pro0)-trace(kron(A0,kron(B1,C0))*pro0)+trace(kron(A0,kron(B1,C1))*pro0)-trace(kron(A1,kron(B0,C0))*pro0)+trace(kron(A1,kron(B0,C1))*pro0)+trace(kron(A1,kron(B1,C0))*pro0)+trace(kron(A1,kron(B1,C1))*pro0))/4;
    
    
end
figure('Units', 'centimeters', 'Position', [0, 0, 8.5, 4.5]); % 设置图形大小为宽 3.5cm、高 8.5cm
p=0.9491;
for n=1:size(theta,2)
    state=[cos(theta(n));0;0;0;0;0;0;sin(theta(n))];
    PN1=[cos(theta(n));0;0;0;0;0;0;0];
    PN2=[0;0;0;0;0;0;0;sin(theta(n))];
    pro0=p*(state*state')+(1-p)*(PN1*PN1'+PN2*PN2');
    pro=kron(pro0,pro0);
    sigmax=[0 1;1 0];
    sigmaz=[1 0;0 -1];
    sigmay=[0 -1i;1i 0];
    mx(:,:,1)=[sin(theta(n));cos(theta(n))]*[sin(theta(n));cos(theta(n))]';
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

if 3*sin(2*theta(n))^2>=1
        A0=sigmay;
        A1=sigmax;
        B0=1/sqrt(2)*(sigmax+sigmay);
        B1=1/sqrt(2)*(sigmax-sigmay);
        C0=sigmay;
        C1=sigmax;
    else
        A0=sigmaz;
        A1=sigmaz;
        B0=sigmaz;
        B1=-sigmaz;
        C0=-sigmaz;
        C1=-sigmaz;
    end
    
    SN(n)=abs(-trace(kron(A0,kron(B0,C0))*pro0)-trace(kron(A0,kron(B0,C1))*pro0)-trace(kron(A0,kron(B1,C0))*pro0)+trace(kron(A0,kron(B1,C1))*pro0)-trace(kron(A1,kron(B0,C0))*pro0)+trace(kron(A1,kron(B0,C1))*pro0)+trace(kron(A1,kron(B1,C0))*pro0)+trace(kron(A1,kron(B1,C1))*pro0))/4;
   
end
plot(theta,LN,'LineStyle','-','Color',[.16 .38 .5],'linewidth',1')
hold on
plot(theta,SN,'LineStyle','--','Color',[.16 .38 .5],'linewidth',1')
set(gca, 'xtick', [0,  pi/8, pi/4, 3*pi/8, pi/2]);
set(gca, 'xticklabel', {'0','$ \frac{\pi}{8}$','$\frac{\pi}{4}$','$\frac{3\pi}{8}$','$\frac{\pi}{2}$'}, 'TickLabelInterpreter', 'latex')
theta1N=[pi/4,pi/8,pi/12];
load('pi4\L_pi4.mat');
LN11_mean(1)=L_mean;LN11_error(1)=L_error;
load('pi8\L_pi8.mat');
LN11_mean(2)=L_mean;LN11_error(2)=L_error;
load('pi12\L_pi12.mat');
LN11_mean(3)=L_mean;LN11_error(3)=L_error;
hold on
h1=errorbar(theta1N,LN11_mean,LN11_error,'o','MarkerSize', 3,'MarkerEdgeColor', [.16 .38 .5],'MarkerFaceColor', [.16 .38 .5],'Color',[.16 .38 .5],'linewidth',1');



load('pi4\ss1')
SN11_mean(1)=S1_mean; SN11_error(1)=S1_error;
load('pi8\ss1')
SN11_mean(2)=S1_mean; SN11_error(2)=S1_error;
load('pi12\ss1')
SN11_mean(3)=S1_mean; SN11_error(3)=S1_error;
hold on
h2=errorbar(theta1N,SN11_mean/4,SN11_error/4,'^','MarkerSize', 3,'MarkerEdgeColor', [.16 .38 .5],'MarkerFaceColor', [.16 .38 .5],'Color',[.16 .38 .5],'linewidth',1');

set(gca,'linewidth',1,'FontName', 'Arial');
yline(1,'linewidth',1)
xlabel('\theta');
ylim([0.8,1.45])
legend([h1 h2]);