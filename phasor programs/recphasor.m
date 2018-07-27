function [x,y] =recphasor(mag, angle)
%This function will make polar into rectangular
x=mag*cosd(angle);
y=mag*sind(angle);
end

