%prepare the workstation
clear all
close all
clc

%initial values given
x=-2.1:.1:2.1; %range of x values for function
y=(1/sqrt(2*pi))*exp(-x.^2/2); %function given

xm=-2.05:0.1:2.05; %midpoint of xvalues
xmm=-2:.1:2; %midpoint of the midpoint values

% The first and second derivative
dydx=diff(y)./diff(x); %first derivative
d2ydx2=diff(dydx)./diff(xm); %seconde derivative

%This for loop is for finding when d2ydx2 is close to zero or almost zero
for i=1:length(d2ydx2)
    if d2ydx2(i) > -.001 & d2ydx2(i) <.001; %These for when it is close to zero
        vector=[d2ydx2(i),i]; %This is for printing the value found to be close to zero
        fprintf('This is a number that is close zero: %1.10f\nThe vector position of this number is: %1.3f\n',vector)
        %The above code prints the value found to be close to zero
        vector2=[xmm(i)]; %Vector that has the x value close to zero
        fprintf('This number occurs when x equals: %1.3f\n',vector2) %prints the x value
    end
end


%plot of the data
plot(xmm,d2ydx2); %plots d2yd2x vs xmm
xlabel('x') %label for x
ylabel('d2ydx2') %label for y
title('d2yx2 vs x') %title


