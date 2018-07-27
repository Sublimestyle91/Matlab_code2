%Prepare workstation
close all;
clear all;
clc


%Initials 
x=[1.8 2.0 2.2 2.4 2.6]; %inputs
y=[.5815 .5767 .5560 .5202 .4708];%values from zero-oder Bessel function of the first kind
xval=linspace(-2.6,2.6,50); %the values we plot the bessel function on
%and our polynomials

%fourth order fit
P4=polyfit(x,y,4); %This finds a line that passes through all the values
%it has to be a fourth-order. 
y4=polyval(P4,2.1); %This is the value at 2.1 of the polynomial we just found. 
y4val=polyval(P4,xval); %This will find all the values from -2.6 to 50
% of the poly regression line. 

%third order fit
P3=polyfit(x(1:4),y(1:4),3); %finds third order fit
y3=polyval(P3,2.1); %finds value of third order at 2.1
y3val=polyval(P3,xval); %finds y value for all the xvals from the third order polynomial
bestrue=besselj(1,2.1); %This gives the true value of the bessel function at 2.1
relp3= abs((bestrue-y3)/bestrue)*100; %This gives error for third order
relp4= abs((bestrue-y4)/bestrue)*100; %This gives error for fourth order

%Bessel function
bes=besselj(1,xval); 

%plots third, fourth, and bessel function. 
plot(x,y,'o', xval, bes, xval,y4val, xval, y3val)
legend('initial data points', 'Bessel function', 'Fourth order','Third order')
xlabel('x')
ylabel('y')
title('Fourth order vs Third order vs Bessel')
grid

%prints
z=[y4;y3;bestrue];
disp(' y4          y3         bessel')
fprintf('%10.7f %10.7f %10.7f \n\n\n\n',z) %prints regression values
disp('error in order 4(%)   error in order 3(%)')
zz=[relp4;relp3];
fprintf('%5.7f %20.7f \n',zz) %prints relative error




