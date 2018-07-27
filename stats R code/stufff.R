poison=read.csv(file="poison.csv")
str(poison)
Time=poison$Time
Treatment=poison$Treatment
Poison=poison$Poison
myFit=aov(Time ~ Poison + Treatment + Poison:Treatment )
anova(myFit)
with(data=poison, expr={interaction.plot(Poison, Treatment,
                                         response=Time)
  interaction.plot(Treatment, Poison, response=Time)})
model.tables(myFit, type="means")
TukeyHSD(myFit, which=c("Poison","Treatment"))
plot(TukeyHSD(myFit, which=c("Poison","Treatment")))
pairwise.t.test(poison$Time, poison$Poison)
pairwise.t.test(poison$Time, poison$Treatment)