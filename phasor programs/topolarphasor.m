function [mag,angle] = topolarphasor(x,y)
%This function makes rectangular into polar
%this function is for degress
mag= sqrt(x^2+y^2);
if x == 0 & y> 0
    angle = 90;
elseif x==0 & y<0
    angle= -90;
elseif x<0 & y<0
    angle = 180-atand(y/x);
elseif x< 0 & y>0
    angle = 180+atand(y/x);
else
    angle = atand(y/x);
end
end

