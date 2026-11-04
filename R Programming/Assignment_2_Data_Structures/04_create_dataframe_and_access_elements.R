name <- c("Anil", "Rahul", "Amit")
age <- c(20, 21, 22)
marks <- c(85, 90, 78)

data <- data.frame(name, age, marks)

print(data)
print(data$name)
print(data[1, ])
print(data[1, 2])
