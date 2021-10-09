clear
load('hw3.mat');
x1=hw3_2_1;
x2=hw3_2_2;

l = 0;
for i = -4:0.1:8
    l = l+1;
    m=0;
    for j = -4:0.1:8
        m=m+1;
        p1(l,m) = 0;
        p2(l,m) = 0;
        [neighbors1, maxDis1] = getNeighbors(x1, [i;j], 10);
        [neighbors2, maxDis2] = getNeighbors(x2, [i;j], 10);
        V1 = pi * maxDis1^2;
        V2 = pi * maxDis2^2;
        p1(l,m) = 10/100/V1;
        p2(l,m) = 10/100/V2;
    end
end

if i==1 && j==-2
    p1(l,m)
    p2(l,m)
end

figure(1);
mesh(p1);
figure(2);
mesh(p2);

function [neighbors, maxDis] = getNeighbors(dataSet, Instance, k)
    distances = [];
    for i = 1:size(dataSet,2)
        dist = Distance(Instance, dataSet(:,i));
        distances = [distances;dist];
    end
    [B, I] = sort(distances);
    neighbors = [];
    for i = 1:k
        neighbors = [neighbors, dataSet(:,I(i))];
    end
    maxDis = Distance(Instance, neighbors(:,end));
end

function y = Distance(instance1, instance2)
    distance = 0;
    for i = 1:2
        distance = distance + (instance1(i) - instance2(i))^2;
    end
    y = sqrt(distance);
end

