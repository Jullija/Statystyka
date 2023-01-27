library(smoof)
library(ecr)
library(rmarkdown)


#Ackley(-32.8, 32.8) i Rastrigin(-5.12, 5.12)

#macierz do porównywania ze średnimi wartościami
result <- matrix(nrow=3, ncol=4)
rownames(result) <- c("2 wymiary", "10 wymiarów", "20 wymiarów")
colnames(result) <- c("AckleyPRS", "RastrigingPRS", "AckleyGA", "RastriginGA")

#macierz z wynikami dla funkcji Ackley'a
ackleyMatrix <- matrix(nrow=50, ncol=6)
colnames(ackleyMatrix) <- c("AckleyPRS2", "AckleyPRS10", "AckleyPRS20", "AckleyGA2", "AckleyGA10", "AckleyGA20")

#macierz z wynikami dla funkcji Rastrigina
rastriginMatrix <- matrix(nrow=50, ncol=6)
colnames(rastriginMatrix) <- c("RastriginPRS2", "RastriginPRS10", "RastriginPRS20", "RastriginGA2", "RastriginGA10", "RastriginGA20")

AckleyFun <- function(dimen){
  afun <- makeAckleyFunction(dimen)
  min(replicate(1000, afun(runif(dimen, min = -32.8, max = 32.8))))
}

RastriginFun <- function(dimen){
  rfun <- makeRastriginFunction(dimen)
  min(replicate(1000,rfun(runif(dimen, min = -5.12, max = 5.12))))
}



#PURE RANDOM SEARCH

vec <- replicate(50, AckleyFun(2))
ackleyMatrix[,1] = vec
result[1, 1]=mean(vec)


vec2 <- replicate(50, RastriginFun(2))
rastriginMatrix[,1] = vec2
result[1, 2]=mean(vec2)

vec <- replicate(50, AckleyFun(10))
ackleyMatrix[,2] = vec
result[2, 1]=mean(vec)

vec2 <- replicate(50, RastriginFun(10))
rastriginMatrix[,2] = vec2
result[2, 2]=mean(vec2)


vec <- replicate(50, AckleyFun(20))
ackleyMatrix[,3] = vec
result[3, 1]=mean(vec)

vec2 <- replicate(50, RastriginFun(20))
rastriginMatrix[,3] = vec2
result[3, 2]=mean(vec2)

result





#GENETICAL ALGORITHM


Ackley <- function(dimen){
  ecr(fitness.fun=makeAckleyFunction(dimen), lower = replicate(dimen, -32.8), upper = replicate(dimen, 32.8), 
      minimize=TRUE, representation = "float", mu=100L, lambda=10L, terminators = list(stopOnEvals(1000)),
      mutator = setup(mutGauss, lower=replicate(dimen, -32.8), upper = replicate(dimen, 32.8)))$best.y
}

Rastrigin <- function(dimen){
  ecr(fitness.fun=makeRastriginFunction(dimen), lower = replicate(dimen, -5.12), upper = replicate(dimen, 5.12), 
      minimize=TRUE, n.dim = dimen, representation = "float", mu=100L, lambda=10L, terminators = list(stopOnEvals(1000)),
      mutator = setup(mutGauss, lower=replicate(dimen, -5.12), upper = replicate(dimen, 5.12)))$best.y
}

vec = replicate(50, Ackley(2))
ackleyMatrix[,4] = vec
result[1, 3]=mean(vec)

vec2 = replicate(50, Rastrigin(2))
rastriginMatrix[,4] = vec2
result[1, 4]=mean(vec2)



vec = replicate(50, Ackley(10))
ackleyMatrix[,5] = vec
result[2, 3]=mean(vec)


vec2 = replicate(50, Rastrigin(10))
rastriginMatrix[,5] = vec2
result[2, 4]=mean(vec2)



vec = replicate(50, Ackley(20))
ackleyMatrix[,6] = vec
result[3, 3]=mean(vec)


vec2 = replicate(50, Rastrigin(20))
rastriginMatrix[,6] = vec2
result[3, 4]=mean(vec2)

