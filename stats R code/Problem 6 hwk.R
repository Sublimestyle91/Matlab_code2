#Problem 6 anova
corr=c(.435,.424,.428,.420)
sd=c(.058,.061,.062,.067)
N=c(267,695,1695,237)
BSS=sum(N*corr^2)-(sum(N*corr)^2)/sum(N)
BMS=BSS/(length(corr)-1)
WSS=sum((N-1)*sd^2)
WMS=WSS/(sum(N)-length(corr))
Ftest=BMS/WMS
Fprob=1-pf(Ftest,length(corr),sum(N)-length(corr))

#We can reject the null hypothesis at a high significance level(p<.0001) There is statistically significant evidence against all a being
#equal

#Now we are going to compare the 1st and second corr value

sigma=sqrt(WMS)
deltay=corr[1]-corr[2]

tval=deltay/(sigma*sqrt(1/267+1/695))
df=sum(N)-length(corr)
pval=2*(1-pt(tval,df))

#with a pval of .013 we can reject the ho that says they are the same


