clc
clear

load('CC4500.mat');

data00=CC4500;

load('CC4510.mat');
data10=CC4510;

load('CC4501.mat');
data01=CC4501;

 load('CC4511.mat');
data11=CC4511;

load('CC45112.mat');
data112=CC45112;
N11=sum(data11)+sum(data112);
Nn00=sum(data00);Nn01=sum(data01);Nn10=sum(data10);Nn11=sum(data11);

dp00_0(1,1)=data00(1)+data00(4);dp00_0(1,2)=data00(5)+data00(8);dp00_0(2,1)=data00(33)+data00(36);dp00_0(2,2)=data00(37)+data00(40);
dp10_0(1,1)=data10(1)+data10(4);dp10_0(1,2)=data10(5)+data10(8);dp10_0(2,1)=data10(33)+data10(36);dp10_0(2,2)=data10(37)+data10(40);
dp01_0(1,1)=data01(1)+data01(4);dp01_0(1,2)=data01(5)+data01(8);dp01_0(2,1)=data01(33)+data01(36);dp01_0(2,2)=data01(37)+data01(40);
dp11_0(1,1)=data11(1)+data11(4);dp11_0(1,2)=data11(5)+data11(8);dp11_0(2,1)=data11(33)+data11(36);dp11_0(2,2)=data11(37)+data11(40);

for N=1:100
    dp00=poissrnd(dp00_0);dp01=poissrnd(dp01_0);dp10=poissrnd(dp10_0);dp11=poissrnd(dp11_0);
    Npn00=poissrnd(Nn00);Npn01=poissrnd(Nn01);Npn10=poissrnd(Nn10);Npn11=poissrnd(Nn11);Np11=poissrnd(N11);
    Np00=Npn00/Npn11*Np11;Np01=Npn01/Npn11*Np11;Np10=Npn10/Npn11*Np11;
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
    LL(N)=L1(N)-L2(N);
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
LL_mean=mean(LL);
LL_error=std(LL);



