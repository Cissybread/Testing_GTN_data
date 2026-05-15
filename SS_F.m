clc
clear
load('S2_1_3.mat');
figure('Units', 'centimeters', 'Position', [0, 0, 8.5, 6.5]); % 设置图形大小为宽 3.5cm、高 8.5cm
b=bar([ABC000_mean,ABC001_mean,ABC010_mean,ABC011_mean,ABC100_mean,ABC101_mean,ABC110_mean,ABC111_mean,S1_mean/4-1],'EdgeColor', 'w');
b.FaceColor = 'flat';
b.CData(1:8,:) = [[.23 .5 .68];[.23 .5 .68];[.23 .5 .68];[.23 .5 .68];[.23 .5 .68];[.23 .5 .68];[.23 .5 .68];[.23 .5 .68]];
b.CData(9,:) = [.82 .33 .09];
% hold on
% bar([L_mean])
hold on
errorbar([ABC000_mean,ABC001_mean,ABC010_mean,ABC011_mean,ABC100_mean,ABC101_mean,ABC110_mean,ABC111_mean,S1_mean/4-1],[ABC000_error,ABC001_error,ABC010_error,ABC011_error,ABC100_error,ABC101_error,ABC110_error,ABC111_error,S1_error/4],'.','Color','black')
% xticklabels({'A_0B_0C_0','A_0B_0C_1','A_0B_1C_0','A_0B_1C_1','A_1B_0C_0','A_1B_0C_1','A_1B_1C_0','A_1B_1C_1','S/4-1'})
% set(gca, 'xticklabel', {'000','001','010','011','100','101','110','111','S/4-1'}, 'TickLabelInterpreter', 'latex')
set(gca, 'xticklabel', {'${\left<A_0DC_0\right>}$','${\left<A_0B_0C_1\right>}$','${\left<A_0B_1C_0\right>}$','${\left<A_0B_1C_1\right>}$','${\left<A_1B_0C_0\right>}$','${\left<A_1B_0C_1\right>}$','${\left<A_1B_1C_0\right>}$','${\left<A_1B_1C_1\right>}$','$\frac{S}{4}-1$'}, 'TickLabelInterpreter', 'latex')

% xticklabels({'$\hat{A}$','001','010','011','100','101','110','111','S/4-1'})
% title('$S_1(\theta=\pi/4)$','interpreter','latex');
set(gca,'linewidth',1,'FontName', 'Arial');
% set(gca, 'xticklabel', []);
yline(0,'linewidth',1)
set(findall(gcf, '-property', 'FontName'), 'FontName', 'Arial');
% exportgraphics(gcf, 'E:\SDUicloudCache\张倩茜\科研\code\bao\code1\GTN\NOISE\figure\NS\4_2.pdf', ...
%                'ContentType', 'vector');
print(gcf, '-dpdf', '-painters', 'E:\SDUicloudCache\张倩茜\科研\code\bao\code1\GTN\NOISE\figure\NS\13_1.pdf');