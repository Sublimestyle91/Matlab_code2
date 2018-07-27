
%prepare workstation
clear all
close all
clc


%Load in the data
M=csvread('ranreal.csv',0,0);
Truth=M(:,2)'; %second column is the truth one
Realrating=M(:,3)'; %Thrid column is the observed
Randomrating=M(:,4)'; %Fourth column is for random values
n=length(Truth);
newpredictions = Realrating;





%Functions
 [nodisease, Truthcounter] =diseasetally2(Truth);
 [Area,specificity,sensitivity,oneminusspec,thresholdn,Thresholdtests,Rights,RightsnoD,Thresholdtestsy,Thresholdtestsyy]= ROC2(newpredictions,Truthcounter,nodisease,Truth);
 [onemx,sensy,number] = bestthreshold2(thresholdn,oneminusspec,sensitivity);
 
 %Finds Confusion matrix rows and columns
 topleft = Rights(number);
 bottomleft = Truthcounter-Rights(number);
 topright= nodisease-RightsnoD(number);
 bottomright= RightsnoD(number);
 
 Predicted = {'+','-'};
 Disease=[topleft;bottomleft];
 No_Disease= [topright;bottomright];
 
 %This part outputs the counfusion matrix
 disp(' ')
 disp(' ')
 disp('Guessed data')
 disp(' ')
 disp(' ')
 T=table(Disease,No_Disease,'Rownames',Predicted);
 disp(T)
 
%this finds all the values for the data we need to find
 bestthresh=Thresholdtests(number);
 specificityC=1-onemx;
 sensitivityC=sensy;
 Accuracy= (Rights(number)+RightsnoD(number))/length(newpredictions);
 Prevalence= Truthcounter/(nodisease+Truthcounter);
 PPV= Rights(number)/Thresholdtestsy(number);
 NPV= RightsnoD(number)/Thresholdtestsyy(number);
 
 %This will print all the data for the guessed values neatly to the command
 %window
 vectors=[Area,bestthresh,specificityC,sensitivityC,Accuracy,Prevalence,PPV,NPV];
 fprintf('Area under ROC curve: %1.3f\nBest Threshold value: %1.3f\nSpecificity: %1.3f\nSensitivity: %1.3f\nAccuracy: %1.3f\nPrevalence: %1.3f\nPPV: %1.3f\nNPV: %1.3f\n',vectors)
 
 
%This part will give you the plot for the guessed data
x=0:.1:1;
y=0:.1:1;
subplot(2,1,1)
plot(oneminusspec,sensitivity,x,y)
xlabel('1-specificity')
ylabel('sensitivity')
title('ROC Curve Guessed data')
grid
legend('Guessed data','Chance plot')

 
 %Now for the random rating
 
 newpredictions = Randomrating;
 [nodisease, Truthcounter] =diseasetally2(Truth);
 [Area,specificity,sensitivity,oneminusspec,thresholdn,Thresholdtests,Rights,RightsnoD,Thresholdtestsy,Thresholdtestsyy]= ROC2(newpredictions,Truthcounter,nodisease,Truth);
 [onemx,sensy,number] = bestthreshold2(thresholdn,oneminusspec,sensitivity);
 
 %Finds Confusion matrix rows and columns
 topleft = Rights(number);
 bottomleft = Truthcounter-Rights(number);
 topright= nodisease-RightsnoD(number);
 bottomright= RightsnoD(number);
 Predicted = {'+','-'};
 Disease=[topleft;bottomleft];
 No_Disease= [topright;bottomright];
 
 %This will display the confusion matrix in the command window
 disp(' ')
 disp(' ')
 disp('Random data') 
 disp(' ')
 disp(' ')
 T=table(Disease,No_Disease,'Rownames',Predicted);
 disp(T)
 
 %Finds all the data for random numbers
 bestthresh=Thresholdtests(number);
 specificityC=1-onemx;
 sensitivityC=sensy;
 Accuracy= (Rights(number)+RightsnoD(number))/length(newpredictions);
 Prevalence= Truthcounter/(nodisease+Truthcounter);
 PPV= Rights(number)/Thresholdtestsy(number);
 NPV= RightsnoD(number)/Thresholdtestsyy(number);
 
%This will give you a plot of data for random values
x=0:.1:1;
y=0:.1:1;
subplot(2,1,2)
plot(oneminusspec,sensitivity,x,y)
xlabel('1-specificity')
ylabel('sensitivity')
title('ROC curve randome data')
grid
legend('Random data','Chance Plot')

%This will print all the data neatly to the command window
vectors=[Area,bestthresh,specificityC,sensitivityC,Accuracy,Prevalence,PPV,NPV];
fprintf('Area under ROC curve: %1.3f\nBest Threshold value: %1.3f\nSpecificity: %1.3f\nSensitivity: %1.3f\nAccuracy: %1.3f\nPrevalence: %1.3f\nPPV: %1.3f\nNPV: %1.3f\n',vectors)
 





    
        
            
            
            
    
    







