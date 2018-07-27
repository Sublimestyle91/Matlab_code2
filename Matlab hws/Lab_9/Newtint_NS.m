function yint = Newtint_NS(x,y,xx)
% Newtint: Newton interpolating polynomial
% yint = Newtint(x,y,xx): Uses an (n - 1)-order Newton
% interpolating polynomial based on n data points (x, y)
% to determine a value of the dependent variable (yint)
% at a given value of the independent variable, xx.
% input:
% x = independent variable
% y = dependent variable
% xx = value of independent variable at which
% interpolation is calculated
% output:
% yint = interpolated value of dependent variable
% compute the finite divided differences in the form of a
% difference table
n = length(x);
if length(y)~=n, error('x and y must be same length'); end
b = zeros(n,n);
% assign dependent variables to the first column of b.
b(:,1) = y(:); % the (:) ensures that y is a column vector.
%This is pretty interesting because it actually makes it into a column
%vector. 
for j = 2:n  %For five points it would be 2:5, so four repetitions
    for i = 1:n-j+1 %This makes it so the next column is updated but with 1 
        %less number of numbers
        b(i,j) = (b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i)); %This is the actuall newton equation in matlab
    end
end
% use the finite divided differences to interpolate
xt = 1; %This sets up a variable xt
yint = b(1,1); %gives initial value to yint
for j = 1:n-1
    xt = xt*(xx-x(j)); %Why is this taken again. This is because you continually add terms to it
    %awesome!!!
    yint = yint+b(1,j+1)*xt;
end