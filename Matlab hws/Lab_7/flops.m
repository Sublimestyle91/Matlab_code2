m=3;
p=1;
n=3
A=[1 2 3;1 2 3;1 2 3];
B=[1; 2 ;3]
C=zeros(3,1);

for i = 1:m
     for j = 1:p
         for k = 1:n
             C(i,j) = C(i,j) + A(i,k)*B(k,j); %there are only two additions
         end
     end
end