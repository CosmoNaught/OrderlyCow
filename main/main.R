orderly2::orderly_run("run_param_gen")
orderly2::orderly_run("run_sim", list(eir = 50, local_cluster = TRUE))
orderly2::orderly_run("run_plots")
