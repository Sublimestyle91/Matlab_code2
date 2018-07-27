%clear workspace
clear all;
close all;
clc;
format long

%initialization
x= [1,2,3,5,6];
y= [7,4,5.5,40,82];

N4=Newtint_NS(x,y,4)
N3=Newtint_NS(x(1:4),y(1:4),4)
N2=Newtint_NS(x(2:4),y(2:4),4)
N1=Newtint_NS(x(3:4),y(3:4),4)

L4=Lagrange_NS(x,y,4)
L3=Lagrange_NS(x(1:4),y(1:4),4)
L2=Lagrange_NS(x(2:4),y(2:4),4)
L1=Lagrange_NS(x(3:4),y(3:4),4)

%how do we know which one could give you
%better accuracy