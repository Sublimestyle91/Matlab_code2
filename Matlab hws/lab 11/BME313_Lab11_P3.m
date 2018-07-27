%Prepare the workstation
clear all
close all
clc


%Initial values
x=[0,.375, .75, 1.125, 1.5, 1.875, 2.25, 2.625,3]; %initial x values
y= [0, -.2571, -.9484, -1.9689,-3.2262, -4.6414, -6.1503, -7.7051, -9.275]./100; %initial y values
E=200*10^9; %modulus of elasticity
I=.0003; %moment of inertia

slope=deriva_NS(x,y); %finds the first derivative of the data points which is slop
Moment=deriva_NS(x,slope); %finds the moment from derivative of slope
Moment=Moment.*E*I;
shear=deriva_NS(x,Moment); %finds the shear form derivative of moment
load=deriva_NS(x,shear); %finds the distributed load with derivative of shear
load=-load; %because derivative of shear equals negative load
 %because derivative of slope equals Moment/EI

%Time to plot all the data
%There wil be five subplots

%Subplot #1 Deflection
subplot(3,2,1)
plot(x,y)
title('Deflection vs Length')
xlabel('length (m)')
ylabel('deflection (m)')
grid


%Subplot #2 Slope
subplot(3,2,2)
plot(x,slope)
title('Slope vs Length')
xlabel(' length (m)')
ylabel(' slope (m/m')
grid


%Subplot #3 Moment
subplot(3,2,3)
plot(x,Moment)
title('Moment vs length')
xlabel('length (m)')
ylabel('Moment (N m)')
grid


%Subplot #4 Shear
subplot(3,2,4)
plot(x, shear)
title('Shear vs length')
xlabel('length (m)')
ylabel('Shear (N)')
grid


%Subplot #5 load
subplot(3,2,5)
plot(x,load)
xlabel('length (m)')
ylabel('load (N/m)')
title('Load vs length')
grid




