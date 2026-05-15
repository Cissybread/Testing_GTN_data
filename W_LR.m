clc
clear
theta=[linspace(pi/4+0.00001,acos(1/sqrt(3))),linspace(acos(1/sqrt(3)),2*pi/5),linspace(2*pi/5,pi/2-0.00001)];
for n=1:size(theta,2)
     state=[0;cos(theta(n));cos(theta(n));0;sqrt(1-2*cos(theta(n))^2);0;0;0];
    pro0=(state*state');
    pro=kron(pro0,pro0);
    sigmax=[0 1;1 0];
    sigmaz=[1 0;0 -1];
    sigmay=[0 -1i;1i 0];
        mx(:,:,1)=[1;0]*[1;0]';
    BSM(:,:,1)=1/2*[1;0;0;1]*[1;0;0;1]';
    A0=sigmax;
    A1=sigmay;
    C0=1/sqrt(2)*(sigmax-sigmay);
    C1=1/sqrt(2)*(sigmax+sigmay);
    
    s00(n)=trace(kron(kron(kron(kron(A0,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C0)*pro);
    s01(n)=trace(kron(kron(kron(kron(A0,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C1)*pro);
    s10(n)=trace(kron(kron(kron(kron(A1,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C0)*pro);
    s11(n)=trace(kron(kron(kron(kron(A1,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C1)*pro);
    ss(n)=trace(kron(kron(kron(kron(eye(2),mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),eye(2))*pro);
    
    
    L1(n)=s00(n)+s01(n)+s10(n)-s11(n);
    L2(n)=2.5*ss(n);
    L(n)=L1(n)/L2(n);
    theta0= theta(n);
objective = @(x) -S_function(x, theta0);

% 初始值 [a1, b1, c1, a2, b2, c2]
x0 = [pi/2,pi/2,pi/2,pi/2,pi/2,pi/2];  % 可以根据需要调整初始猜测值

% 设置约束条件 (这里没有具体约束，所以用空矩阵)
lb = [-2*pi,-2*pi,-2*pi,-2*pi,-2*pi,-2*pi];  % 下边界
ub = [2*pi,2*pi,2*pi,2*pi,2*pi,2*pi,];  % 上边界
A = []; b = []; Aeq = []; beq = [];

% 调用fmincon进行优化
options = optimoptions('fmincon', 'Display', 'iter', 'Algorithm', 'sqp');
[x_opt(:,:,n), fval(n)] = fmincon(objective, x0, A, b, Aeq, beq, lb, ub, [], options);
  S(n)= -fval(n)/4 ; 
end
%%
figure('Units', 'centimeters', 'Position', [0, 0, 8.5, 4.5]); % 设置图形大小为宽 3.5cm、高 8.5cm
plot(theta,L,'LineStyle','-','Color',[.82 .33 .09],'linewidth',1')
hold on
plot(theta,S,'LineStyle','--','Color',[.82 .33 .09],'linewidth',1')




theta1=[acos(1/sqrt(3)),2*pi/5];
load('L_A1S3.mat');
L11_mean(1)=L_mean;L11_error(1)=L_error;
LL11_mean(1)=LL_mean;LL11_error(1)=LL_error;
load('L_25.mat');
L11_mean(2)=L_mean;L11_error(2)=L_error;
LL11_mean(2)=LL_mean;LL11_error(2)=LL_error;
hold on

errorbar(theta1,L11_mean,L11_error,'o','MarkerSize', 3,'MarkerEdgeColor', [.82 .33 .09],'MarkerFaceColor', [.82 .33 .09],'Color',[.82 .33 .09],'linewidth',1');


set(gca, 'xtick', [4*pi/16, acos(1/sqrt(3)),2*pi/5, 8*pi/16]);
set(gca, 'xticklabel', {'$\frac{\pi}{4}$','$arccos\frac{1}{\sqrt{3}}$','$\frac{2\pi}{5}$','$\frac{\pi}{2}$'}, 'TickLabelInterpreter', 'latex')




load('S1_1_3.mat')
S11_mean(1)=S1_mean; S11_error(1)=S1_error;
load('S1_2_5.mat')
S11_mean(2)=S1_mean; S11_error(2)=S1_error;
hold on

errorbar(theta1,S11_mean/4,S11_error/4,'^','MarkerSize', 3,'MarkerEdgeColor', [.82 .33 .09],'MarkerFaceColor', [.82 .33 .09],'Color',[.82 .33 .09],'linewidth',1');




shadeColor1 = [0.35 0.35 0.35];
shadeColor2 = [0.65 0.65 0.65];% 浅灰色
shadeAlpha = 0.3;           % 透明度


hold on
fill([1.2083 pi/2 pi/2 1.2083], [0.8 0.8 1.45 1.45], shadeColor2, 'FaceAlpha', shadeAlpha, 'EdgeColor', 'none');
fill([pi/4 pi/4+0.00001111 pi/4+0.00001111 pi/4], [0.8 0.8 1.45 1.45], shadeColor2, 'FaceAlpha', shadeAlpha, 'EdgeColor', 'none');


set(gca,'linewidth',1);

yline(1,'linewidth',1)
ylim([0.8,1.45])
xlim([pi/4,pi/2])
xlabel('\theta');
%title('$\frac{L_1}{L_2}$','interpreter','latex')

