clc
clear
folderPath = 'C:\Users\mrszh\Desktop\code and data\NOISE\13\W1\';
data1=load([folderPath 'ZZZ.txt']);ZZZ=mean(data1(:,15:22));
data1=load([folderPath 'ZZX.txt']);ZZX=mean(data1(:,15:22));
data1=load([folderPath 'ZZY.txt']);ZZY=mean(data1(:,15:22));
data1=load([folderPath 'ZXZ.txt']);ZXZ=mean(data1(:,15:22));
data1=load([folderPath 'ZXX.txt']);ZXX=mean(data1(:,15:22));
data1=load([folderPath 'ZXY.txt']);ZXY=mean(data1(:,15:22));
data1=load([folderPath 'ZYZ.txt']);ZYZ=mean(data1(:,15:22));
data1=load([folderPath 'ZYX.txt']);ZYX=mean(data1(:,15:22));
data1=load([folderPath 'ZYY.txt']);ZYY=mean(data1(:,15:22));
data1=load([folderPath 'XZZ.txt']);XZZ=mean(data1(:,15:22));
data1=load([folderPath 'XZX.txt']);XZX=mean(data1(:,15:22));
data1=load([folderPath 'XZY.txt']);XZY=mean(data1(:,15:22));
data1=load([folderPath 'XXZ.txt']);XXZ=mean(data1(:,15:22));
data1=load([folderPath 'XXX.txt']);XXX=mean(data1(:,15:22));
data1=load([folderPath 'XXY.txt']);XXY=mean(data1(:,15:22));
data1=load([folderPath 'XYZ.txt']);XYZ=mean(data1(:,15:22));
data1=load([folderPath 'XYX.txt']);XYX=mean(data1(:,15:22));
data1=load([folderPath 'XYY.txt']);XYY=mean(data1(:,15:22));
data1=load([folderPath 'YZZ.txt']);YZZ=mean(data1(:,15:22));
data1=load([folderPath 'YZX.txt']);YZX=mean(data1(:,15:22));
data1=load([folderPath 'YZY.txt']);YZY=mean(data1(:,15:22));
data1=load([folderPath 'YXZ.txt']);YXZ=mean(data1(:,15:22));
data1=load([folderPath 'YXX.txt']);YXX=mean(data1(:,15:22));
data1=load([folderPath 'YXY.txt']);YXY=mean(data1(:,15:22));
data1=load([folderPath 'YYZ.txt']);YYZ=mean(data1(:,15:22));
data1=load([folderPath 'YYX.txt']);YYX=mean(data1(:,15:22));
data1=load([folderPath 'YYY.txt']);YYY=mean(data1(:,15:22));
%%
DD=[ZZZ;ZXZ;ZYZ;XZZ;XXZ;XYZ;YZZ;YXZ;YYZ;ZZX;ZXX;ZYX;XZX;XXX;XYX;YZX;YXX;YYX;ZZY;ZXY;ZYY;XZY;XXY;XYY;YZY;YXY;YYY];

DD1(:,1)=DD(:,2);DD1(:,2)=DD(:,4);DD1(:,3)=DD(:,6);DD1(:,4)=DD(:,8);
DD1(:,5)=DD(:,1);DD1(:,6)=DD(:,3);DD1(:,7)=DD(:,5);DD1(:,8)=DD(:,7);
for ii=1:27
    D(8*(ii-1)+1:8*ii)=DD1(ii,:);
