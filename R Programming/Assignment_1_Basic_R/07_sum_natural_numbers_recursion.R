sum_n <- function(n) {
  if(n == 0) {
    return(0)
  }
  return(n + sum_n(n - 1))
}

n <- as.integer(readline("Enter a number: "))
print(sum_n(n))
