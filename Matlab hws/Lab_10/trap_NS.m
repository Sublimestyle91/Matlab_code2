function I = trap_NS(func,a,b,n,varargin)
% trap: composite trapezoidal rule quadrature
% I = trap(func,a,b,n,pl,p2,...):
% composite trapezoidal rule
% input:
% func = name of function to be integrated
% a, b = integration limits
% n = number of segments (default = 100)
% pl,p2,... = additional parameters used by func
% output:
% I = integral estimate
if nargin<3,error('at least 3 input arguments required'),end
if ~(b>a),error('upper bound must be greater than lower'),end
if nargin<4|isempty(n),n=100;end
x = a; h = (b - a)/n; %This just gives you the interval width, and sest x equal to the first limit. 
s=func(a,varargin{:}); %sets the function equal to s
for i = 1 : n-1 %loop
x = x + h; %gives you easch interval
s = s + 2*func(x,varargin{:}); %This gives you teh weighted trapezoidal part
end %above is the composite trapezoidal rule. This is why it is in that form
s = s + func(b,varargin{:}); %This part adds the last term to the equation which is the end point b. 
I = (b - a) * s/(2*n);