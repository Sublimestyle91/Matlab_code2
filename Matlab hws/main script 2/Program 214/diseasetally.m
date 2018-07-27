function [nodisease,Truthcounter] =diseasetally(Truth)
%This function will find out how many people have the 
%disease total
%It takes one argument which is a vector containing 1 and 0
%A 1 indicates that a person has disease
%Find how many actually have the disease
%inputs
%Truth = matrix with 1 and 0, 1 being have the disease
%n=data points
n=length(Truth);
Truthcounter=0; %number of people who have the disease
for i=1:n
    if Truth(i) == 1
        Truthcounter = Truthcounter + 1;
    end
end
nodisease = n -Truthcounter; %number people without the disease
end