end
data01=D';
%%
% Z=[ZZZ,ZZX,ZZY,ZXZ,ZXX,ZXY,ZYZ,ZYX,ZYY];
% X=[XZZ,XZX,XZY,XXZ,XXX,XXY,XYZ,XYX,XYY];
% Y=[YZZ,YZX,YZY,YXZ,YXX,YXY,YYZ,YYX,YYY];
% D=[Z,X,Y]';
% data01=D;
%%
folderPath = 'C:\Users\mrszh\Desktop\code and data\NOISE\13\W2\';
data1=load([folderPath 'ZZZ.txt']);ZZZ=mean(data1(:,23:30));
data1=load([folderPath 'ZZX.txt']);ZZX=mean(data1(:,23:30));
data1=load([folderPath 'ZZY.txt']);ZZY=mean(data1(:,23:30));
data1=load([folderPath 'ZXZ.txt']);ZXZ=mean(data1(:,23:30));
data1=load([folderPath 'ZXX.txt']);ZXX=mean(data1(:,23:30));
data1=load([folderPath 'ZXY.txt']);ZXY=mean(data1(:,23:30));
data1=load([folderPath 'ZYZ.txt']);ZYZ=mean(data1(:,23:30));
data1=load([folderPath 'ZYX.txt']);ZYX=mean(data1(:,23:30));
data1=load([folderPath 'ZYY.txt']);ZYY=mean(data1(:,23:30));
data1=load([folderPath 'XZZ.txt']);XZZ=mean(data1(:,23:30));
data1=load([folderPath 'XZX.txt']);XZX=mean(data1(:,23:30));
data1=load([folderPath 'XZY.txt']);XZY=mean(data1(:,23:30));
data1=load([folderPath 'XXZ.txt']);XXZ=mean(data1(:,23:30));
data1=load([folderPath 'XXX.txt']);XXX=mean(data1(:,23:30));
data1=load([folderPath 'XXY.txt']);XXY=mean(data1(:,23:30));
data1=load([folderPath 'XYZ.txt']);XYZ=mean(data1(:,23:30));
data1=load([folderPath 'XYX.txt']);XYX=mean(data1(:,23:30));
data1=load([folderPath 'XYY.txt']);XYY=mean(data1(:,23:30));
data1=load([folderPath 'YZZ.txt']);YZZ=mean(data1(:,23:30));
data1=load([folderPath 'YZX.txt']);YZX=mean(data1(:,23:30));
data1=load([folderPath 'YZY.txt']);YZY=mean(data1(:,23:30));
data1=load([folderPath 'YXZ.txt']);YXZ=mean(data1(:,23:30));
data1=load([folderPath 'YXX.txt']);YXX=mean(data1(:,23:30));
data1=load([folderPath 'YXY.txt']);YXY=mean(data1(:,23:30));
data1=load([folderPath 'YYZ.txt']);YYZ=mean(data1(:,23:30));
data1=load([folderPath 'YYX.txt']);YYX=mean(data1(:,23:30));
data1=load([folderPath 'YYY.txt']);YYY=mean(data1(:,23:30));
%%
DD=[ZZZ;ZXZ;ZYZ;ZZX;ZXX;ZYX;ZZY;ZXY;ZYY;...
    XZZ;XXZ;XYZ;XZX;XXX;XYX;XZY;XXY;XYY;...
    YZZ;YXZ;YYZ;YZX;YXX;YYX;YZY;YXY;YYY];
% DD=[ZZZ;ZXZ;ZYZ;XZZ;XXZ;XYZ;YZZ;YXZ;YYZ;ZZX;ZXX;ZYX;XZX;XXX;XYX;YZX;YXX;YYX;ZZY;ZXY;ZYY;XZY;XXY;XYY;YZY;YXY;YYY];
DD1(:,1)=DD(:,1);DD1(:,2)=DD(:,3);DD1(:,3)=DD(:,2);DD1(:,4)=DD(:,4);
DD1(:,5)=DD(:,5);DD1(:,6)=DD(:,7);DD1(:,7)=DD(:,6);DD1(:,8)=DD(:,8);

% DD1(:,1)=DD(:,2);DD1(:,2)=DD(:,4);DD1(:,3)=DD(:,1);DD1(:,4)=DD(:,3);
% DD1(:,5)=DD(:,6);DD1(:,6)=DD(:,8);DD1(:,7)=DD(:,5);DD1(:,8)=DD(:,7);

for ii=1:27
    D(8*(ii-1)+1:8*ii)=DD1(ii,:);
end

data02=D';
%%
% Z=[ZZZ,ZZX,ZZY,ZXZ,ZXX,ZXY,ZYZ,ZYX,ZYY];
% X=[XZZ,XZX,XZY,XXZ,XXX,XXY,XYZ,XYX,XYY];
% Y=[YZZ,YZX,YZY,YXZ,YXX,YXY,YYZ,YYX,YYY];
% D=[Z,X,Y]';
% data02=D;


%%
M(:,:,1,1)=[1;0]*[1;0]';
M(:,:,2,1)=[0;1]*[0;1]';
M(:,:,1,2)=1/2*[1;1]*[1;1]';
M(:,:,2,2)=1/2*[1;-1]*[1;-1]';
M(:,:,1,3)=1/2*[1;1i]*[1;1i]';
M(:,:,2,3)=1/2*[1;-1i]*[1;-1i]';

m(:,:,1,1)=[1;0];
m(:,:,2,1)=[0;1];
m(:,:,1,2)=1/sqrt(2)*[1;1];
m(:,:,2,2)=1/sqrt(2)*[1;-1];
m(:,:,1,3)=1/sqrt(2)*[1;1i];
m(:,:,2,3)=1/sqrt(2)*[1;-1i];

