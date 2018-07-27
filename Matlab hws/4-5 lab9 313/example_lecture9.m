% Interpolation of the time-temperature data given below
% using Gregory-Newton forward interpolation formula
% to find the maximum temperature and 
% the time this maximum occurred.

clc; clear all; close all;

% Input and plot data
time = 1:12;
temp = [98.9 99.5 99.9 101.3 101.6 102.5 104.0 104.1 102.5 101.2 100.5 100.2];

% Vector of time for interpolation
ti = linspace(min(time),max(time));	

figure(1); plot(time, temp, 'o')
    title('Patient''s Temperature Profile')
    xlabel('Time (a.m.)'); ylabel('Temperature (deg F)')
pause
% Polynomial fit
p=polyfit(time,temp,2)    % 2-nd order polynomial, expect "precise" interpolation 
temp_p=polyval(p,ti); 
figure(1); plot(time, temp, 'o', ti, temp_p); % check using graphical approach
    title('Patient''s Temperature Profile: 2-nd order polyfit')
    xlabel('Time (a.m.)'); ylabel('Temperature (deg F)')
pause
for i=3:max(size(temp)-1)
p=polyfit(time,temp,i) 
i
temp_p=polyval(p,ti); 
figure(1); plot(time, temp, 'o', ti, temp_p); % check using graphical approach
    title(['Patient''s Temperature Profile: polyfit n=', num2str(i)])
    xlabel('Time (a.m.)'); ylabel('Temperature (deg F)')
    pause
end
% Play with different order of Interpolation
redo = 1;
while redo
   disp(' '); n = input(' Order of interpolation = ');
   te = gregory_newton(time,temp,ti,n);	% Interpolation
   [max_temp,k] = max(te);
   max_time = ti(k);
% Show the results
   fprintf('\n Maximum temperature of %4.1f F reached at %4.2f.\n',max_temp,max_time)
% Show the results graphically
   figure(2); plot(time,temp,'o',ti,te)
   title(['Patient''s Temperature Profile: Gregory-Newton method, n=', num2str(n)])
   xlabel('Time (a.m.)'); ylabel('Temperature (deg F)')
   axis([1 12 98 105])
   disp(' ')
   redo = input(' Repeat the calculation (1/0) : ');
end

% Try Newton method using the function from the book
n=max(size(ti));
timeintN=zeros(size(ti));
pause
echo off
for i=1:n;
    timeintN(i)=newtint(time,temp,ti(i));
end;
echo on
figure(3); plot(time, temp, 'o', ti, timeintN); axis([1 12 98 105])
    title('Patient''s Temperature Profile: Newton interpolation')
    xlabel('Time (a.m.)'); ylabel('Temperature (deg F)')
pause

% Try Lagrange method using the function from the book
n=max(size(ti));
timeintL=zeros(size(ti));
pause
echo off
for i=1:n;
    timeintL(i)=lagrange(time,temp,ti(i));
end;
echo on
figure(4); plot(time, temp, 'o', ti, timeintL); axis([1 12 98 105])
    title('Patient''s Temperature Profile: Lagrange interpolation')
    xlabel('Time (a.m.)'); ylabel('Temperature (deg F)')
