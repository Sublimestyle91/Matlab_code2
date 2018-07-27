#Problem 7
sd=c(30,30,30)
N=c(75, 100,95)
meany=c(3900,6200,3990)/N
lastcol=N*(meany^2)

#f test to see if there are actually any differences
#ho= all alphas the same
#at least one is different
BSS=sum(meany^2*N)
wSS=sum((N-1)*sd^2)
BMS=BSS/(3-1)
WMS=wSS/(sum(N)-3)
Ftest=BMS/WMS
prop=1-pf(Ftest,2,sum(N)-3)

#There is definitely a difference between one of them
#
#
#
#
#

#Now it is time to take a t test of all of them
sigma=sqrt(WMS)

#for group 1 and 2
deltay=meany[1]-meany[2]
tval1=deltay/(sigma*sqrt(1/75+1/100))
probtval1=2*(pt(tval1,sum(N)-3)) #significant


#for group 1 and group 3
deltay2=meany[1]-meany[2]
tval2=deltay2/(sigma*sqrt(1/75+1/95))
probtval2=2*(pt(tval2,sum(N)-3))

#for group 2 and 3
deltay3=meany[2]-meany[3]
tval3=deltay3/(sigma*sqrt(1/100+1/95))
probtval3=2*(1-pt(tval3,sum(N)-3))

