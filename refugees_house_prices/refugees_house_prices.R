## refugees_house_prices.R
## Play around with refugee resettlement data to explore effect of housing prices on refugee
## locations and outcomes.
## Requires: orr_prm_1975_2018_v1.dta
## Last edited 5/14/22 by Tal Roded
###################################################################################################
library(tidyverse)
library(haven)

setwd("C:/Users/trode/OneDrive/Desktop/immigration-research/refugees_house_prices/")

## refugee resettlement geocoded data
data <- read_dta('data/orr_prm_1975_2018_v1.dta')

# heat map of refugees by location