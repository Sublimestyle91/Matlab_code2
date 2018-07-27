function out=MySimpsons(x,y)
%This function will give you the integration
%of a set of given points.
%Inputs:
%x= the x values for the points
%y= the y values for the points
%Both x and y have to be of the same length
%and this length has to be an odd number
n=length(x); %gets the length of the x vector
if length(y)~=n %checks if the both inputs are the same length
    error('Y input is not the same dimension as x inputs')
end
check= mod(n,2);
if check == 0 %checks if the x inputs is of an odd length
    error('The dimension of x have to odd')
end
h=(x(end)-x(1))/(n-1); %formula for trapezoid height
y1=y(2:2:n-1); %first y summation term in simpsons 
y2=y(3:2:n-2); %Second y summation term in simpsons 
out=(y(1)+4*sum(y1)+2*sum(y2)+y(n)*h)/3; %The simpson equation

