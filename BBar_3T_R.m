clc;
clear;
% 设置图形大小
figure('Units', 'centimeters', 'Position', [0, 0, 8, 7]); % 根据需要调整图形大小

% 加载数据
load('C:\Users\mrszh\Desktop\code and data\pi_12\GHZ1_pi_12.mat');

% 生成三维柱状图
b = bar3(rho);

% 设置柱子的颜色与高度相关
for k = 1:length(b)
    zdata = b(k).ZData;       % 获取高度数据
    b(k).CData = zdata;       % 将颜色数据设置为高度数据
    b(k).FaceColor = 'interp'; % 根据CData插值颜色
    b(k).EdgeColor = 'w'; 
    b(k).LineWidth = 0.1;
end

% 自定义颜色映射，从淡蓝色到深紫色渐变

customColormap = [linspace(0.8, 0.23, 256)', linspace(0.8, 0.5, 256)', linspace(0.8, 0.68, 256)'];
colormap(customColormap);
caxis([-0.2, 1]);
set(gca, 'xticklabel', [], 'yticklabel', []);
set(gca,'linewidth',1,'FontName', 'Arial');
p=1;
theta=1*pi/12;
state=[cos(theta);0;0;0;0;0;0;sin(theta)];
rho0 = p*state * state'+(1-p)*([cos(theta);0;0;0;0;0;0;0]*[cos(theta);0;0;0;0;0;0;0]'+[0;0;0;0;0;0;0;sin(theta)]*[0;0;0;0;0;0;0;sin(theta)]');
% p=1;
% state=[0;cos(theta);cos(theta);0;sqrt(1-2*cos(theta)^2);0;0;0];
% % state=[0;sqrt(1-2*cos(theta)^2);cos(theta);0;cos(theta);0;0;0];
% PN1=[0;sqrt(1-2*cos(theta)^2);0;0;0;0;0;0];
% PN2=[0;0;cos(theta);0;0;0;0;0];
% PN3=[0;0;0;0;cos(theta);0;0;0];
% PN42=[0;0;0;0;sqrt(1-2*cos(theta)^2);0;0;0]*[0;0;cos(theta);0;0;0;0;0]'+[0;0;cos(theta);0;0;0;0;0]*[0;0;0;0;sqrt(1-2*cos(theta)^2);0;0;0]';
% PN41=[0;0;0;0;sqrt(1-2*cos(theta)^2);0;0;0]*[0;cos(theta);0;0;0;0;0;0]'+[0;cos(theta);0;0;0;0;0;0]*[0;0;0;0;sqrt(1-2*cos(theta)^2);0;0;0]';
% rho0 =p*(state*state')+(1-p)*(PN1*PN1'+PN2*PN2'+PN3*PN3'+PN42);


hold on
 b0 = bar3(rho0);
for k = 1:length(b0)
    b0(k).FaceColor = 'none';  % 无颜色填充
    b0(k).EdgeColor = 'k';     % 设置边缘颜色为黑色
    b0(k).LineWidth = 2;       % 设置边缘线宽
end
yticks(1:8);
ylim([0.5 8.5])
xticks(1:8);
xlim([0.5 8.5])
zlim([-0.15, 1]);
set(gcf,'PaperPositionMode','auto');