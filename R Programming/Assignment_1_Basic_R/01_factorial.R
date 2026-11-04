n <- as.integer(readline("Enter a number: "))
fact <- 1

for(i in 1:n) {
  fact <- fact * i
}

print(fact)
