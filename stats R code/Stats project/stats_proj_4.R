
library(car)
dioxin=read.csv("dioxin.csv")
str(dioxin)
myFit=aov(AF ~ Activity*Treatment,data=dioxin)
anova(myFit)
with(data=dioxin, expr={interaction.plot(Activity,Treatment,response=AF) + interaction.plot(Treatment,Activity,response=AF)
})

model.tables(myFit,type="means")
TukeyHSD(myFit,which=c("Activity","Treatment"))
plot(TukeyHSD(myFit,which=c("Activity","Treatment")))

pairwise.t.test(dioxin$AF,dioxin$Activity)
pairwise.t.test(dioxin$AF,dioxin$Treatment)

shapiro.test(myFit$res)
#levene.test
#model<-aov(gain~diet*supplement)
#levene.test(gain~diet*supplement)

leveneTest(AF ~ Activity*Treatment, data = dioxin)
#leveneTest(len ~ supp*dose, data = my_data)

qqnorm(myFit$res)
plot(myFit$fitted,myFit$res,xlab="Fitted",ylab="Residuals")
x=dioxin$AF
y=dioxin$Activity#
plot(x,y)
plot(dioxin$AF,dioxin$Treatment)
