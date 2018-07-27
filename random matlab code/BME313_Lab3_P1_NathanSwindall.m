clear all
close all
Dt= 9*10^-6; % the metabolite tissue diffusivity cm^2/s
V= .006;    %the blood plasma velocity cm/s
rc=.0005;  % capillary radius cm/s
tm=5*10^-5; %capillary wall thickness
K0 = 5.75*10^-5;   %overall metabolite mass transfer rate
C0= 6; %micromole/cm^3
R0=.01; %micromole/cm^3s
z=.001:.01:.1; %incremental z values
Y=@(rcrit) rcrit/(rc+tm); %fucntion that rcrit is in
Krogh=@(y,z) (y^2)*log(y^2)-y^2+1-((4*Dt*C0)/(R0*(rc+tm)^2))+...
4*Dt*(y^2-1)*z/(V*rc^2)+2*Dt*(y^2-1)/(rc*K0) ; 
%this is the equation for the Krogh cylinder

for i = 1:length(z) %for loop
    Kroghrcrit=@(y) Krogh(Y(y),z(i)); %the combined function for the krogh
    %cylinder and the rcrit value
    [root,fx,ea,iter] = bisect_NS(Kroghrcrit,0.00001,.01,.0001, 100);
    %This calls the bisection method
    Roots(i)=root; %Vector for the combined roots
    EA(i)=ea; %Vector for the approximation error
end
Roots
EA
[ax, h1, h2] = plotyy(z,Roots,z,EA); %Graph with two y axis
set(h1,'Linewidth', 2, 'color', 'blue', 'linestyle', '-');
set(h2,'linewidth', 3, 'color', 'red', 'linestyle', '--');
% colors and line style
xlabel( 'z (cm)')
axes(ax(1)); ylabel('Rcrit (micrometer)'); %y axis label 1
axes(ax(2)); ylabel('relative error (%)');  %y axis label 2
legend([h1;h2], 'Rcrit','EA')