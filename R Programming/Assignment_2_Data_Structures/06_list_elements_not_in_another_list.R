list1 <- list(10, 20, 30, 40, 50)
list2 <- list(20, 40)

result <- list1[!unlist(list1) %in% unlist(list2)]

print(result)
