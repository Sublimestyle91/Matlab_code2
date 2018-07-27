function [eval, evect] = powereig(A, es, maxit)
%The purpose of this function is to find the largest or most dominant 
%eigen value. It will also find the eigen vector for this value. 
%inputs
%A= the vectorized form of the system of different equations
%es= the threshold that the user wants his approximate error
%be below
%maxit= is the maximum number of iterations the program will go
%if it does not go below the threshold

    n = length(A);  %Finds number of rows
    
    evect = ones(n,1);  %Makes a column vector of nx1
    
    eval = 1;   %This makes the initial eigen val at 1
    
    iter = 0;   %Starts at zero iterations
    ea = 100;   %assigns ea a value of 100
    %This value and the eval do not really matter.
    %The variables are jus being set up.
    
    while(1)    %Starts a break while loop
       
        evalold = eval; %stores the current value of eval
        
        evect = A*evect; %multiplies vector A by the evect vector
        %The vector of ones set up earlier is out vector
        eval = max(abs(evect)); %Finds the max value of the vector evect
        evect = evect./eval;    %Evect is then changed so that its make value is
        %equal to one. 
        
        iter = iter+1; %adds one to the iter
        
        % update error
        if eval~=0  %if the eigen value is not one, this would mean that there is no solution
            ea = abs((eval-evalold)/eval)*100; %This finds the relative approximate error
        end
        
        % check stopping criteria
        if (ea<=es || iter>=maxit) %Checks if ea is smaller than or equal to the es threshold
            break;
        end
    end
    
    