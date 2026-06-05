## Fixed step Runge-Kutta solver
rk4 <- function(y, times, func, parms) {
  out <- matrix(NA, nrow = length(times), ncol = length(y) + 1)
  out[1, ] <- c(times[1], y)
  colnames(out) <- c("time", names(y))
  current_y <- y
  for (i in 1:(length(times) - 1)) {
    t_curr <- times[i]
    t_next <- times[i + 1]
    h <- t_next - t_curr
    k1 <- unlist(func(t_curr,          current_y,              parms))
    k2 <- unlist(func(t_curr + h / 2,  current_y + h * k1 / 2, parms))
    k3 <- unlist(func(t_curr + h / 2,  current_y + h * k2 / 2, parms))
    k4 <- unlist(func(t_next,          current_y + h * k3,     parms))
    current_y <- current_y + (h / 6) * (k1 + 2 * k2 + 2 * k3 + k4)
    out[i + 1, ] <- c(t_next, current_y)
  }
  return(as.data.frame(out))
}

## Variable time step ode45 Solver
ode45 <- function(y, times, func, parms, rtol = 1e-6, atol = 1e-6) {
  # Dormand-Prince (RK45) Coefficients
  c_val <- c(0, 1/5, 3/10, 4/5, 8/9, 1, 1)
  a <- list(
    c(),
    c(1/5),
    c(3/40, 9/40),
    c(44/45, -56/15, 32/9),
    c(19372/6561, -25360/2187, 64448/6561, -212/729),
    c(9017/3168, -355/33, 46732/5247, 49/176, -5103/18656),
    c(35/384, 0, 500/1113, 125/192, -2187/6784, 11/84)
  )
  # Coefficients for order 5 (b1) and order 4 4 (b2) for error estimation
  b1 <- c(35/384, 0, 500/1113, 125/192, -2187/6784, 11/84, 0)
  b2 <- c(5179/57600, 0, 7571/16695, 393/640, -92097/339200, 187/2100, 1/40)
  
  out <- matrix(NA, nrow = length(times), ncol = length(y) + 1)
  colnames(out) <- c("time", names(y))
  out[1, ] <- c(times[1], y)
  
  current_y <- y
  t_curr <- times[1]
  h <- min(diff(times)) # initial step size
  
  for (i in 2:length(times)) {
    t_target <- times[i]
    
    # Loop over the external time steps
    while (t_curr < t_target) {
      if (t_curr + h > t_target) h <- t_target - t_curr
      
      # calculate levels (k1 ... k7)
      k <- matrix(NA, nrow = 7, ncol = length(y))
      k[1, ] <- unlist(func(t_curr, current_y, parms))
      
      for (s in 2:7) {
        y_step <- current_y + h * colSums(a[[s]] * k[1:(s-1), , drop = FALSE])
        k[s, ] <- unlist(func(t_curr + c_val[s] * h, y_step, parms))
      }
      
      # estimate error between orders 4 and 5
      y5 <- current_y + h * colSums(b1 * k)
      y4 <- current_y + h * colSums(b2 * k)
      error_est <- max(abs(y5 - y4) / (atol + rtol * abs(y5)))
      
      if (error_est <= 1.0 || h < 1e-5) {
        # accepted step
        current_y <- y5
        t_curr <- t_curr + h
        # optimize step for the future
        h <- h * min(5, max(0.2, 0.9 * (1 / error_est)^0.2))
      } else {
        # reject step; decrease and try again
        h <- h * max(0.1, 0.9 * (1 / error_est)^0.25)
      }
    }
    out[i, ] <- c(t_target, current_y)
  }
  return(as.data.frame(out))
}

