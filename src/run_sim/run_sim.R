library(malariasimulation)

year <- 365
sim_length <- 6 * year
human_population <- 1000

## Define set of orderly_parameters
orderly2::orderly_parameters(eir = NULL,
local_cluster = NULL)

starting_EIR <- eir

simparams <- get_parameters(
  list(human_population = human_population)
)

simparams <- set_equilibrium(parameters = simparams, init_EIR = starting_EIR)

output_control <- run_simulation(timesteps = sim_length, parameters = simparams)

bednetstimesteps <- c(1, 4) * year # The bed nets will be distributed at the end of the first and the 4th year. 

bednetparams <- set_bednets(
  simparams,
  timesteps = bednetstimesteps,
  coverages = c(.5, .5),  # Each round is distributed to 50% of the population.
  retention = 5 * year, # Nets are kept on average 5 years
  dn0 = matrix(c(.533, .533), nrow = 2, ncol = 1), # Matrix of death probabilities for each mosquito species over time
  rn = matrix(c(.56, .56), nrow = 2, ncol = 1), # Matrix of repelling probabilities for each mosquito species over time
  rnm = matrix(c(.24, .24), nrow = 2, ncol = 1), # Matrix of minimum repelling probabilities for each mosquito species over time
  gamman = rep(2.64 * 365, 2) # Vector of bed net half-lives for each distribution timestep
)

output <- run_simulation(timesteps = sim_length, parameters = bednetparams)

saveRDS(output_control, "output_control.RDS")
saveRDS(output, "output.RDS")
