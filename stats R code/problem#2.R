#problem #2
CC=c(-.26,-.03,.3,.37,.4,.5,.55,.55)
D=c(-2.35,-2.2,-2.12,-1.95,-1.85,-1.8,-1.7,-1.58)
CCmean=mean(CC)
Dmean=mean(D)
Lxx=sum((CC-CCmean)^2)
Lxy=sum((CC-CCmean)*(D-Dmean))
Lyy=sum((D-Dmean)^2)

R=Lxy/sqrt(Lxx*Lyy)

#null= h0: p=0
#alternative Ha: p~=0
n=length(CC)
t= R/sqrt((1-R^2)/(n-2))
tprob=1-pt(t,n-2)

#Now it is time to check the answer

cor(CC,D) #gives you the correlation coefficient
cor.test(CC,D) #runs a correlation test
