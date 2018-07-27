CC=c(-.26,-.03,.3,.37,.4,.5,.55,.55)
D=c(-2.35,-2.2,-2.12,-1.95,-1.85,-1.8,.58)

Estriol=c(7,9,9,12,14,16,16,14,16,16,17,19,21,24,15,16,17,25,27,15,15,15,16,19,18,17,18,20,22,25,24)
Birtweight= c(25,25,25,27,27,27,24,30,30,31,30,31,30,28,32,32,32,32,34,34,34,35,35,34,35,36,37,38,40,39,43)

Estriomean=mean(Estriol)
Birtmean=mean(Birtweight)
estriolsum=sum(Estriol)
Birthsum=sum(Birtweight)
estrilsumsq=sum(Estriol^2)
brithsumsq=sum(Birtweight^2)
product=sum(Birtweight*Estriol)
Lxy=sum((Estriol-Estriomean)*(Birtweight-Birtmean))
Lxx=sum((Estriol-Estriomean)^2)
B=Lxy/Lxx
a=Birtmean-B*Estriomean
function (x)  21.52+.608x