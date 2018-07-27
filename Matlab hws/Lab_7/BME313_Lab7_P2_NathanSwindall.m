%Prepare workstation
clear all
close all
clc

%initialization 
A=[-5 3; 100 -301];%vector created from differential equations
b=[50;100]; %The solutions to the equations y1,y2 at zero

%eigen stuff
[vectors values] = eig(A); %This finds the eigen values
ev1= values (1,1);  %Store first eigen value in a variable
ev2= values (2,2);  %Store second eigen value in a variable
evec1= vectors(:,1);   %separates the first eigen vector from vectors
evec2= vectors(:,2) ;   %esparates the second eigen vector from vectors

%constants
c1c2=inv(vectors)*b;    %This will find all the constants in front of solution to differential equation
C1=c1c2(1)              %Stores constant one    
C2=c1c2(2)              %Stores constant two

%Solutions to differential equations
y1=@(t) C1*evec1(1)*exp(ev1*t)+C2*evec2(1)*exp(ev2*t); %Equation for solution 1
y2=@(t) C1*evec1(2)*exp(ev1*t)+C2*evec2(2)*exp(ev2*t);  %Equation for solution 2

%Print eigen values and vectors
fprintf(' Eigen values: %3.3f and %3.5f\n', ev1,ev2)
fprintf(' Eigen vector 1: %3.3f\n %21.3f\n', evec1)
fprintf(' Eigen vector 2: %3.3f\n %22.3f\n', evec2)

%Plot the two equations for the solutions
fplot(y1,[0 1]) %Plots y1
hold on         %keeps the plots on the same graph
fplot(y2,[0 1]) %plots y2
hold off        %turns off the hold

%Chart formatting 
title('y vs t')
legend('y1','y2')
xlabel('t')
ylabel('y')







