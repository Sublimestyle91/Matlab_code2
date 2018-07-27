clc
clear all;
close all;

xval=.7;
es=.05;
sol=1;
Truth_value=1/(1-xval);
iter=0;
fprintf('#Terms\t\tExpression_Value\t\tTrueError\t\tAproximationError \n');

while(1)
    solold=sol;   iter=iter+1;
    sol=sol+xval^iter;
 
    if sol~=0
        ea = abs((sol-solold)/sol)*100;
    end
    Truth_error_percent = abs((Truth_value-sol)/Truth_value)*100;
    fprintf('%d \t\t\t %4.2f \t\t\t %4.2f \t\t\t %4.2f\n',iter,sol,Truth_error_percent,ea);
 if ea <= es
     break
 end
end
 fprintf('The number of terms required are:%d \n', (iter+1));

