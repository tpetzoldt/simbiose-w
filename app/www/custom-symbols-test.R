library(ggimage)
library(ggplot2)
library(rsvg)

d <- data.frame(x = 0:10, y = runif(11), image='scenedesmus.svg')

p <- ggplot(d, aes(x,y, image=image)) + geom_image(size=.1) + theme_void()

print(p)

png("test.png", width=3200, height=2000, res=600)
print(p)
dev.off()