M1(:,:,1,1)=[1;0]*[1;0]';
M1(:,:,2,1)=[0;1]*[0;1]';
M1(:,:,1,2)=1/2*[1;-1]*[1;-1]';
M1(:,:,2,2)=1/2*[1;1]*[1;1]';
M1(:,:,1,3)=1/2*[1;-1i]*[1;-1i]';
M1(:,:,2,3)=1/2*[1;1i]*[1;1i]';

m1(:,:,2,1)=[1;0];
m1(:,:,1,1)=[0;1];
m1(:,:,1,2)=1/sqrt(2)*[1;-1];
m1(:,:,2,2)=1/sqrt(2)*[1;1];
m1(:,:,1,3)=1/sqrt(2)*[1;-1i];
m1(:,:,2,3)=1/sqrt(2)*[1;1i];

M2(:,:,2,1)=[1;0]*[1;0]';
M2(:,:,1,1)=[0;1]*[0;1]';
M2(:,:,1,2)=1/2*[1;1]*[1;1]';
M2(:,:,2,2)=1/2*[1;-1]*[1;-1]';
M2(:,:,2,3)=1/2*[1;-1i]*[1;-1i]';
M2(:,:,1,3)=1/2*[1;1i]*[1;1i]';

m2(:,:,2,1)=[1;0];
m2(:,:,1,1)=[0;1];
m2(:,:,1,2)=1/sqrt(2)*[1;1];
m2(:,:,2,2)=1/sqrt(2)*[1;-1];
m2(:,:,2,3)=1/sqrt(2)*[1;-1i];
m2(:,:,1,3)=1/sqrt(2)*[1;1i];

M4(:,:,2,1)=[1;0]*[1;0]';
M4(:,:,1,1)=[0;1]*[0;1]';
M4(:,:,2,2)=1/2*[1;1]*[1;1]';
M4(:,:,1,2)=1/2*[1;-1]*[1;-1]';
M4(:,:,2,3)=1/2*[1;1i]*[1;1i]';
M4(:,:,1,3)=1/2*[1;-1i]*[1;-1i]';

m4(:,:,2,1)=[1;0];
m4(:,:,1,1)=[0;1];
m4(:,:,2,2)=1/sqrt(2)*[1;1];
m4(:,:,1,2)=1/sqrt(2)*[1;-1];
m4(:,:,2,3)=1/sqrt(2)*[1;1i];
m4(:,:,1,3)=1/sqrt(2)*[1;-1i];
for a=1:3
    for b=1:3
        for c=1:3
            for x=1:2
                for y=1:2
                    for z=1:2
                        M3(:,:,z+(y-1)*2+(x-1)*4+(c-1)*8+(b-1)*24+(a-1)*72)=kron(M(:,:,x,a),kron(M(:,:,y,b),M(:,:,z,c)));
                        MM3(z+(y-1)*2+(x-1)*4+(c-1)*8+(b-1)*24+(a-1)*72,:)=kron(m(:,:,x,a),kron(m(:,:,y,b),m(:,:,z,c)))';
                        M23(:,:,z+(y-1)*2+(x-1)*4+(c-1)*8+(b-1)*24+(a-1)*72)=kron(M(:,:,x,a),kron(M(:,:,y,b),M(:,:,z,c)));
                        MM23(z+(y-1)*2+(x-1)*4+(c-1)*8+(b-1)*24+(a-1)*72,:)=kron(m(:,:,x,a),kron(m(:,:,y,b),m(:,:,z,c)))';
                        
                    end
                end
            end
        end
    end
end
%% tomography
d=2;D=d^3;

%%
DD=6;
intensity=ones(1,DD^4);
conf.NQubits=3;
parfor N=1:20
    data1=poissrnd(data01);
[rho01, intensity01]=linear_tomography(data1,MM3);      % 由符合数和对应的测量基进行层析，修改程序可直接由此输入
acc=randn(DD^4,1);
rho1=maximum_likelihood_tomography(rho01, data1, M3, acc, conf);   % 必须有此部分，不然不一定是个态

data2=poissrnd(data02);
[rho02, intensity02]=linear_tomography(data2,MM23);      % 由符合数和对应的测量基进行层析，修改程序可直接由此输入
rho2=maximum_likelihood_tomography(rho02, data2, M23, acc, conf);   % 必须有此部分，不然不一定是个态

F(N)=fidelity(rho1,rho2);
% delta = rho1 - rho2;
% % dd=svd(delta);
% % D(N) = 0.5 * sum(svd(delta));
% D(N) = 0.5 *trace(sqrtm(delta'*delta));
end
F_mean=mean(F)
F_error=std(F)

% 0.964344925219538
