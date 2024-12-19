# Estimating the Effect of Temperature on Certain Parameters:

library(ggplot2)
library(gridExtra)

# Thermal Performance Curve using a Quadratic function: 
# param = (-q * [temperature - t_min][temperature - t_max])

# Generate temperatures

temperatures <- seq(2, 20, length.out = 50)

################################################################################
# Estimating the Range of Parameter Phi (Viral Replication Rate)
################################################################################

estimate_phi <- function(temperature, q_phi, tmin_phi, tmax_phi) {
  # Quadratic equation
  phi <- pmax(-q_phi * (temperature - tmin_phi) * (temperature - tmax_phi), 0) 
  return(phi)
}

# Set q for phi
q_phi <- 0.0115
# Set temperature range
tmin_phi <- 1
tmax_phi <- 28.4

# Calculate corresponding values of phi
phi_values <- estimate_phi(temperatures, q_phi, tmin_phi, tmax_phi)

# Peak value of the phi Parameter
temp_peak_phi <- (tmin_phi + tmax_phi) / 2
peak_phi <- estimate_phi(temp_peak_phi, q_phi, tmin_phi, tmax_phi)


################################################################################
# Estimating the Range of Parameter Alpha (Mass-action Attack Rate)
################################################################################

estimate_alpha <- function(temperature, q_alpha, tmin_alpha, tmax_alpha){
  # Quadratic Equation
  alpha <- pmax(-q_alpha * (temperature - tmin_alpha) * (temperature - tmax_alpha), 0)
  return(alpha)
}

# Set q value for alpha 
q_alpha <- 0.01
# Set temperature range
tmin_alpha <- -5
tmax_alpha <- 23.6

# Calculate corresponding values of alpha
alpha_values <- estimate_alpha(temperatures, q_alpha, tmin_alpha, tmax_alpha)

# Peak value of the alpha Parameter
temp_peak_alpha <- (tmin_alpha + tmax_alpha) / 2
peak_alpha <- estimate_alpha(temp_peak_alpha, q_alpha, tmin_alpha, tmax_alpha)

 
################################################################################
# Estimating the Range of Parameter Psi (Immune Growth Rate in Response to Virus)
################################################################################

estimate_psi <- function(temperature, q_psi, tmin_psi, tmax_psi){
  # Quadratic Equation
  psi <- pmax(-q_psi * (temperature - tmin_psi) * (temperature - tmax_psi), 0)
  return(psi)
}

# Set q value for psi 
q_psi <- 0.0041
# Set temperature range
tmin_psi <- 1
tmax_psi <- 28

# Calculate corresponding values of alpha
psi_values <- estimate_psi(temperatures, q_psi, tmin_psi, tmax_psi)

# Peak value of the alpha Parameter
temp_peak_psi <- (tmin_psi + tmax_psi) / 2
peak_psi <- estimate_psi(temp_peak_psi, q_psi, tmin_psi, tmax_psi)


################################################################################
# Plotting Parameter range over Temperature
################################################################################


plot_data <- data.frame(Temperature = temperatures,
                        Phi = phi_values, 
                        Alpha = alpha_values)
                        #Psi = psi_values)

# Plot Phi Values
phi_plot <- ggplot(plot_data, aes(x = Temperature, y = Phi)) +
  geom_line(color = "red") + 
  labs(x = "Temperature (C)", y = "Phi (Viral Replication Rate) Values") + 
  geom_vline(xintercept = temp_peak_phi, color = "red", linetype = "dashed") + 
  #geom_hline(yintercept = 2.2, color = "red", linetype = "dashed") + 
  #geom_hline(yintercept = 2.55, color = "red", linetype = "dashed") +
  theme_bw() +
  ggtitle("Temperature vs. Parameter Values") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(size = 20)) + 
  theme(axis.text = element_text(size = 15)) + 
  theme(axis.title = element_text(size = 15))

# Plot Alpha Values
alpha_plot <- ggplot(plot_data, aes(x = Temperature, y = Alpha)) +
  geom_line(color = "blue") + 
  labs(x = "Temperature (C)", y = "Alpha (Host Attack Rate) Values") + 
  geom_vline(xintercept = temp_peak_alpha, color = "blue", linetype = "dashed") + 
  #geom_hline(yintercept = 1.75, color = "blue", linetype = "dashed") + 
  #geom_hline(yintercept = 2.0, color = "blue", linetype = "dashed") + 
  theme_bw() + 
  theme(axis.text = element_text(size = 15)) + 
  theme(axis.title = element_text(size = 15))

# Plot Psi Values
#psi_plot <- ggplot(plot_data, aes(x = Temperature, y = Psi)) + 
#  geom_line(color = "green") + 
#  labs(x = "Temperature (C)", y = "Psi (Immune Response to Virus) Values") + 
#  geom_vline(xintercept = temp_peak_psi, color = "green", linetype = "dashed") +
  #geom_hline(yintercept = 0.9, color = "green", linetype = "dashed") + 
  #geom_hline(yintercept = 1.25, color = "green", linetype = "dashed") + 
#  theme_bw() + 
#  theme(axis.text = element_text(size = 15)) + 
#  theme(axis.title = element_text(size = 15))


# combined_plots <- grid.arrange(phi_plot, alpha_plot, ncol = 1)


#ggsave("phi_alpha_plots.png", 
#       combined_plots, 
#       width = 10, height = 14, dpi = 300)
