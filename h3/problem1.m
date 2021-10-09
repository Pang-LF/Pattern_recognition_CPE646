clear
load hw3.mat
who;

sample=[ones(1,50),2*ones(1,50)];

% estimate the initial mu and cov
mu1=sum(hw3_1(:,1:50),2)/50
mu2=sum(hw3_1(:,51:100),2)/50
a=0;
b=0;
for i = 1:50
    a= a +(hw3_1(:,i)-mu1)*(hw3_1(:,i)-mu1)';
end
cov1=a/50
for i = 51:100
    b= b +(hw3_1(:,i)-mu2)*(hw3_1(:,i)-mu2)';
end
cov2=b/50
label=[ones(1,50),2*ones(1,50)];

d1=[0;0];d2=[0;0];
for i=1:100
    if sample(i)==1
        d1=[d1,hw3_1(:,i)];
    else
        d2=[d2,hw3_1(:,i)];
    end
end

sd1=size(d1,2); sd2=size(d2,2);
d1=d1(:,2:sd1); d2=d2(:,2:sd2);
sd1=sd1-1; sd2=sd2-1;
rho1=sd1; rho2=sd2;

for i=1:100
    likelihood1=(1/(2*pi*sqrt(det(cov1))))*exp(-0.5*(hw3_1(:,i)-mu1)'*inv(cov1)*(hw3_1(:,i)-mu1));
    likelihood2=(1/(2*pi*sqrt(det(cov2))))*exp(-0.5*(hw3_1(:,i)-mu2)'*inv(cov2)*(hw3_1(:,i)-mu2));
    if likelihood1*rho1>likelihood2*rho2
        sample(i)=1;
    else
        sample(i)=2;
    end
end

% iteration 2
d1=[0;0];d2=[0;0];
for i=1:100
    if sample(i)==1
        d1=[d1,hw3_1(:,i)];
    else
        d2=[d2,hw3_1(:,i)];
    end
end

sd1=size(d1,2); sd2=size(d2,2);
d1=d1(:,2:sd1); d2=d2(:,2:sd2);
sd1=sd1-1; sd2=sd2-1;
rho1=sd1; rho2=sd2;

mu1=mean(d1,2), mu2=mean(d2,2),
dd1=d1-mu1*ones(1,sd1);
dd2=d2-mu2*ones(1,sd2);
cov1=(dd1*dd1')/sd1,
cov2=(dd2*dd2')/sd2,

for i=1:100
    likelihood1=(1/(2*pi*sqrt(det(cov1))))*exp(-0.5*(hw3_1(:,i)-mu1)'*inv(cov1)*(hw3_1(:,i)-mu1));
    likelihood2=(1/(2*pi*sqrt(det(cov2))))*exp(-0.5*(hw3_1(:,i)-mu2)'*inv(cov2)*(hw3_1(:,i)-mu2));
    if likelihood1*rho1>likelihood2*rho2
        sample(i)=1;
    else
        sample(i)=2;
    end
end

% iteration 3
d1=[0;0];d2=[0;0];
for i=1:100
    if sample(i)==1
        d1=[d1,hw3_1(:,i)];
    else
        d2=[d2,hw3_1(:,i)];
    end
end

sd1=size(d1,2); sd2=size(d2,2);
d1=d1(:,2:sd1); d2=d2(:,2:sd2);
sd1=sd1-1; sd2=sd2-1;
rho1=sd1; rho2=sd2;

mu1=mean(d1,2), mu2=mean(d2,2),
dd1=d1-mu1*ones(1,sd1);
dd2=d2-mu2*ones(1,sd2);
cov1=(dd1*dd1')/sd1,
cov2=(dd2*dd2')/sd2,

for i=1:100
    likelihood1=(1/(2*pi*sqrt(det(cov1))))*exp(-0.5*(hw3_1(:,i)-mu1)'*inv(cov1)*(hw3_1(:,i)-mu1));
    likelihood2=(1/(2*pi*sqrt(det(cov2))))*exp(-0.5*(hw3_1(:,i)-mu2)'*inv(cov2)*(hw3_1(:,i)-mu2));
    if likelihood1*rho1>likelihood2*rho2
        sample(i)=1;
    else
        sample(i)=2;
    end
end

% iteration 4
d1=[0;0];d2=[0;0];
for i=1:100
    if sample(i)==1
        d1=[d1,hw3_1(:,i)];
    else
        d2=[d2,hw3_1(:,i)];
    end
end

sd1=size(d1,2); sd2=size(d2,2);
d1=d1(:,2:sd1); d2=d2(:,2:sd2);
sd1=sd1-1; sd2=sd2-1;
rho1=sd1; rho2=sd2;

mu1=mean(d1,2), mu2=mean(d2,2),
dd1=d1-mu1*ones(1,sd1);
dd2=d2-mu2*ones(1,sd2);
cov1=(dd1*dd1')/sd1,
cov2=(dd2*dd2')/sd2,

for i=1:100
    likelihood1=(1/(2*pi*sqrt(det(cov1))))*exp(-0.5*(hw3_1(:,i)-mu1)'*inv(cov1)*(hw3_1(:,i)-mu1));
    likelihood2=(1/(2*pi*sqrt(det(cov2))))*exp(-0.5*(hw3_1(:,i)-mu2)'*inv(cov2)*(hw3_1(:,i)-mu2));
    if likelihood1*rho1>likelihood2*rho2
        sample(i)=1;
    else
        sample(i)=2;
    end
end

% iteration 5
d1=[0;0];d2=[0;0];
for i=1:100
    if sample(i)==1
        d1=[d1,hw3_1(:,i)];
    else
        d2=[d2,hw3_1(:,i)];
    end
end

sd1=size(d1,2); sd2=size(d2,2);
d1=d1(:,2:sd1); d2=d2(:,2:sd2);
sd1=sd1-1; sd2=sd2-1;
rho1=sd1; rho2=sd2;

mu1=mean(d1,2), mu2=mean(d2,2),
dd1=d1-mu1*ones(1,sd1);
dd2=d2-mu2*ones(1,sd2);
cov1=(dd1*dd1')/sd1,
cov2=(dd2*dd2')/sd2,

for i=1:100
    likelihood1=(1/(2*pi*sqrt(det(cov1))))*exp(-0.5*(hw3_1(:,i)-mu1)'*inv(cov1)*(hw3_1(:,i)-mu1));
    likelihood2=(1/(2*pi*sqrt(det(cov2))))*exp(-0.5*(hw3_1(:,i)-mu2)'*inv(cov2)*(hw3_1(:,i)-mu2));
    if likelihood1*rho1>likelihood2*rho2
        sample(i)=1;
    else
        sample(i)=2;
    end
end


