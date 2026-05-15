clear, clc
if isempty(gcp('nocreate'))
    parpool;  % 启动默认并行池
end

   sigma_x = [1 0;0 -1];
    sigma_z =[0 1;1 0];
p = 0.94;   % 示例值
% step1 = pi/(32*2);
% step = pi/32;   % 离散化步
step1 =0.01;
step =0.05;   % 离散化步
theta0=pi/4:step1:6.5*pi/16;
N=size(theta0);

 for n=1:N(1,2)
%%%%%%% find W state
theta=pi/4+step1*(n-1);
S_W = exhaustive_svetlichny_search_W1(theta, p, step,sigma_x,sigma_z);
[max_value_W(n), linear_idx] = max(S_W(:));  % 找到全局最大值及其线性索引
[i,j, k, s] = ind2sub(size(S_W), linear_idx);  % 将线性索引转换为多维索引

fprintf('%f\nW态的角度: (theta=%d)\n', theta);
fprintf('最大值: %f\n对应的索引: (i=%d, j=%d, k=%d, s=%d)\n', max_value_W(n), i, j, k, s);
 end