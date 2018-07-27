%Prepare workstation
clear all;
close all;
clc

a=[ 5.6, 4.8, 4.2];
b=[12 14 16];
n= b/10;
m =a/10;

q= 100./(a.*b);

%making a 3rd order polyfit line

x1=[.4 .5 .6 .7];
y1=[.10631 .12626 .14309 .15703];

x2=[.3 .4 .5 .6];
y2=[.08561 .10941 .13003 .14749];

x3= [ .3 .4 .5 .6];
y3= [.08709 .11135 .13241 .15027];

P1=polyfit(x1,y1,3);
P2=polyfit(x2,y2,3);
P3=polyfit(x3,y3,3);

yval1=polyval(P1,.56)
yval2=polyval(P2,.48)
yval3=polyval(P3,.42)

sigma1= q(1)*yval1
sigma2= q(2)*yval2
sigma3= q(3)*yval3

aspratio= [5.6/12 4.8/14 4.2/16]
sigma=[ sigma1 sigma2 sigma3 ]

Pra= polyfit(aspratio,sigma,1)
Pra2=polyfit(aspratio,sigma,2)

xval=[0:.01:1]

They1=polyval(Pra,xval)
They2=polyval(Pra2,xval)

plot(xval,They1, xval,They2,aspratio,sigma,'o')



