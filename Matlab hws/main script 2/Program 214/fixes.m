x=[1,2,3,4,3,7]

while (1)
    count=0
for i=1:length(x)-1
    if x(i) > x(i+1)
       x(i+1:-1:i)= x(i:i+1)
       count=count + 1
    end
end
if count == 0, break,end 
end