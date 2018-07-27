function [magfin,anglefin] = dividephasor(x,y,r,x1,y1,r1)
%This function will take polar or rectangular units
%r is 1 for rectangular and 0 for polar
%the x and y ones are the top ones
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
magfin=mag/mag1;
anglefin=angle-angle1;
m=input('do you want in rec (1=yes,0=no): ');
if m == 1;
    [magfin,anglefin]= recphasor(magfin,anglefin);
end

end

    

    
    

