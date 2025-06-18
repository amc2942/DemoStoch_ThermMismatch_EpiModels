This repository contains the code used for the manuscript: 
# Stochastic within-host dynamics and climate-sensitive traits generate predictable patterns of variation in disease outcomes

#### By: Andrew Carlino, Malina M. Loeher, David J. Páez,  Paul K. Hershberger, Nathan Wolf, Joseph Mihaljevic


This project explores a novel, model-based hypothesis. Here, we use a within-host epidemiological model that incorporates demographic stochasticity and trait thermal mismatches between a host and a pathogen to improve predictions of disease outcomes in the face of climate-driven temperature changes. We found that the use of this modeling structure can generate predicatble patterns of inter-individual variation in disease outcomes for hosts organisms sensitive to climate change, providing a robust theoretical framework for understanding how climate-driven temperature shifts can influence epizootic outbreak dynamics and host susceptibility. 

#### Technical Details

All modeling and code were developed and executed using R and RStudio, and produced in a Quarto document. The following packages should be installed:

 - tidyverse (including tidyr, ggplot2, and dplyr)
 - stats
 - reshape2
 - grid
 - gridExtra
 - viridis

#### Repository Contents:

- 2 .qmd (Quarto) documents:
  - DemoStoch_ThermMismatch_Modeling.qmd for main text and figures
  - Supplemental_Analysis_WithinhostModeling.qmd for supplementary analysis and figures.

- 2 .r script helper functions:
  - tau_leap_function.r
  - model_simulation_function.r 

- 1 Folder ("Figures") containing the .pdf files used to generate figures in both the main text and supplement


#### Usage and Reproducibility

R and RStudio should be installed on a user's system.

In order to run the .qmd files, the open-source publishing system 'Quarto' must be downloaded (https://quarto.org/). The two .qmd files could be rendered to a .pdf or an .HTML document. In addition, ensure all necessary packages are installed to a user's system prior to running the code.

The two .r script files contain the two helper functions used to run the tau-leap event-based algorithm and the model simulation function. These two helper functions must be downloaded and sourced from a user's set working directory to then run either of the .qmd files. 

This code and repository is being submitted to Philosophical Transactions of the Royal Soceity B, and as such, upon acceptance and publication, will ultimately be moved and archived in a Dryad repository. 

### Contact
For any questions or further information regarding this project, please contact: 

Andrew Carlino - amc2942@nau.edu
