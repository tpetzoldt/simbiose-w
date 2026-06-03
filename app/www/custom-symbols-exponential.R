library(ggimage)
library(ggplot2)
library(rsvg)
library(dplyr)
library(ggthemes)

my_theme <- theme(
  axis.text    = element_text(size = 12),
  axis.title   = element_text(size = 12, face = "bold"),
  legend.title = element_text(size = 12, face = "bold"),
  legend.text  = element_text(size = 12))

x <- rep(0:6, 2^(0:6))
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
d$x[1] <- 0 # adjust first to 0
p <- d |>
  rename(Zeit = x, Abundanz = y) |>
  ggplot(aes(Zeit ,Abundanz, image=image)) + geom_image(size=.08) +
  scale_x_continuous(limits = c(-0.5, 6.5), breaks = 0:6)
  #theme_igray() +
  #my_theme
print(p)

png("algae-exp_de.png", width=1800, height=900, res=250)
print(p)
dev.off()

p <- p + xlab("Time") + ylab("Abundance")
print(p)
png("algae-exp_en.png", width=1800, height=900, res=250)
print(p)
dev.off()

