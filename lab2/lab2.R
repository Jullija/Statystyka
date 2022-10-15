l <- list(a = c(2, 3, 4), f = function(x) sum(x^2), b = "Ala ma kota")
l


l[1]
l[1][2]
l[2]
l[2](3)

l[[1]]
l[[1]][2]
l[[2]]
l[[2]](3)


l[['a']]
l$a
l[['a']][2]
l$a[2]
l$f(3)


f <- function() {
  list(x = 10, y = 32)
}

f()$x
f()$y




directions <- factor(c("N", "E", "S", "W", "E", "E", "N", "S"))
directions
table(directions)
pressures <- factor(c("High", "High", "Low", "Medium", "Low", "Low"), levels = c("Low", "Medium", "High"), ordered = TRUE)
pressures
table(pressures)
x <- sample(1:10, 100, replace = TRUE)
y <- sample(1:1000/1000, 100, replace = TRUE)
plot(x, y)
fx <- factor(x)
plot(fx, y)



x <- 1
class(x)
class(x) <- "super_fighter"
class(x)


inherits(x, "super_fighter")
inherits(x, "numeric")
inherits(2, "numeric")

class(x) <- c("Ala", "Ola", "Ula")
class(x)
inherits(x, "Ala")
inherits(x, c("Ola", "Ela", "Ala"))
inherits(x, c("Ola", "Ela", "Ala"), which = TRUE)


fff <- function(x, y) {
  UseMethod("fff")
}


fff.numeric <- function(x, y) {
  x + pi * as.numeric(y)
}

fff.super_fighter <- function(x, y) {
  "I am a super fighter!"
}


z <- 1
fff(z, 13)
class(z) <- "super_fighter"
fff(z, 13)


class(z) <- c("numeric", "super_fighter", "alamakota")
fff(z, 13)





fff("ala", 13) #Ta linia zgłasza błąd!

fff.default <- function(x, y) {
  y
}

fff("ala", 13)




print.super_fighter <- function(x) {
  print(paste("Super fighter", x))
}

z <- 1
class(z) <- "super_fighter"
z






#------------------Rozkłady prawdopodobieństwa----------------------------------
dnorm(2.3)
pnorm(2.3)
x1 <- rnorm(10)
mean(x1)
var(x1)
sd(x1)
x2 <- rnorm(10, mean = 1, sd = 5)
mean(x2)
var(x2)
sd(x2)
dpois(2, lambda = 1)
rpois(10, lambda = 1)
qpois(0.75, lambda = 1)



rnorm(10)
rnorm(10)
set.seed(2020)
rnorm(10)
set.seed(2020)
rnorm(10)  
  

#------------------Rysowanie trójwymiarowe--------------------------------------
x <- seq(-pi, pi, length.out = 100)
y <- x
f <- outer(x, y, function(x, y) cos(y) / (1 + x^2))
contour(x, y, f)
contour(x, y, f, nlevels = 45)
fa <- (f - t(f)) / 2
contour(x, y, fa, nlevels = 15)
t(f) #macierz transponowana


image(x, y, f)
image(x, y, f, col = topo.colors(32, alpha = 1))
contour(x, y, f, add = TRUE)  


persp(x, y, f)
persp(x, y, f, theta = 30)
persp(x, y, f, theta = 30, phi = 40)
persp(x, y, f, theta = 30, phi = 40, shade = 0.75, border = NA)
  


#-------------Ramki danych i dane zewnętrzne------------------------------------
df <- data.frame(nazwa = c("Tatooine", "Dagobah", "Hoth"), 
                 srednica = c(20, 37.4, 11.22),
                 klimat = factor(c("pustynia", "bagno", "snieg")))
df


df$srednica
df[, 2]
df["srednica"]
df[2]
df[2,]


Auto <- read.table("Auto.data")
class(Auto)
Auto

Auto <- read.table("Auto.data", header = TRUE, na.strings = "?")
names(Auto)
head(Auto)

Auto <- read.csv("Auto.csv", header = TRUE, na.strings = "?")
head(Auto)


dim(Auto)
Auto <- na.omit(Auto)ś
dim(Auto)

Auto[2, 5]
Auto[2, "weight"]
Auto[, 5]
Auto[, "weight"]
Auto[1:4]
Auto[1:4,]
Auto[3:10, c(2, 5)]
Auto[3:10, c("cylinders", "weight")]

Auto$mpg
Auto$weight[1:4]
Auto$cylinders[Auto$mpg > 30]
Auto[Auto$mpg > 30,]
attach(Auto)
mpg
mpg[mpg > 30]
cylinders[mpg > 30]
Auto[mpg > 30,]
Auto[mpg > 30, "weight"]

plot(cylinders, mpg)
plot(as.factor(cylinders), mpg)
hist(mpg)
hist(mpg, col = "red")
hist(mpg, col = "red", breaks = 15)
pairs(Auto)
pairs(~ mpg + displacement + horsepower + weight + acceleration, data = Auto)

plot(horsepower, mpg)
identify(horsepower, mpg, name)

summary(Auto)
summary(mpg)