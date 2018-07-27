%Prepare workstation
clear all
close all
clc

%initialization
%Values needed for powereig function
A= [2 8 10; 8 4 5; 10 5 7]; %vector of differential equations
es= .00001; %threshold value
maxit =100; %max iteratons value

%Using the powereig function
[eval, evect] = powereig(A,es,maxit);

%outputs
eval
evect



