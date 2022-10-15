#1. Jaka jest średnia i mediana opadów w rejestrowanych miastach?
mean(precip)
median(precip)
  
#2. Jaka jest wariancja i odchylenie standardowe opadów?
var(precip)
sd(precip)
  
#3. Jaki jest rozstęp opadów? [Uwaga: standardowa funkcja range() nie liczy wprost rozstępu tylko wektor dwuelementowy zawierający minimum i maksimum].
rozstep <- range(precip)[2] - range(precip)[1]
rozstep

#4. Jaki jest rozstęp międzykwartylowy? Porównaj wynik uzyskany przy pomocy funkcji IQR() (?IQR) z wynikiem uzyskanym (jak na wykładzie) przy pomocy funkcji fivenum() (?fivenum).
IQR(precip)
fivenum(precip)

#5. Jakie jest odchylenie przeciętne od średniej? Jakie jest odchylenie przeciętne od mediany?
mad(precip, center = mean(precip))
mad(precip, center = median(precip))


#6. Jaki jest poziom opadów w miastach, których nazwa zaczyna się na “M” (?startsWith)?
cities <- names(precip)

for (i in 1:length(cities)){
  if (startsWith(cities[i], "M")){
    print(precip[i])
  }
}

precip[startsWith(names(precip), "M")]


  
#7. W których miastach opady są równe średniej?
cities <- names(precip)

for(i in 1:length(cities)){
  if (precip[[i]] == round(mean(precip))){
    print(cities[i])
  }
}

precip[precip == round(mean(precip))]
  
#8. W których miastach opady różnią się od mediany nie więcej niż 0.5 cala?
cities <- names(precip)
range <- 1:length(cities)

for (i in range){ #jeśli dane są w inch. jeśli nie, to *0.4 jeszcze precip i median
  if ((precip[i] >= median(precip) - 0.5) & (precip[i] <= median(precip + 0.5))){
    print(cities[i])
  }
}

precip[abs(precip - median(precip)) <= 0.5]
  
#9. W którym mieście opady są najmniejsze, a w którym największe?
sorted <- sort(precip)
mini <- names(sorted[1])
maxi <- names(sorted[length(precip)])
print(paste("Najmniejsze opady są w", mini))
print(paste("Największe opdady są w", maxi))


  
#10. Ile jest miast z opadami powyżej średniej?
ans <- 0

for (i in 1:length(precip)){
  if (precip[i] > mean(precip)){
     ans <- ans + 1
  }
}
ans

length(precip[precip>mean(precip)])


sum(x > mean(x))


#11. W których miastach opady leżą powyżej górnego kwartyla?
kwartyle <- quantile(precip) #górny kwartyl to ten >= 75%
cities <- names(precip)

for (i in 1:length(precip)){
  if (precip[i] > kwartyle[4]){
    print(cities[i])
  }
}
  
precip[precip > fivenum(precip)[4]]


#12. W których miastach opady leżą poniżej dolnego kwartyla?
kwartyle <- quantile(precip) #górny kwartyl to ten <= 25%
cities <- names(precip)

for (i in 1:length(precip)){
  if (precip[i] < kwartyle[2]){
    print(cities[i])
  }
}  

precip[precip < fivenum(precip)[2]]
#13. Narysuj histogram rozkładu. Jakie wnioski na temat rozkładu można z niego wyciągnąć?
  hist(precip, xlab="ilość opadów", ylab="ile miast")
  
#14. Narysuj wykres pudełkowy rozkładu. Jakie z niego płyną wnioski? Które miasta stanowią wartości odstające na wykresie pudełkowym (?boxplot, ?boxplot.stats)?
boxplot(precip)  
boxplot.stats(precip)
  
  

#x[1] - zwraca tego samego typu (np gdy w liscie damy l[1], to zwróci podlistę)
#x[[1]] - zwraca pojedynczą wartość 
#x <- c(1, 2, 3)
#x[5]
#x[5] <- 300
#x
#x[[10]]

  
  