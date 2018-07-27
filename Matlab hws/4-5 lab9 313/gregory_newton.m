function yi = GregoryNewton(x,y,xi,n)
%GregoryNewton One dimensional interpolation.
%
%   YI = GregoryNewton(X,Y,XI,N) applies the Nth-order
%   Gregory-Newton forward interpolation to find YI, the
%   values of the underlying function Y at the points in
%   the vector XI.  The vector X specifies the points at 
%   which the data Y is given.
%
%   YI = GregoryNewton(X,Y,XI) is equivalent to the
%   linear interpolation.
%
%   See also INTERP1, NATURALSPLINE, Lagrange, SPLINE, INTERP1Q

% (c) N. Mostoufi & A. Constantinides
% January 1, 1999

% Initialization
if nargin < 3
   error('Invalid number of inputs.')
end

% Check x for equal spacing and determining h
if min(diff(x)) ~= max(diff(x))
   error('Independent variable is not monotonic.')
else
   h = x(2) - x(1);
end

x = (x(:).')';    % Make sure it's a column vector
y = (y(:).')';    % Make sure it's a column vector
nx = length(x);
ny = length(y);
if nx ~= ny
   error('X and Y vectors are not the same size.');
end

% Check the order of interpolation
if nargin == 3 | n < 1
   n = 1;
end
n = floor(n);
if n >= nx
   fprintf('\nNot enough data points for %2d-order interpolation.',n)
   fprintf('\n%2d-order interpolation will be performed instead.\n',nx-1)
   n = nx - 1;
end

deltax(1,1:length(xi)) = ones(1,length(xi));
% Locating the required number of base points
for m = 1:length(xi)
   dx = xi(m) - x;
   % Locating xi
   [dxm , loc(m)] = min(abs(dx));
   % locating the first base point
   if dx(loc(m)) < 0
      loc(m) = loc(m) - 1;
   end
   if loc(m) < 1
      loc(m) = 1;
   end
   if loc(m)+n > nx
      loc(m) = nx - n;
   end
   deltax(2:n+1,m) = dx(loc(m):loc(m)+n-1);
   ytemp(1:n+1,m) = y(loc(m):loc(m)+n);
end

% Interpolation
yi = y(loc)';
for k = 1 : n
   yi = yi + prod(deltax(1:k+1,:)) .* diff(ytemp(1:k+1,:),k) /...
      (gamma(k+1) * h^k);
end



