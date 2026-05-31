library(datasets)

png("lynx.png", width=1600, height=800, pointsize = 36)
par(lwd=3)
plot(lynx, xlab="Zeit", ylab="Anzahl Luchsfänge", las=1)
dev.off()
