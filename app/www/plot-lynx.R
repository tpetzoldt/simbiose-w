library(datasets)

png("lynx_de.png", width=1600, height=600, pointsize = 36)
par(lwd=3, mar=c(4,4,.5,.5))
plot(lynx, xlab="Jahr", ylab="Anzahl Luchsfänge", las=1)
dev.off()

png("lynx_en.png", width=1600, height=600, pointsize = 36)
par(lwd=3, mar=c(4,4,.5,.5))
plot(lynx, xlab="Year", ylab="Numbers of lynx trappings", las=1)
dev.off()
