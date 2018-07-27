function [onemx,sensy, number] = bestthreshold(thresholdn,oneminusspec,sensitivity)
%Gives the closest value to (0,1) for thresholds
thresholddis=zeros(1,thresholdn);
for i=1:thresholdn
    thresholddis(i) = sqrt((0-oneminusspec(i))^2+(1-sensitivity(i))^2);
    
end
bestthreshold= min(thresholddis);





%This will give the sensitivity and 1-specificity the closest value
for i=1:thresholdn
    if thresholddis(i) == bestthreshold
        number = i;
    end
end
sensy= sensitivity(number);
onemx = oneminusspec(number);

    
