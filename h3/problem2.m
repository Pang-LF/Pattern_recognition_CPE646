clear
load hw3.mat

data1 = hw3_2_1;
data2 = hw3_2_2;
x1 = -4:0.1:8;
x2 = -4:0.1:8;
h1 = 2;
n = size(data1, 2);
hn = h1 / sqrt(n);
l=0;

for i = -4:0.1:8
    l = l+1;
    m=0;
    for j = -4:0.1:8
        m=m+1;
        p1(l,m) = 0;
        p2(l,m) = 0;
        for k = 1:n
            xd1 = [i;j] - data1(:,k);
            xd2 = [i;j] - data2(:,k);
            xd1 = xd1(1)^2+xd1(2)^2;
            xd2 = xd2(1)^2+xd2(2)^2;
            p1(l,m) = p1(l,m) + 1/(n*hn*sqrt(2*pi))*exp(-xd1/(2*hn^2));
            p2(l,m) = p2(l,m) + 1/(n*hn*sqrt(2*pi))*exp(-xd2/(2*hn^2));
        end
        if i==1 && j==-2
            p1x = p1(l,m)
            p2x = p2(l,m)
        end
    end
end 
figure(1);
mesh(p1);
figure(2);
mesh(p2);


for j = 1:n
    data1_new(1,j) = data1(1,j) / sqrt(data1(1,j)^2 + data1(2,j)^2);
    data1_new(2,j) = data1(2,j) / sqrt(data1(1,j)^2 + data1(2,j)^2);
    data2_new(1,j) = data2(1,j) / sqrt(data2(1,j)^2 + data2(2,j)^2);
    data2_new(2,j) = data2(2,j) / sqrt(data2(1,j)^2 + data2(2,j)^2);
end
wk1 = data1_new;
wk2 = data2_new;
x = [1;-2];
x = [x(1)/sqrt(x(1)^2+x(2)^2);x(2)/sqrt(x(1)^2+x(2)^2)];
 
sigma = 0.2;
net1 = x' * wk1;
net2 = x' * wk2;
 
g1 = sum(exp((net1-1)/sigma^2))
g2 = sum(exp((net2-1)/sigma^2))

