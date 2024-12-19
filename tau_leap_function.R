# Tau leap function to simulate within-host events

# Create the function with our equations
tau_leap <- function(t, tau, 
                     V_vec, Z_vec, 
                     params) {
  
  # How many events?
  n_events <- 5
  event_prob <- vector(mode = "numeric", length = n_events)
  
  
  # Event equations (Viral Density): 
  # Viral Replication
  event_prob[1] <- params$phi * V_vec[t]
  
  # Immune Response
  event_prob[2] <- params$alpha * V_vec[t] * (Z_vec[t]/params$z_scalar)  
  
  
  # Event equations (Immune Density)
  # Immune Baseline 1 -
  event_prob[3] <- (params$N_z * params$z_scalar)
  
  # Immune Baseline 2 -
  event_prob[4] <- params$delta * Z_vec[t]
  
  # Pathogen Response
  event_prob[5] <- params$psi * Z_vec[t] * (V_vec[t] / (V_vec[t] + params$gamma)) 
  
  # How many events of each type will occur over time period tau
  n_occur <- vector(mode = "numeric", length = n_events)
  
  # Variability with Poisson random variate
  for (i in 1:n_events) {
    n_occur[i] <- rpois(1, event_prob[i] * tau)
  }
  
  return(n_occur)
  
}
