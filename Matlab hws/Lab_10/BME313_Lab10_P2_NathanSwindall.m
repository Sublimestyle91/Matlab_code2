%Prepare workstation
clear all
close all
clc



%Romberg method
H=30; %height set to 30
func=@(z) 100*(z./(5+z)).*exp((-2.*z)./H); %function to be used in romberg method
[q,ea,iter]=romberg_NS(func,0,H,.5); %calling the romberg function


%Gauss Quadrature
fz= @(z) 100*((15+15*z)/(20+15*z))*exp((-2*(15+15*z))/30)*15; %fucntion with shited to be in the -1 by 1 bounds
I=fz(-1/sqrt(3))+fz(1/sqrt(3)); %The approximation of the integral


%Adaptive method
Q=quad(func,0,H,0.5); %calls the quad function
QL=quadl(func,0,H,0.5); %calls the quadL function

%Printing the data
%Display the data for romberg
disp('The romberg method matrix')
disp(q) 
values=[iter,q(1,4),ea(1,3)];
fprintf('The romberg method reached the approximate error threshold in%2d iterations.\nThe final value for the integration was %1.3f\nand the approximate error was %1.3f\n\n',values)
%Display the data for Gauss.
disp('Gauss Quadrature method')
disp(I)
%Display the data for Adaptive method. 
disp('Adaptive method')
values2=[Q,QL];
fprintf('Quad: %1.3f\nQuadl: %1.3f\n',values2)

