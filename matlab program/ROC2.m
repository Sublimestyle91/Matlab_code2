function [Area,specificity,sensitivity,oneminusspec,thresholdn,Thresholdtests,Rights,RightsnoD,Thresholdtestsy,Thresholdtestsyy]= ROC2(newpredictions,Truthcounter,nodisease,Truth)

%This functin will give you the ROC curve
%Inputs = 
%newpredictions = the data in a scale 0-1
%Truthcounter = The amount of disease
%nodisease = The amount without disease
n=length(newpredictions);
Thresholdtests = [min(newpredictions)-1,unique(newpredictions),max(newpredictions)+1];
thresholdn= length(Thresholdtests);
Thresholdtestsy = zeros(1,thresholdn);%how many classified positive with certain threshold
Rights = zeros(1,thresholdn); %how many are classified positive and this is right
Thresholdtestsyy = zeros(1,thresholdn);
for j=1:thresholdn
    count= 0;
    rightanswers = 0;
    for i=1:n
        if newpredictions(i) > Thresholdtests(j)
            count= count + 1; %counts how many times it says it is positive
        end
        if newpredictions(i) > Thresholdtests(j) && Truth(i) == 1
            rightanswers = rightanswers + 1;
        end
    end
    Thresholdtestsy(j)= count; %This will hold the amount counted as having cancer
    %for that specific threshold
    Rights(j) = rightanswers;
end



%Senstivity
%+ with disease/ disease
sensitivity = zeros(1,thresholdn);
for i=1:thresholdn
    sensitivity(i) = Rights(i)/ Truthcounter;
end


%Specificity
%Predicted no disease/no disease
RightsnoD = zeros(1,thresholdn);
for j=1:thresholdn
    count=0;
    rightanswersnoD = 0;
    for i=1:n
        if newpredictions(i) <= Thresholdtests(j)
            count= count + 1; %counts how many times it says it is positive
        end
        if newpredictions(i) <= Thresholdtests(j) && Truth(i) == 0
            rightanswersnoD = rightanswersnoD + 1;
        end
    end
    Thresholdtestsyy(j)=count;
    RightsnoD(j) = rightanswersnoD;
end

%Creating the specificity vector
specificity = zeros(1,thresholdn);
for i=1:thresholdn
    specificity(i) = RightsnoD(i)/ nodisease;
end


%Creating the 1-specificity vector
oneminusspec = zeros(1,thresholdn);
for i=1:thresholdn
    oneminusspec(i) = 1 - specificity(i);
end



%Area under the ROC curve
Area =trapz(oneminusspec,sensitivity);
if Area < 0
    Area= Area*-1;
end
end







