%Prepare workstation
clear all;
close all;
clc

%initial conditions
a=[ 5.6, 4.8, 4.2];
b=[12 14 16];
n= b/10; %dimensionless ratios
m =a/10; %dimensionless ratios

q= 100./(a.*b); %intensity equation for tons/units squared

%making a 3rd order polyfit line

x1=[.4 .5 .6 .7]; %range of values close to 5.6
y1=[.10631 .12626 .14309 .15703]; %y values for these x values;n=1.2

x2=[.3 .4 .5 .6]; %range of value close to 4.8
y2=[.08561 .10941 .13003 .14749]; % y value for above x values; n=1.4

x3= [ .3 .4 .5 .6]; %range of values close to 4.2
y3= [.08709 .11135 .13241 .15027]; %y values for above x values; n=1.6

P1=polyfit(x1,y1,3); %Thrid order poly fit to x1 data
P2=polyfit(x2,y2,3);    %Third order poly fit to x2 data
P3=polyfit(x3,y3,3);    %Third order poly fit ot x3 data

yval1=polyval(P1,.56);   %value of x1 data at .56
yval2=polyval(P2,.48);   %value of x2 data at .48
yval3=polyval(P3,.42);   %value of x3 data at .42

sigma1= q(1)*yval1;     %sigma value at x1
sigma2= q(2)*yval2;     %sigma value for x2
sigma3= q(3)*yval3;     %sigma value for x3


%Discussion question
aspratio= [5.6/12 4.8/14 4.2/16];   
sigma=[ sigma1 sigma2 sigma3 ];

z=[sigma1;sigma2;sigma3];
fprintf('(5.6/12)= %10.5f\n(4.8/14)= %10.5f\n(4.2/16)= %10.5f\n',z)

%fits two different orders to the sigma and aspect ratio data. 
Pra= polyfit(aspratio,sigma,1);
Pra2=polyfit(aspratio,sigma,2);

xval=[0:.01:1];

%These are the curves produced by the polyfit
They1=polyval(Pra,xval);
They2=polyval(Pra2,xval);

plot(xval,They1, xval,They2,aspratio,sigma,'o')
legend('1st Order', '2nd Order', 'aspect/sigma data')
xlabel('aspect ratio')
ylabel('sigma')
grid
title('Sigma vs Asprect ratio')



