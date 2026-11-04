n <- as.integer(readline("Enter a number: "))
temp <- n
total <- 0
digits <- nchar(as.character(n))

while(temp > 0) {
  r <- temp %% 10
  total <- total + r^digits
  temp <- temp %/% 10
}

if(total == n) {
  print("Armstrong Number")
} else {
  print("Not an Armstrong Number")
}
