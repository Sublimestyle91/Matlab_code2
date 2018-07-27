#example for two way ANOVA
y=c(4.5,8.8,5.9,6.4,7.8,6.8,7.2,9.6,5.7,6.7,7.0,5.2)
meany=mean(y)
tv=sum((y-meany)^2)
row1=c(4.5,6.4,7.2,6.7)
row2=c(8.8,7.8,9.6,7.0)
row3=c(5.9,6.8,5.7,5.2)
row1m=mean(row1)
row2m=mean(row2)
row3m=mean(row3)
col1=c(4.5,8.8,5.9)
col2=c(6.4,7.8,6.8)
col3=c(7.2,9.6,5.7)
col4=c(6.7,7.0,5.2)
col1m=mean(col1)
col2m=mean(col2)
col3m=mean(col3)
col4m=mean(col4)

BSScol= ((6.4-6.8)^2+(7-6.8)^2+(7.5-6.8)^2+(6.3-6.8)^2)*3
BSSrow= ((row1m-6.8)^2+(row2m-6.8)^2+(row3m-6.8)^2)*4
#we don't muliply it by the k term becasue this term is 1. 
#The i to a is doing (y-meany)^2
#Then we loop it one more time to find BSSr
BSSres=tv-BSScol-BSSrow
WSS=BSSres
WMS=BSSres/(2*3)
BMScol=BSScol/(3)
BMSrow=BSSrow/2
BMSres=BSSres/((3-1)*(4-1))

FR=BMSrow/WMS
FC=BMScol/WMS
FI=BMSres/WMS

proprow=1-pf(FR,2,6)
propcol=1-pf(FC,3,6)
propres=1-pf(FI,6,6)