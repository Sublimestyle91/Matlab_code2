%Prepare workstation
clear all
close all
clc

%initialization
f=@(x) exp(-2*x)-x; %equation given in problem

xo=2; %value we are trying to find the derivative of
h=.5:-.01:.01; %range of different increment values
dx=h; %relabeling the h vector. 

for i=1:length(dx) 
    improvedforward(i)= (-f(xo+2*h(i))+4*f(xo+h(i))-3*f(xo))/(2*h(i)); %Improved forward finite difference approximation
    improvedbackward(i)=(3*f(xo)-4*f(xo-h(i))+f(xo-2*h(i)))/(2*h(i)); %Improved backward finite difference approximation
    centeredfinite(i)= (f(xo+h(i))-f(xo-h(i)))/(2*h(i)); %Centered finite difference approximation
    improvedcentered(i)=(-f(xo+2*h(i))+8*f(xo+h(i))-8*f(xo-h(i))+f(xo-2*h(i)))/(12*h(i)); %Improved centered finite difference approximation
end

%plotting the data
plot(dx,improvedforward,dx, improvedbackward,dx,centeredfinite,dx,improvedcentered) 
%Above is the plot of all the different methods
%Below are all the labels for the graph
xlabel('increment size')
ylabel('Derivative values')
title('Derivative values vs increment size')
legend('Improvedforward','Improvedbackward', 'Centeredfinite', 'Improvedcentered')
