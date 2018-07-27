#anova test
corr=c(3.78,3.3,3.32,3.23,2.73,2.59)
sd=c(.79,.77,.86,.78,.81,.82)
lymeans=length(ymeans)
lsdy=length(sdy)
N=c(200,200,50,200,200,200)
groups=length(N)
BSS=sum(N*corr^2)-(sum(N*corr)^2)/sum(N)
BMS=BSS/(length(corr)-1)
WSS=sum((N-1)*sd^2)
WMS=WSS/(sum(N)-length(corr))
Ftest=BMS/WMS


