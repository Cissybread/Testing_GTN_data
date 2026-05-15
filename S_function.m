% 定义S函数
function S = S_function(x, theta)
    % 从输入向量 x 提取变量
    a1 = x(1);
    b1 = x(2);
    c1 = x(3);
    a2 = x(4);
    b2 = x(5);
    c2 = x(6);

    % 计算 ta, tb, tc 和 ta1, tb1, tc1
    ta = (a1 + a2) / 2;
    tb = (b1 + b2) / 2;
    tc = (c1 + c2) / 2;
    ta1 = (a1 - a2) / 2;
    tb1 = (b1 - b2) / 2;
    tc1 = (c1 - c2) / 2;

    % 相关常量
    c12 = 2*cos(theta)^2;
    c23 = 2*cos(theta)*sqrt(1 - 2*cos(theta)^2);
    c31 = 2*cos(theta)*sqrt(1 - 2*cos(theta)^2);

    % G 函数
    G = sin(ta1 + tb1 + tc1) + sin(ta1 + tb1 - tc1) + sin(ta1 - tb1 + tc1) + sin(ta1 - tb1 - tc1);

    % S 的表达式
    S = 1/2 * ((-1 - c31 - c12 - c23) * sin(ta + tb + tc) * (G - 2*sin(ta1 - tb1 - tc1)) ...
       + (-1 + c31 + c12 - c23) * sin(ta + tb - tc) * (G - 2*sin(ta1 - tb1 + tc1)) ...
       + (-1 - c31 + c12 + c23) * sin(ta - tb + tc) * (G - 2*sin(ta1 + tb1 - tc1)) ...
       + (-1 + c31 - c12 + c23) * sin(ta - tb - tc) * (G - 2*sin(ta1 + tb1 + tc1)));
end