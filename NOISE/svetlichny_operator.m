function S = svetlichny_operator(angles, sigma_x, sigma_z)
    phi_B = angles(1);
    phi_B_prime = angles(2);
    phi_C = angles(3);
    phi_C_prime = angles(4);

    % 定义测量算子
    A1 = cos(phi_B) * sigma_x + sin(phi_B) * sigma_z;
    A2 = cos(phi_B_prime) * sigma_x + sin(phi_B_prime) * sigma_z;

    B1 = cos(phi_B) * sigma_x + sin(phi_B) * sigma_z;
    B2 = cos(phi_B_prime) * sigma_x + sin(phi_B_prime) * sigma_z;

    C1 = cos(phi_C) * sigma_x + sin(phi_C) * sigma_z;
    C2 = cos(phi_C_prime) * sigma_x + sin(phi_C_prime) * sigma_z;

    % 构造Svetlichny算子
    S = kron(kron(A1, B1), C1) + kron(kron(A1, B1), C2) + ...
        kron(kron(A1, B2), C1) + kron(kron(A2, B1), C1) - ...
        kron(kron(A1, B2), C2) - kron(kron(A2, B1), C2) - ...
        kron(kron(A2, B2), C1) - kron(kron(A2, B2), C2);
end