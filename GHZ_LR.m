clc
clear
theta=[linspace(0,pi/12),linspace(pi/12,pi/8),linspace(pi/8,pi/4),linspace(pi/4,pi/2-pi/12),linspace(pi/2-pi/12,pi/2)];
p=1;
for n=1:size(theta,2)
    state=[cos(theta(n));0;0;0;0;0;0;sin(theta(n))];
    pro0=state*state';
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
plot(theta,L,'LineStyle','-','Color',[.82 .33 .09],'linewidth',1')
hold on
plot(theta,S,'LineStyle','--','Color',[.82 .33 .09],'linewidth',1')



theta1=[pi/4,pi/8,pi/12];
load('L_pi_4.mat');
L11_mean(1)=L_mean;L11_error(1)=L_error;
LL11_mean(1)=LL_mean;LL11_error(1)=LL_error;
load('L_pi_8.mat');
L11_mean(2)=L_mean;L11_error(2)=L_error;
LL11_mean(2)=LL_mean;LL11_error(2)=LL_error;
load('L_pi_12.mat');
L11_mean(3)=L_mean;L11_error(3)=L_error;
LL11_mean(3)=LL_mean;LL11_error(3)=LL_error;
hold on
h1=errorbar(theta1,L11_mean,L11_error,'o','MarkerSize', 3,'MarkerEdgeColor', [.82 .33 .09],'MarkerFaceColor', [.82 .33 .09],'Color',[.82 .33 .09],'linewidth',1');
set(gca, 'xtick', [0,  pi/8, pi/4, 3*pi/8, pi/2]);
set(gca, 'xticklabel', {'0','$ \frac{\pi}{8}$','$\frac{\pi}{4}$','$\frac{3\pi}{8}$','$\frac{\pi}{2}$'}, 'TickLabelInterpreter', 'latex')


load('S1_pi_4.mat')
S11_mean(1)=S1_mean; S11_error(1)=S1_error;
load('S1_pi_8.mat')
S11_mean(2)=S1_mean; S11_error(2)=S1_error;
load('S1_pi_12.mat')
S11_mean(3)=S1_mean; S11_error(3)=S1_error;
hold on
h2=errorbar(theta1,S11_mean/4,S11_error/4,'^','MarkerSize', 3,'MarkerEdgeColor', [.82 .33 .09],'MarkerFaceColor', [.82 .33 .09],'Color',[.82 .33 .09],'linewidth',1');

% 设置阴影颜色
shadeColor1 = [0.35 0.35 0.35];
shadeColor2 = [0.65 0.65 0.65];% 浅灰色
shadeAlpha = 0.3;           % 透明度

% 绘制 theta 在 0 到 pi/12 范围内的阴影
hold on
%fill([0 pi/12 pi/12 0], [0.8 0.8 1.45 1.45], shadeColor1, 'FaceAlpha', shadeAlpha, 'EdgeColor', 'none');

% 绘制 theta 在 0 到 pi/8 范围内的阴影
fill([0 pi/8 pi/8 0], [0.8 0.8 1.45 1.45], shadeColor2, 'FaceAlpha', shadeAlpha, 'EdgeColor', 'none');

%fill([pi/2-pi/12 pi/2 pi/2 pi/2-pi/12], [0.8 0.8 1.45 1.45], shadeColor1, 'FaceAlpha', shadeAlpha, 'EdgeColor', 'none');

% 绘制 theta 在 0 到 pi/8 范围内的阴影
fill([pi/2-pi/8 pi/2 pi/2 pi/2-pi/8], [0.8 0.8 1.45 1.45], shadeColor2, 'FaceAlpha', shadeAlpha, 'EdgeColor', 'none');


%title('$\frac{\mathcal{L} _3}{\mathcal{R} _3}(v=1)\frac{\mathcal{L} _3}{\mathcal{R} _3}(v=0.95)\frac{S}{4}(v=1)\frac{S}{4}(v=0.95)$','interpreter','latex')
set(gca,'linewidth',1,'FontName', 'Arial');
yline(1,'linewidth',1)
xlabel('\theta');
ylim([0.8,1.45])
legend([h1 h2]);