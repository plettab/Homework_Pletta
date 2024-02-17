

# Load Tribble
tribble( ~x, ~y, ~w, ~z,
         210, 300, 220, 180,
         102, 100, 119, 187,
         176, 175, 188, 173,
         87, 95, 91, 94,
         202, 210, 234, 218,
         110, 122, 131, 128,
) -> dt

dt

# 1_a

map_dbl(dt, mean)

# 1_b

map_dbl(dt, sd)

# 1_c

map(dt, sqrt)

# 1_d

map(dt, summary)

# 2 

new_func_1 <- function(iterations = 10000, samples = 5) {
  means <- numeric(iterations)
  for (i in 1:iterations) {
    observations <- rexp(samples, rate = 1)
    means[i] <- mean(observations)
  }
  return(means)
}

means <- new_func_1()

means

hist(means, breaks = 30, col = "green", main = "Distribution",
     xlab = "Mean", ylab = "Frequency")

# 2a

new_func_2 <- function(samples) {
  observations <- rexp(samples, rate =1)
  return(mean(observations))
}

means2 <- map_dbl(1:10000, ~ new_func_2(5))

hist(means2, breaks = 30, col = "blue", main = "Distribution",
     xlab = "Mean", ylab = "Frequency")

# 2b

new_func_3 <- function(samples) {
  observations <- rexp(samples, rate =1)
  return(mean(observations))
}

means3 <- replicate(10000, new_func_3(5))

hist(means3, breaks = 30, col = "red", main = "Distribution",
     xlab = "Mean", ylab = "Frequency")

