%clear workspace
clear all;
close all;
clc;
format short

%initialization
x= [1,2,3,5,6];
y= [7,4,5.5,40,82];

%The newton interpolating method
N4=Newtint_NS(x,y,4) %4th order estimate at 4
N3=Newtint_NS(x(1:4),y(1:4),4)%3rd order estimate at 4
N2=Newtint_NS(x(2:4),y(2:4),4) %2nd order estimate at 4
N1=Newtint_NS(x(3:4),y(3:4),4) %1st order estimate at 4


%The Lagrange method for interpolating
L4=Lagrange_NS(x,y,4) %4th order estimate
L3=Lagrange_NS(x(1:4),y(1:4),4) %3rd order estimate for 4
L2=Lagrange_NS(x(2:4),y(2:4),4) %2nd order estimate for 4
L1=Lagrange_NS(x(3:4),y(3:4),4) %1st order estimate for 4

%how do we know which one could give you
%better accuracy