library(ggplot2)

source("resources.R")

orderly2::orderly_dependency("run_sim", "latest()", 
                              c("output.RDS" = "output.RDS",
                              "output_control.RDS" = "output_control.RDS"))

output <- readRDS("output.RDS")
output_control <- readRDS("output_control.RDS")

plot_simulations(output, output_control, "PrPf2-10.pdf")