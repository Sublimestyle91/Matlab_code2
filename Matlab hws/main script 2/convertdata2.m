function [newpredictions] = convertdata2(Lowestrat,Highestrat,Realrating)
%This function will convert the data to a 0-1 scale
%inputs
%Lowest rating possible
%Highest rating possible
%Realrating=The ratings of the different data points

%Setups for converting data
n=length(Realrating);
rangeofratings = Highestrat-Lowestrat;
newrange = @(x) (x-Lowestrat)/rangeofratings;
newpredictions= zeros(1,n);



%converting data to that new scale
for i = 1:n
    newpredictions(i) = newrange(Realrating(i));
end


%This next part is to make sure that the data does
%not equal exactly 0 or 1 because this will cause
%issues for the curve. 
for i=1:n
    if newpredictions(i) == 0
        newpredictions(i) = .00001;
    elseif newpredictions(i) == 1
        newpredictions(i) = .999999;
    end
end
end


