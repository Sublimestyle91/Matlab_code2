function dydx= deriva_NS(x,y)
%this function will find the derivative when given x and y vectors of the
%same length
%inputs: x vector of n elements and y vector of n elements
%outputs: dydx which is the derivative
n=length(x); %finds the length
difference=diff(x); %finds the differnece in each x value
%This should be the same
h=mean(difference); %the average should just be the same as 
%the difference between one x value
dydx(1)= (-(y(3))+4*y(2)-3*y(1))/(2*h); %This finds the derivative of the first term using forward
%difference
dydx(n)=(3*y(n)-4*y(n-1)+y(n-2))/(2*h); %This finds the derivate of the second term using backwards difference
for i=2:n-1
    dydx(i)=(y(i+1)-y(i-1))/(2*h); %This finds the inbetween values with center difference
end
