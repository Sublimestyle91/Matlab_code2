clc
clear all
close all
 
dx=1.;
y=[1.4 2.1 3.3 4.8 6.8 6.6 8.6 7.5 8.9 10.9 10];
dyf=diff(y); % First Derivative Centered FD using diff
n=length(y);
for i=1:n-2
     dydxc(i)=(dyf(i+1)+dyf(i))/(2*dx);   % dydx = ( f(i+1)-f(i) + f(i)-f(i-1) ) / (2*dx)
end

 %Second Derivative Centered FD using diff
dy2dx2c=diff(dyf)/(dx*dx);    % dydx = (  f(i+1)-f(i) –  ( f(i)-f(i-1) )  ) / (dx*dx)

fprintf('first derivative \n'); fprintf('%f\n', dydxc)
fprintf('second derivative \n'); fprintf('%f\n', dy2dx2c)
