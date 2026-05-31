
P <- seq(0, 40, 0.1)



k_b <- 0.1

r <- function(P) pmin(k_b * P, rep(1, length=length(P)))

svg("blackman.svg", width=12, height=8, pointsize=36)
par(mar=c(4.2,5,3,1), lwd=3)
plot(P, r(P), type="l", las=1, xlab="Ressource P", ylab="", ylim=c(0, 1.2), yaxs="i",
     xaxs="i", axes=FALSE, main="Blackman-Modell")
mtext("Wachstumsrate r", line = -2, side=2, at=1.2, las=1)
axis(1)
axis(2, at=c(0, 0.5, 1), label=c(expression(0.0), expression(0.5~r[max]), expression(r[max])), las=1)
dev.off()


kP <- 5
r <- function(P) P/(kP + P)

svg("monod.svg", width=12, height=8, pointsize=36)
par(mar=c(4.2,5,3,1), lwd=3)
plot(P, r(P), type="l", las=1, xlab="Ressource P", ylab="", ylim=c(0, 1.2), yaxs="i",
     xaxs="i", axes=FALSE, main="Monod-Modell")
abline(h=1, col="red", lty="dotted")
arrows(5, 0.5, 0, 0.5, col="red", length=0.2, angle=15, lty="dotted")
arrows(5, 0, 5, 0.5, col="red", length=0.2, angle=15, lty="dotted")
axis(1, at=5, labels = expression(k[P]), col.ticks="red")
mtext("Wachstumsrate r", line = -2, side=2, at=1.2, las=1)
axis(1)
axis(2, at=c(0, 0.5, 1), label=c(expression(0.0), expression(0.5~r[max]),
                                 expression(r[max])), las=1)
dev.off()


