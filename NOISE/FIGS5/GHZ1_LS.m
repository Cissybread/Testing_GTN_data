function [L,S]=GHZ1_LS(theta,p,pb)
for n=1:size(theta,2)
    state=[cos(theta(n));0;0;0;0;0;0;sin(theta(n))];
    PN1=[cos(theta(n));0;0;0;0;0;0;0];
    PN2=[0;0;0;0;0;0;0;sin(theta(n))];
    PN1b=[cos(theta(n));0;0;0];
    PN2b=[0;0;0;sin(theta(n))];
    pro0=p*(state*state')+(1-p)*(PN1*PN1'+PN2*PN2');
    pro=kron(pro0,pro0);
    sigmax=[0 1;1 0];
    sigmaz=[1 0;0 -1];
    sigmay=[0 -1i;1i 0];

%% 2
    mx(:,:,1)=[sin(theta(n));cos(theta(n))]*[sin(theta(n));cos(theta(n))]';%(瀵逛簬骞夸箟GHZ鎬侊紙绾?侊級鐨凜鍜孊(hat)鐨勬渶浼樻祴閲?)
    BSM(:,:,1)=pb*1/2*[1;0;0;1]*[1;0;0;1]'+(1-pb)*(PN1b*PN1b'+PN2b*PN2b');%(瀵逛簬骞夸箟GHZ鎬侊紙绾?侊級鐨凚鍜孉(hat)鐨勬渶浼樻祴閲?)
    A0=sigmaz;
    A1=sigmax;
    C0=1/sqrt(2)*(sigmaz+sigmax);
    C1=1/sqrt(2)*(sigmaz-sigmax);

    s00(n)=trace(kron(kron(kron(kron(A0,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C0)*pro);
    s01(n)=trace(kron(kron(kron(kron(A0,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C1)*pro);
    s10(n)=trace(kron(kron(kron(kron(A1,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C0)*pro);
    s11(n)=trace(kron(kron(kron(kron(A1,mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),C1)*pro);
    ss(n)=trace(kron(kron(kron(kron(eye(2),mx(:,:,1)),BSM(:,:,1)),mx(:,:,1)),eye(2))*pro);
    
    
    L1(n)=s00(n)+s01(n)+s10(n)-s11(n);
    L2(n)=2.5*ss(n);
    L(n)=L1(n)/L2(n);
  
     if 3*sin(2*theta(n))^2>=1
        A0=sigmaz;
        A1=sigmax;
        B0=1/sqrt(2)*(sigmaz+sigmay);
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
end
    


