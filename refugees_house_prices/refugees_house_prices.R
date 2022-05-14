## refugees_house_prices.R
## Play around with refugee resettlement data to explore effect of housing prices on refugee
## locations and outcomes.
## Requires: orr_prm_1975_2018_v1.dta
## Last edited 5/14/22 by Tal Roded
###################################################################################################
library(tidyverse)
library(haven)
library(usmap)

setwd("C:/Users/trode/OneDrive/Desktop/immigration-research/refugees_house_prices/")

## refugee resettlement geocoded data
data <- read_dta('data/orr_prm_1975_2018_v1.dta')

# heat map of refugees by location
locations <- data %>%
  group_by(fips) %>%
  summarize(count=sum(refugees)) %>% 
  mutate(logcount=log(count)) %>%
  subset(nchar(fips) == 5)

hist(locations$logcount[locations$logcount>0])

plot_usmap(regions = "counties", data = locations, values = "logcount") +
  scale_fill_distiller(palette = "Reds", direction = 1, na.value="white") + 
  labs(title = "Locations of Refugees, 1975-2018", subtitle = "Among those who arrived to the US in 2006-2019") + 
  theme_classic() + theme(axis.line = element_blank()) + 
  theme(axis.title = element_blank()) + theme(axis.ticks = element_blank()) + theme(axis.text = element_blank()) + 
  theme(plot.title = element_text(face = "bold", size = 22, hjust = 0.5)) + 
  theme(legend.position="none") + theme(plot.subtitle = element_text(hjust = 0.5, size = 12, face = "italic")) + 
  theme(panel.border = element_rect(color="black", fill=NA, size=1, linetype="solid"))

p <- ggsave("charts/locations_counties_log_all.png", plot = p, 
            width = 24, height = 16, units = "cm")
