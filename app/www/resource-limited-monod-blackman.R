library(deSolve)

resource <- function (time, y, parms) {
  with(as.list(c(y, parms)), {
    if (monod) {
      f <- P/(kP + P)     # Monod
    } else {
      f <- min(kb * P, 1) # Blackman
    }
    dA_dt <- r * f * A
    dP_dt <- - r * 1/Y * f * A
    list(c(dA_dt, dP_dt))
  })
}

y0 <- c(
  A = 10,    # algae,      mol/m3 carbon
  P   =  5   # phosphorus, mol/m3 P
) # in mg/L
parms <- c(r = 0.1, kP = 0.5, Y = 106, monod = FALSE, kb = 0.1) # Y = C:P - Redfield ratio
times <- seq(0, 200, by=1)


parms  <- parms
y0 <- y0
res <- ode(y0, times, resource, parms, method = "adams")

plot(res)

