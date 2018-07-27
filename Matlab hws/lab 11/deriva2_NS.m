function dydx= deriva2_NS(x,y)
n=length(x)
difference=diff(x)
h=mean(difference)
dydx(1)= (-y(3)-2*y(2)+y(1))/(h^2)
dydx(n)=(y(n)-2*y(n-1)+y(n-2))/(h^2);
for i=2:n-1
    dydx(i)=(y(i+1)-2*(y(i))+y(i-1))/h^2
end
