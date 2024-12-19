# Simulation of the within host system

# Simulation function 
model_simulation <- function(V_vec, Z_vec, params, z_scalar, 
                             death_threshold, clearance_threshold){
  # Time
  tau <- 1
  t_max <- 40
  n_times <- floor(t_max/tau)
  t_vec <- seq(1, t_max, length.out = n_times)
  
  # Start the clock
  t <- 1
  
  while(t <= (n_times - 1)){
    
    # Move forward one time step
    n_occur <- tau_leap(t, tau, V_vec, Z_vec, params)
    
    # Update the variables
    V_vec[(t + 1)] <- V_vec[t] + n_occur[1] - n_occur[2]
    Z_vec[(t + 1)] <- Z_vec[t] + (n_occur[3] - n_occur[4]) + n_occur[5]
    
    # Check if V_vec exceeds the threshold where the host dies
    if (!is.na(V_vec[(t + 1)]) && V_vec[(t + 1)] >= death_threshold) {
      # Set V_vec and Z_vec to NA for remaining time steps
      V_vec[(t+1):length(V_vec)] <- death_threshold
      Z_vec[(t+1):length(Z_vec)] <- NA
    }
    
    # Check if V_vec is not missing and drops below a small threshold, indicating clearance of the virus
    if (!is.na(V_vec[(t + 1)]) && V_vec[(t + 1)] < clearance_threshold) {
      # Set V_vec to NA for remaining time steps 
      V_vec[(t + 1):length(V_vec)] <- 0
    }
    
    
    # Advance time
    t <- t + 1
  }
  
  # Return the list of the results
  return(list(V_vec = V_vec, Z_vec = Z_vec))
}

