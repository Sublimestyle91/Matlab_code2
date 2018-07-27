function [magfin,anglefin] = multiphasor(x,y,r,x1,y1,r1)
%this will multiply two different phasors
%if r = 1 then it is in rectangular
if r==1;
    [mag,angle]=topolarphasor(x,y);
else
    mag=x;
    angle=y;
end
if r1==1;
    [mag1,angle1]= topolarphasor(x1,y1);
else
    mag1=x1;
    angle1=y1;
end
anglefin= angle1+angle;
magfin = mag1*mag;
m=input('do you want in rec (1=yes,0=no): ');
if m == 1;
    [magfin,anglefin]= recphasor(magfin,anglefin);
end

