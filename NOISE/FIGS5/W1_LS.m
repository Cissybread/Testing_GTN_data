function [L]=W1_LS(theta,p)
sigmax=[0 1;1 0];
for n=1:size(theta,2)
     state=[0;cos(theta(n));cos(theta(n));0;sqrt(1-2*cos(theta(n))^2);0;0;0];
    PN1=[0;cos(theta(n));0;0;0;0;0;0];
    PN2=[0;0;cos(theta(n));0;0;0;0;0];
    PN3=[0;0;0;0;sqrt(1-2*cos(theta(n))^2);0;0;0];
    PN42=[0;0;0;0;sqrt(1-2*cos(theta(n))^2);0;0;0]*[0;0;cos(theta(n));0;0;0;0;0]'+[0;0;cos(theta(n));0;0;0;0;0]*[0;0;0;0;sqrt(1-2*cos(theta(n))^2);0;0;0]';
    PN41=[0;0;0;0;sqrt(1-2*cos(theta(n))^2);0;0;0]*[0;cos(theta(n));0;0;0;0;0;0]'+[0;cos(theta(n));0;0;0;0;0;0]*[0;0;0;0;sqrt(1-2*cos(theta(n))^2);0;0;0]';
    pro1=p*(state*state')+(1-p)*(PN1*PN1'+PN2*PN2'+PN3*PN3'+PN41);
    pro2=p*(state*state')+(1-p)*(PN1*PN1'+PN2*PN2'+PN3*PN3'+PN42);
    pro=kron(pro1,pro2);
    sigmax=[0 1;1 0];
    sigmaz=[1 0;0 -1];
    sigmay=[0 -1i;1i 0];
    mx(:,:,1)=[1;0]*[1;0]';
    BSM(:,:,1)=1/2*[1;0;0;1]*[1;0;0;1]';
    A0=sigmaz;
    A1=sigmax;
    C0=1/sqrt(2)*(sigmax+sigmaz);
    C1=1/sqrt(2)*(sigmaz-sigmax);
    s00(n)=trace(kron(kron(kron(kron(A0,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C0)*pro);
    s01(n)=trace(kron(kron(kron(kron(A0,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C1)*pro);
    s10(n)=trace(kron(kron(kron(kron(A1,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C0)*pro);
    s11(n)=trace(kron(kron(kron(kron(A1,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C1)*pro);
    ss(n)=trace(kron(kron(kron(kron(eye(2),mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),eye(2))*pro);
    
    
    L1(n)=s00(n)+s01(n)+s10(n)-s11(n);
    L2(n)=2.5*ss(n);
    L(n)=L1(n)/L2(n);

end
