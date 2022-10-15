cars <- read.table("Auto.data",  header = TRUE, na.strings = "?")
cars <- read.csv("Auto.csv", header = TRUE, na.strings = "?")
cars <- na.omit(cars)


#1 Jakie jest średnie zużycie paliwa (mpg) wszystkich samochodów?
mean(cars[, "mpg"])  
mean(cars$mpg)

#2 Jakie jest średnie zużycie paliwa samochodów, które mają 4 cylindry?
mean(cars$mpg[cars$cylinders == 4])
  
#3 Jaka jest mediana wagi (weight) wszystkich samochodów?
median(cars$weight)
  
#4 Jakie jest średnie zużycie paliwa samochodów wyprodukowanych w roku 72?
mean(cars$mpg[cars$year == 72])
  
#5 Jaka jest wariancja przyspieszenia (acceleration) wszystkich samochodów?
var(cars$acceleration)
  
#6 Jaka jest wariancja przyspieszenia samochodów japońskich (origin == 3)?
var(cars$acceleration[cars$origin == 3])
  
#7 Ile jest samochodów, których moc (horsepower) jest powyżej średniej?
sum(cars$horsepower > mean(cars$horsepower))

#8 Jaka jest maksymalna moc samochodów, których waga jest poniżej średniej?
max(cars$horsepower[cars$weight < mean(cars$weight)])

#9 Ile jest samochodów, których zużycie paliwa jest poniżej średniej (czyli mpg jest powyżej średniej)?
sum(cars$mpg > mean(cars$mpg))
  
#10 Jaka jest minimalna liczba cylindrów samochodów, których zużycie paliwa jest poniżej średniej?
min(cars$cylinders[cars$mpg > mean(cars$mpg)])
  
#11 Ile jest samochodów o maksymalnej pojemności silnika (displacement)?
sum(cars$displacement == max(cars$displacement))


#12 Jakie jest maksymalna waga (weight) samochodów, których pojemność silnika jest mniejsza od jej mediany?
max(cars$weight[cars$displacement < median(cars$displacement)])
