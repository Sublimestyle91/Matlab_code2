#Problem 1
CC=c(-.26,-.03,.3,.37,.4,.5,.55,.55)
D=c(-2.35,-2.2,-2.12,-1.95,-1.85,-1.8,-1.7,-1.58)

CCmean=mean(CC)
Dmean=mean(D)
Lxx=sum((CC-CCmean)^2)
Lxy=sum((CC-CCmean)*(D-Dmean))
Lyy=sum((D-Dmean)^2)
B=Lxy/Lxx
a=Dmean-B*CCmean

plot(CC,D)
regressionline=function(x){B*x+a}
x=seq(-.4,.6, by= .01)
y=regressionline(x)
plot(CC,D)
points(x,y,type="l", col="skyblue")
predictedvals=regressionline(CC)
points(CC,predictedvals, col="red")


#sample variance explained
Rsq=((Lxy)^(2)/(Lxx*Lyy))


#It seems the total sum of squares is just Lyy
totalSS=Lyy
RegSS=sum((predictedvals-Dmean)^2)
ResSS=sum((D-predictedvals)^2)
Rsq2=RegSS/totalSS

#The values for rsq are the same
residuals= ((D-predictedvals))

#This is for the part about how to plot it
#



#Now it is time for the f test
stripchart(residuals)


#not time for f test
RegMS=RegSS
ResMS=ResSS/(length(CC)-2)
Ftest=RegMS/ResMS

Fprob=1-pf(Ftest,1,6)
#it seems that it is pretty significant

#Now lets check the results with R
myReg=lm(D~CC)
plot(CC,D)
abline(myReg, col="red") #how to actually draw a line

summary(myReg)

