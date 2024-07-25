cols <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# Plotting functions
plot_prev <- function(output, output_control) {
  plot(x = output$timestep, y = output$n_detect_730_3650 / output$n_730_3650, 
       type = "l", col = cols[3], lwd = 1,
       xlab = "Time (days)", ylab = expression(paste(italic(Pf),"PR"[2-10])),
       xaxs = "i", yaxs = "i", ylim = c(0, 1))
  lines(x = output_control$timestep, y = output_control$n_detect_730_3650 / output_control$n_730_3650,
        col = cols[5], lwd = 1)
  abline(v = bednetstimesteps, col = "black", lty = 2, lwd = 1)
  text(x = bednetstimesteps + 10, y = 0.95, labels = "Bed net int.", adj = 0, cex = 0.8)
  grid(lty = 2, col = "grey80", lwd = 0.5)
  legend("bottomleft", box.lty = 0, bg = "white",
         legend = c("Prevalence for bed net scenario","Prevalence for control scenario"),
         col = c(cols[3], cols[5]), lty = c(1,1), lwd = 2, cex = 0.8, y.intersp = 1.3)
}

# Function to plot simulation results
plot_simulations <- function(output = output, output_control = output_control, name = "") {
  pdf(name)
  plot_prev(output, output_control)
  dev.off()
}