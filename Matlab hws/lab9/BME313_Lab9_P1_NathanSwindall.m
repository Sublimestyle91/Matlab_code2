%Prepare workstation
close all;
clear all;
clc

%Initials 
x=[1.8 2.0 2.2 2.4 2.6];
y=[.5815 .5767 .5560 .5202 .4708];
xval=linspace(-2.6,2.6,50);


P4=polyfit(x,y,4);
y4=polyval(P4,2.1);
y4val=polyval(P4,xval)


P3=polyfit(x(1:4),y(1:4),3);
y3=polyval(P3,2.1);
y3val=polyval(P3,xval);
bestrue=besselj(1,2.1);
relp3= abs((bestrue-y3)/bestrue)*100
relp4= abs((bestrue-y4)/bestrue)*100


bes=besselj(1,xval);

plot(x,y,'o', xval, bes, xval,y4val, xval, y3val)



