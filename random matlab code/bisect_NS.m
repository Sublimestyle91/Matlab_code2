function [root,fx,ea,iter]=bisect_NS(func,xl,xu,es,maxit,varargin)
% bisect: root location zeroes
% [root,fx,ea,iter]=bisect(func,xl,xu,es,maxit,p1,p2,...):
% uses bisection method to find the root of func
% input:
% func = name of function
% xl, xu = lower and upper guesses
% es = desired relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% p1,p2,... = additional parameters used by func
% output:
% root = real root
% fx = function value at root
% ea = approximate relative error (%)
% iter = number of iterations

if nargin<3 %This makes sure that there are at least three inputs in the function
    error('at least 3 input arguments required') %If
    %three inputs are not given an error message will show
end
test = func(xl,varargin{:})*func(xu,varargin{:}); %This tests the 
%function at the boundaries to see if there is a sign change between the
%two points

if test>0   %if the test is positive then "no sign change shows up"
    error('no sign change'); %writes the message
end

if nargin<4||isempty(es) %If there are less than 4 inputs then an
    %es is automatically set to .0001
    es=0.0001;
end

if nargin<5||isempty(maxit) %if there are less than 5 arguments or maxit is empty
    %then maxit is set to 50.
    maxit=50;
end
%The iteration count is set to zero, xr is set to zero, and ea is set to
%zerl
iter = 0; xr = xl; ea = 0;

while (1)   %This is a while loop that goes at least once. It is
    %also a break while loop
  xrold = xr;   %Sets xr to the xrold value
  xr = (xl + xu)/2; %equation to find the midpoint between xl and xu
  iter = iter + 1; %increases the iter count by 1
  if xr ~= 0    %if xr is zero there is no difference between xl and xr
      ea = abs((xr - xrold)/xr) * 100; %equation for approximation erro
  end
  
  test = func(xl,varargin{:})*func(xr,varargin{:}); %This function
  %tests which segment has the sign change
  if test < 0   %if the test is less than zero than the root is not in the upper
      %part
    xu = xr;    
  elseif test > 0   %if the test is greater than zero, the root is in the upper part
    xl = xr; %we set xl equal to xr to move it towards the upper portion
  else
    ea = 0;     %if ea is zero if there is no difference( they are the same number)
  end
  if ea <= es || iter >= maxit %This will break the loop if the ea is smaller than
      %es
      break
  end
end
root = xr; fx = func(xr, varargin{:}); %This set the root equal to xr
%and fx equals the function value at xr with the variable parameters. 