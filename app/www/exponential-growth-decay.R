par(lwd=3)

x <- seq(0, 10, by=0.1)
y1 <- exp(x * 0.5)
y2  <- max(y1) * exp(x * -0.5)

png("growth-green.png", width=600, height=400, res=100)
plot(x, y1, type="l", axes=FALSE, xlab="", ylab="", col="#69af22", lwd=5)
axis(1, lwd=2, at=0:10, labels = NA)
axis(2, lwd=2, at=seq(0, 150, 25), labels = NA)
dev.off()

png("decay-cyan.png", width=600, height=400, res=100)
plot(x, y2, type="l", axes=FALSE, xlab="", ylab="", col="#009de0", lwd=5)
axis(1, lwd=2, at=0:10, labels = NA)
axis(2, lwd=2, at=seq(0, 150, 25), labels = NA)
dev.off()

png("consumption-red.png", width=600, height=400, res=100)
plot(x, max(y1) - y1, type="l", axes=FALSE, xlab="", ylab="", col="#f2aa8d", lwd=5)
axis(1, lwd=2, at=0:10, labels = NA)
axis(2, lwd=2, at=seq(0, 150, 25), labels = NA)
dev.off()

png("decay-tomato.png", width=600, height=400, res=100)
plot(x, y2, type="l", axes=FALSE, xlab="", ylab="", col="tomato", lwd=5)
axis(1, lwd=2, at=0:10, labels = NA)
axis(2, lwd=2, at=seq(0, 150, 25), labels = NA)
dev.off()


png("interaction.png", width=600, height=400, res=100)
plot(x, y2, type="l", axes=FALSE, xlab="", ylab="", col="#69af22", lwd=5)
lines(x, y1, col="#009de0", lwd=5)
axis(1, lwd=2, at=0:10, labels = NA)
axis(2, lwd=2, at=seq(0, 150, 25), labels = NA)
dev.off()
