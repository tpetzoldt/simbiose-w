library(ggimage)
library(ggplot2)
library(rsvg)

library(dplyr)
library(ggthemes)


K <- 120

xx <- numeric(13)

xx[1] <- 1
for (i in 1:(length(xx)-1)) {
  xx[i+1] <- 2 * xx[i] * (1-xx[i]/K)
}

xx <- round(xx)

plot(xx)

x <- rep(1:length(xx), xx)

k <- 0
y <- numeric(length(x))
y[1] <- 1
for (i in 2:length(x)) {
  if (x[i-1] == x[i]) {
    k <- k + 1
  } else {
    k <- 1
  }
  y[i] <- k
}

plot(x, y)

set.seed(123)
d <- data.frame(x=jitter(x, factor=1.2), y=y, image="scenedesmus.svg")
d$x[1] <- 1 # adjust first to 0
d$x <- d$x - 1
p <- d |>
  rename(Zeit = x, Abundanz = y) |>
  ggplot(aes(Zeit, Abundanz, image=image)) + geom_image(size=.06) +
  scale_x_continuous(limits = c(-0.5, 12.5), breaks = 0:12)

print(p)

png("algen-logistisch.png", width=1800, height=900, res=250)
print(p)
dev.off()
