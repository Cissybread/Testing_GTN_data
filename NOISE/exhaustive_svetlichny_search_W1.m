function current_S = exhaustive_svetlichny_search_W1(theta, p, step, sigma_x, sigma_z)
    % 构造纯态和混合态
    psi = [0; cos(theta); cos(theta); 0; sqrt(1 - 2*cos(theta)^2); 0; 0; 0];
    rho_pure = psi * psi';
    
    rho_mixed = zeros(8);
    rho_mixed(2,2) = cos(theta)^2;
    rho_mixed(3,3) = cos(theta)^2;
    rho_mixed(3,5) = cos(theta) * sqrt(1 - 2*cos(theta)^2);
    rho_mixed(5,3) = rho_mixed(3,5);
    rho_mixed(5,5) = 1 - 2*cos(theta)^2;
    
    rho = p * rho_pure + (1 - p) * rho_mixed;

    % 离散角度空间
    phi_values = 0:step:2*pi;
    num_angles = length(phi_values);
    total_combinations = num_angles^4;

    % 一维存储结果，避免 parfor 写入多维数组
    S_linear = zeros(total_combinations, 1);

    parfor idx = 1:total_combinations
        [i1, i2, i3, i4] = ind2sub([num_angles, num_angles, num_angles, num_angles], idx);

        phi_B = phi_values(i1);
        phi_B_prime = phi_values(i2);
        phi_C = phi_values(i3);
        phi_C_prime = phi_values(i4);

        S = svetlichny_operator([phi_B, phi_B_prime, phi_C, phi_C_prime], sigma_x, sigma_z);
        S_linear(idx) = real(trace(rho * S));
    end

    % 转换为 4 维数组
    current_S = reshape(S_linear, [num_angles, num_angles, num_angles, num_angles]);
end
