clc
clear

load('CC4500.mat');
data00=CC400;
 
load('CC4501.mat');
data01=CC401;

load('CC4510.mat');
data10=CC410;

load('CC4511.mat');
data11=CC411;

load('CC45101.mat');
data101=CC4101;
N10=sum(data10)+sum(data101);
N11=sum(data11)/sum(data10)*N10;N01=sum(data01)/sum(data10)*N10;N00=sum(data00)/sum(data10)*N10;
dp00_0(1,1)=data00(1)+data00(4);dp00_0(1,2)=data00(5)+data00(8);dp00_0(2,1)=data00(17)+data00(20);dp00_0(2,2)=data00(21)+data00(24);
dp10_0(1,1)=data10(1)+data10(4);dp10_0(1,2)=data10(5)+data10(8);dp10_0(2,1)=data10(17)+data10(20);dp10_0(2,2)=data10(21)+data10(24);
dp01_0(1,1)=data01(1)+data01(4);dp01_0(1,2)=data01(5)+data01(8);dp01_0(2,1)=data01(17)+data01(20);dp01_0(2,2)=data01(21)+data01(24);
dp11_0(1,1)=data11(1)+data11(4);dp11_0(1,2)=data11(5)+data11(8);dp11_0(2,1)=data11(17)+data11(20);dp11_0(2,2)=data11(21)+data11(24);

for N=1:100
    dp00=poissrnd(dp00_0);dp01=poissrnd(dp01_0);dp10=poissrnd(dp10_0);dp11=poissrnd(dp11_0);
    Np00=poissrnd(N00);Np01=poissrnd(N01);Np10=poissrnd(N10);Np11=poissrnd(N11);
    dpb=(sum(sum(dp00(:,:)))+sum(sum(dp01(:,:)))+sum(sum(dp10(:,:)))+sum(sum(dp11(:,:))));
    pb=dpb/(Np00+Np01+Np10+Np11);
    p00=dp00/Np00;p01=dp01/Np01;p10=dp10/Np10;p11=dp11/Np11;
    ss(N)=pb;
    s00(N)=p00(1,1)-p00(1,2)-p00(2,1)+p00(2,2);
    s01(N)=p01(1,1)-p01(1,2)-p01(2,1)+p01(2,2);
    s10(N)=p10(1,1)-p10(1,2)-p10(2,1)+p10(2,2);
    s11(N)=p11(1,1)-p11(1,2)-p11(2,1)+p11(2,2);
    L1(N)=s00(N)+s01(N)+s10(N)-s11(N);
    L2(N)=2.5*ss(N);
    L(N)=L1(N)/L2(N);
end
s00_mean=mean(s00);
s00_error=std(s00);
s01_mean=mean(s01);
s01_error=std(s01);
s10_mean=mean(s10);
s10_error=std(s10);
s11_mean=mean(s11);
s11_error=std(s11);
ss_mean=mean(ss);
ss_error=std(ss);
L_mean=mean(L);
L_error=std(L);

