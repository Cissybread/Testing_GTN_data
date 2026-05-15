clc
clear
figure('Units', 'centimeters', 'Position', [0, 0, 8.5, 3.5]); % 设置图形大小为宽 3.5cm、高 8.5cm
load('L_25.mat');

% 使用左 y 轴绘制前五个数据条形
yyaxis left
b = bar(1:5, [s00_mean, s01_mean, s10_mean, s11_mean, ss_mean], 'FaceColor', 'flat','EdgeColor', 'w');
b.CData = repmat([.23 .5 .68], 5, 1); % 设置前五个条形的颜色
% ylabel('左 Y 轴标签');

% 设置左 y 轴的范围
ylim_left = [-0.06, 0.088]; % 根据数据范围调整
ylim(ylim_left);
ax = gca;
ax.YColor = 'k'; % 设置左 y 轴刻度和标签为黑色

% 使用右 y 轴绘制最后一个数据条形（第6个条形）
yyaxis right
b_last = bar(6, L_mean-1, 'FaceColor', [.82 .33 .09],'EdgeColor', 'w'); % 设置最后一个条形的颜色
% ylabel('右 Y 轴标签');

% 设置右 y 轴的范围
ylim_right = [-0.06/0.088*0.135, 0.135]; % 根据数据范围调整
ylim(ylim_right);
ax.YColor = 'k'; % 设置左 y 轴刻度和标签为黑色

% 绘制误差条
hold on;

% 使用左 y 轴绘制前五个数据的误差条
yyaxis left
errorbar(1:5, [s00_mean, s01_mean, s10_mean, s11_mean, ss_mean], ...
         [s00_error, s01_error, s10_error, s11_error, ss_error], ...
         '.', 'Color', 'black');

% 使用右 y 轴绘制最后一个数据的误差条
yyaxis right
errorbar(6, L_mean-1, L_error, '.', 'Color', 'black');

% 设置 x 轴标签并使用 LaTeX 解释器。
set(gca, 'xtick', 1:6, 'xticklabel', ...
    {'${\left<A_0D{\hat{C}}_{\hat{0}}\right>}$', '${\left<A_0D{\hat{C}}_{\hat{1}}\right>}$', ...
     '${\left<A_1D{\hat{C}}_{\hat{0}}\right>}$', '${\left<A_1D{\hat{C}}_{\hat{1}}\right>}$', ...
     '${\left<D\right>}$', '$\frac{L_1}{L_2}-1$'}, ...
     'TickLabelInterpreter', 'latex');

% % 添加标题并使用 LaTeX 解释器
% title('$L(\theta=\frac{2pi}{5}, v=0.94)$', 'Interpreter', 'latex');

% 设置图形属性
set(gca, 'LineWidth', 1,'FontName', 'Arial');
yline(0, 'LineWidth', 1); % 在 y = 0 处绘制水平线
hold off;
