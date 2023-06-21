ans=importdata("data1.txt");
angle=ans(:,1);
angle=angle.*2.*3.1415926./360;
distance=ans(:,2);
[x,y] = pol2cart(angle,distance);
ans1=importdata("data2.txt");
angle1=ans1(:,1);
angle1=angle1.*2.*3.1415926./360;
distance1=ans1(:,2);
[x1,y1] = pol2cart(angle1,distance1);
ans2=importdata("data3.txt");
angle2=ans2(:,1);
angle2=angle2.*2.*3.1415926./360;
distance2=ans2(:,2);
[x2,y2] = pol2cart(angle2,distance2);
ans3=importdata("data4.txt");
angle3=ans3(:,1);
angle3=angle3.*2.*3.1415926./360;
distance3=ans3(:,2);
[x3,y3] = pol2cart(angle3,distance3);
x4 = [x+200;x1;x2+1800;x3+1950];
y4 = [y;y1+1800;y2+2000;y3+165];
scatter(x4,y4);
hold on
axis equal
axis( [ -200, 2200, -200, 2200 ] )
[xc,yc,R,a] = circfit(x4,y4);
%画图，并存图
theta=5/4*pi:0.1:7/4*pi;  
    Circle1=xc+R*cos(theta);  
    Circle2=yc+R*sin(theta);   
    plot(Circle1,Circle2,'g','linewidth',1);  
    hold on;
    %plot(x,y,'r','linewidth',1);
    scatter(x4,y4,2,'r');
    
    axis equal  
title(['xc=',num2str(xc),', yc=',num2str(yc),', R=',num2str(R)]);

data=[xc,yc,R]

%保存数据
% data=['xc','yc','R'];
% [M,N]=size(data);
% data_cell=num2cell(data,ones(M,1),ones(N,1));

function [xc,yc,R,a] = circfit(x,y)
%圆拟合函数
%CIRCFIT Fits a circle in x,y plane
% [XC, YC, R, A] = CIRCFIT(X,Y)
% Result is center point (yc,xc) and radius R.A is an
% optional output describing the circle’s equation:
%
% x^2+y^2+a(1)*x+a(2)*y+a(3)=0
% by Bucher izhak 25/oct/1991
n=length(x); xx=x.*x; yy=y.*y; xy=x.*y;
A=[sum(x) sum(y) n;sum(xy) sum(yy)...
sum(y);sum(xx) sum(xy) sum(x)];
B=[-sum(xx+yy) ; -sum(xx.*y+yy.*y) ; -sum(xx.*x+xy.*y)];
a=A\B;            %x = A\B 用来求解线性方程 A*x = B.  A 和 B 的行数一致.
xc = -.5*a(1);
yc = -.5*a(2);
R = sqrt((a(1)^2+a(2)^2)/4-a(3));
 
    end  

