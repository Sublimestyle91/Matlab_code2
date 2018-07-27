function [x,y] = additionphasor(x1,y1,r,x2,y2,r1)
%This will add two vectors
%if they are not rectangular then r = 0
if r==0;
    [x1,y1]=recphasor(x1,y1);
end
if r1==0;
    [x2,y2]= recphasor(x2,y2);
end
x=x1+x2;
y=y1+y2;
m=input('Do you want it in polar (1= yes, 0 =no): ');
if m == 1;
    [x,y] = topolarphasor(x,y);
end

 
