%Prepare workstation
clear all
close all
clc

%initialization
t=[140:1:150]; %This time is in hours
Carb=[15.72, 15.53, 15.19, 16.56, 16.21, 17.39, 17.36, 17.42, 17.60, 17.75, 18.95]; %Carbon evolution rate
Oxy= [15.49, 16.16, 15.35, 15.13, 14.20, 14.23, 14.29, 12.74, 14.74, 13.68, 14.51]; %Oxygen uptake rate

%Trapz method
carbproduced= trapz(t,Carb); 
oxyconsumed = trapz(t, Oxy);

%Simpsons method
carbproduced2 = MySimpsons_NS(t,Carb);
oxyconsumed2  = MySimpsons_NS(t,Oxy);


%Printing results to the window
vector= [carbproduced, carbproduced2, oxyconsumed, oxyconsumed2];

fprintf('Carbon Produced(Trapz): %10.3f\nCarbon Produced(Simpsons): %10.3f\nOxygen Consumed(Trapz):%10.3f\nOxygen Consumed(Simpsons):%10.3f\n',vector)


