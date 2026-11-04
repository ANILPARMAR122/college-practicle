binary <- function(n) {
  if(n == 0) {
    return("")
  }
  return(paste0(binary(n %/% 2), n %% 2))
}

n <- as.integer(readline("Enter a decimal number: "))

if(n == 0) {
  print("0")
} else {
  print(binary(n))
}
