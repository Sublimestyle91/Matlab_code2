%Prepare workstation
clear all
close all
clc

%initialization
k=.69315/28.8; %k value
A= [-(.0056+k) 0 0 0 0; 0 -(.01+k) 0 0 0; .01902 .01387 -(.047+k) 0 0 ;...
    0 0 .33597 -(.376+k) 0; 0 0 0 .11364 -(.133+k)]; %Vector made from differential equations
b=[17.7;30.5;43.9;136.3;30.1]; %The answers when the general equations are at time zero

%Finding the eigen values and vectors
[vec val] = eig(A); %Finds the eigen values
ev1= val(1,1);      %Each eigen value is set to a variable
ev2= val(2,2);
ev3= val(3,3);
ev4= val(4,4);
ev5= val(5,5);
eve1= vec(:,1);      %Each eigen vector is separated from vec
eve2= vec(:,2);
eve3= vec(:,3);
eve4= vec(:,4);
eve5= vec(:,5);

%finding the constants of the general equation
c= vec\b;   %This finds the constants of the general equation
c1=c(1)     %this assigns each constant to its own value. 
c2=c(2)
c3=c(3)
c4=c(4)
c5=c(5)


%All the forms of the general equations
%Each one of these is a solution to the system of differential equations
y1= @(t) c1*eve1(1)*exp(ev1*t)+c2*eve2(1)*exp(ev2*t) + c3*eve3(1)*exp(ev3*t) + c4*eve4(1)*exp(ev4*t) + c5*eve5(1)*exp(ev5*t);
y2= @(t) c1*eve1(2)*exp(ev1*t)+c2*eve2(2)*exp(ev2*t) + c3*eve3(2)*exp(ev3*t) + c4*eve4(2)*exp(ev4*t) + c5*eve5(2)*exp(ev5*t);
y3= @(t) c1*eve1(3)*exp(ev1*t)+c2*eve2(3)*exp(ev2*t) + c3*eve3(3)*exp(ev3*t) + c4*eve4(3)*exp(ev4*t) + c5*eve5(3)*exp(ev5*t);
y4= @(t) c1*eve1(4)*exp(ev1*t)+c2*eve2(4)*exp(ev2*t) + c3*eve3(4)*exp(ev3*t) + c4*eve4(4)*exp(ev4*t) + c5*eve5(4)*exp(ev5*t);
y5= @(t) c1*eve1(5)*exp(ev1*t)+c2*eve2(5)*exp(ev2*t) + c3*eve3(5)*exp(ev3*t) + c4*eve4(5)*exp(ev4*t) + c5*eve5(5)*exp(ev5*t);
 

%Print the eigen values and vectors
fprintf(' Eigen values: %3.3f %3.5f %3.5f %3.5f %3.5f\n', ev1,ev2,ev3,ev4,ev5) %this prints the eigen values
fprintf(' Eigen vector 1: %3.3f\n %21.3f\n %21.3f\n %21.3f\n %21.3f\n', eve1) %Each of the following prints the unique eigen vectors found with the eigen values
fprintf(' Eigen vector 2: %3.3f\n %22.3f\n %21.3f\n %21.3f\n %21.3f\n', eve2)
fprintf(' Eigen vector 3: %3.3f\n %22.3f\n %21.3f\n %21.3f\n %21.3f\n', eve3)
fprintf(' Eigen vector 4: %3.3f\n %22.3f\n %21.3f\n %21.3f\n %21.3f\n', eve4)
fprintf(' Eigen vector 5: %3.3f\n %22.3f\n %21.3f\n %21.3f\n %21.3f\n', eve5)

%Plots of the general solutions from 1963-2011
fplot(y1,[0 48]) %plots the first solution
hold on          %Makes sure that each graph is on the same plot
fplot(y2,[0 48]) %The rest plot the graphs for y2,y3,y4,y5 on the same plot as y1   
fplot(y3,[0 48])
fplot(y4,[0 48])
fplot(y5,[0 48])
hold off         %turns off the hold on

%Plot formatting
legend('Superior', 'Michigan','Huron', 'Erie', 'Ontario') %gives which equation goes to which lake
title('Concentration of Strontium-90 in the great lakes from 1963-2011') %title
xlabel('Time elapsed from 1963 (years)') %xlabel
ylabel('Concentration (Bq/m^3)') %ylabel
