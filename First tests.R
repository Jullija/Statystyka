if (runif(1) > 0.5) {
  "Orzeł"
} else {
  "Reszka"
}



x <- runif(20)
rzuty <- ifelse(x > 0.5, "Orzeł", "Reszka")
rzuty




liczba_orlow <- 0
while (runif(1) > 0.5){
  liczba_orlow <- liczba_orlow + 1
}
liczba_orlow




liczba_orlow <- 0
repeat {
  if (runif(1) <= 0.5) break
  liczba_orlow <- liczba_orlow + 1
}
liczba_orlow



x <- runif(20)
x
for (i in seq_along(x)) {
  print(mean(x[1:i]))
}






FUNCKJE

f <- function(x, a = 2) x^2 + 10 * a

f(10)
f(10, 4)
f(a = -1, x = 3)
f(c(-1, 1))



g <- function(z) {
  stopifnot(all(z > 0))
  sin(z^2) - pi
}

g(3)
g(-3)



h <- function(x) {
  if (x < 0) {
    return(x + 10)
  }
  cos(x - 1)
}

h(-1)
h(10)






RYSOWANIE


x <- sample(1:1000, 100, replace = TRUE) #(przedział, ile łącznie próbek)
hist(x)
hist(x, freq = FALSE)
hist(x, breaks = 4)
hist(x, breaks = c(0, 210, 650, 884, 1000))


boxplot(x)
boxplot(x, horizontal = TRUE)




x <- sample(1:1000, 100, replace = TRUE)
y <- sample(1:1000, 100, replace = TRUE)
plot(x, y)
plot(x, y, xlab = "Zmienna x", ylab = "Zmienna y", main = "Wykres y względem x")


pdf("scatterplot.pdf")
plot(x, y, col = "pink")
dev.off()



x <- seq(-pi, pi, length.out = 100)
plot(x, sin(x), type = "l", ylab = "y")
lines(x, cos(x), type = "l", col = "orange")
