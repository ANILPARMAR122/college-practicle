n <- as.integer(readline("Enter number of terms: "))

a <- 0
b <- 1

for(i in 1:n) {
  print(a)
  temp <- a + b
  a <- b
  b <- temp
}
