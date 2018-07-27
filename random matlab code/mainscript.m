clear all
close all
clc

DT=8e-6;
V=.005;
rC=.0005;
tm=5e-5;
K0=5.75e-5;
C0=5;
R0=.01;
z=.001:.01:.1;
N=length(z);
roots=ones(1,N);
errors=zeros(1,N);
rootg=ones(1,N)

for ii=1:N
    fun=@(y)(y^2*log(y^2)-y^2+1-(4*DT*C0/R0/(rC+tm)^2)+4*DT/(V*rC^2)*(y^2-1)*z(ii)+2*DT/(rC*K0)*(y^2-1));
    [root,fx,ea,iter] = bisect_NS(fun,.000001,15);
    rootg(ii)=root
    roots(ii)=root*(rC+tm)*1e4;
    errors(ii)=ea;
end
plotyy(z,roots,z,errors)

    