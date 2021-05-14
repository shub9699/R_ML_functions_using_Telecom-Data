View(CustDemo)
names(CustDemo)
names(WeeklyData)

#fetch the customers having gender=f and age>30
femalecust<-sum(CustDemo$Gender=="F"); femalecust
age<- sum(CustDemo$Age>30); age
sub1<- subset(CustDemo, CustDemo$Gender=="F" & CustDemo$Age>30); sub1

#find the total usage(minutes) for each customer
names(WeeklyData)
usage<-aggregate(Minutes~CustID, data = WeeklyData, FUN = sum); arr1

#first 5 highest usage customer with gender and status.
highest<- merge(CustDemo,usage,by='CustID')
head(highest)
ord1<-highest[order(highest$Minutes, decreasing = T),]
head(ord1)
#ANSWER
A<-ord1[,c(1,3,5)]
head(A)

#divide the age group in 3 groups: 1to20(cat1), 21to30(cat2), 30 and above(cat3)
summary(CustDemo$Age)
CustDemo$Age_grp<-cut(CustDemo$Age, breaks = c(1,20,30,Inf), labels = c("cat1", "cat2", "cat3"))
head(CustDemo)
