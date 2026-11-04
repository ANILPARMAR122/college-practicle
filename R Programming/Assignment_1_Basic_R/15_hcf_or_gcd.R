a <- as.integer(readline("Enter first number: "))
b <- as.integer(readline("Enter second number: "))

while(b != 0) {
  temp <- b
  b <- a %% b
  a <- temp
}

print(a)
