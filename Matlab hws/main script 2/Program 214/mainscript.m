
%prepare workstation
clear all
close all
clc


%Load in the data
M=csvread('herdata2.csv',0,0);
Truth=M(:,2)'; %second column is the truth one
Realrating=M(:,3)'; %Thrid column is the observed
Randomrating=M(:,4)'; %Fourth column is for random values
n=length(Truth);

Lowestrat= input('Lowest rating possible: ');
Highestrat= input('Highest rating possible: ');





%Functions
 [newpredictions] = convertdata(Lowestrat,Highestrat,Realrating); %coverted data
 [nodisease, Truthcounter] =diseasetally(Truth);
 [Area,specificity,sensitivity,oneminusspec,thresholdn,Thresholdtests,Rights,RightsnoD,Thresholdtestsy,Thresholdtestsyy]= ROC(newpredictions,Truthcounter,nodisease,Truth);
 [onemx,sensy,number] = bestthreshold(thresholdn,oneminusspec,sensitivity);
 
 %Confusion matrix
 topleft = Rights(number);
 bottomleft = Truthcounter-Rights(number);
 topright= nodisease-RightsnoD(number);
 bottomright= RightsnoD(number);
 
 Predicted = {'+','-'};
 Disease=[topleft;bottomleft];
 No_Disease= [topright;bottomright];
 
 T=table(Disease,No_Disease,'Rownames',Predicted);
 disp(T)
 

 bestthresh=Thresholdtests(number)
 specificityC=1-onemx;
 sensitivityC=sensy;
 Accuracy= (Rights(number)+RightsnoD(number))/length(newpredictions);
 Prevalence= Truthcounter/(nodisease+Truthcounter);
 PPV= Rights(number)/Thresholdtestsy(number);
 NPV= RightsnoD(number)/Thresholdtestsyy(number);
 
 
 
 %Now for the random rating
 [newpredictions] = convertdata(Lowestrat,Highestrat,Randomrating); %coverted data
 [nodisease, Truthcounter] =diseasetally(Truth);
 [Area,specificity,sensitivity,oneminusspec,thresholdn,Thresholdtests,Rights,RightsnoD,Thresholdtestsy,Thresholdtestsyy]= ROC(newpredictions,Truthcounter,nodisease,Truth);
 [onemx,sensy,number] = bestthreshold(thresholdn,oneminusspec,sensitivity);
 
 %Confusion matrix
 topleft = Rights(number);
 bottomleft = Truthcounter-Rights(number);
 topright= nodisease-RightsnoD(number);
 bottomright= RightsnoD(number);
 
 Predicted = {'+','-'};
 Disease=[topleft;bottomleft];
 No_Disease= [topright;bottomright];
 
 T=table(Disease,No_Disease,'Rownames',Predicted);
 disp(T)
 

 bestthresh=Thresholdtests(number)
 specificityC=1-onemx;
 sensitivityC=sensy;
 Accuracy= (Rights(number)+RightsnoD(number))/length(newpredictions);
 Prevalence= Truthcounter/(nodisease+Truthcounter);
 PPV= Rights(number)/Thresholdtestsy(number);
 NPV= RightsnoD(number)/Thresholdtestsyy(number);
 
 
 
 





    
        
            
            
            
    
    







