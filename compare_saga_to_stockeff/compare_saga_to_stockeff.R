# This script compares the indices from the SAGA shiny app to
# the same indices in StockEff for GOM haddock.
# Initial comparison is without the measured-swept-area adjustment.
library(dplyr)
library(tidyr)
library(ggplot2)

# Load GOM haddock StockEff stratified mean indices (numbers and biomass)
stockeff_indices <- 
  read.csv("./compare_saga_to_stockeff/ADIOS_SV_164744_GOM_NONE_strat_mean.csv") %>%
  select(YEAR, SEASON, INDEX_TYPE, INDEX, LOWER_90_CI, UPPER_90_CI) %>%
  mutate(source = "StockEff")

saga_indices_SPRING <- 
  read.csv("./compare_saga_to_stockeff/HADDOCK_SPRING_2_96_.csv", skip = 1, nrows = 52) %>%
  select(Year, Num, VarNum) %>%
  mutate(INDEX_TYPE = "Abundance (numbers/tow)") %>%
  rename(YEAR = Year, INDEX = Num, Var = VarNum) %>%
  rbind({read.csv("./compare_saga_to_stockeff/HADDOCK_SPRING_2_96_.csv", skip = 1, nrows = 52) %>%
         select(Year, Wt, VarWt) %>%
         mutate(INDEX_TYPE = "Biomass (kg/tow)") %>%
         rename(YEAR = Year, INDEX = Wt, Var = VarWt)}) %>%
  mutate(`LOWER_90_CI` = INDEX - 1.645*Var,
         `UPPER_90_CI` = INDEX + 1.645*Var,
         SEASON = "SPRING") %>%
  select(YEAR, SEASON, INDEX_TYPE, INDEX, LOWER_90_CI, UPPER_90_CI) %>%
  mutate(source = "SAGA Shiny App")

saga_indices_FALL <- 
  read.csv("./compare_saga_to_stockeff/HADDOCK_FALL_2_96_.csv", skip = 1, nrows = 52) %>%
  select(Year, Num, VarNum) %>%
  mutate(INDEX_TYPE = "Abundance (numbers/tow)") %>%
  rename(YEAR = Year, INDEX = Num, Var = VarNum) %>%
  rbind({read.csv("./compare_saga_to_stockeff/HADDOCK_FALL_2_96_.csv", skip = 1, nrows = 52) %>%
      select(Year, Wt, VarWt) %>%
      mutate(INDEX_TYPE = "Biomass (kg/tow)") %>%
      rename(YEAR = Year, INDEX = Wt, Var = VarWt)}) %>%
  mutate(LOWER_90_CI = INDEX - 1.645*Var,
         UPPER_90_CI = INDEX + 1.645*Var,
         SEASON = "FALL") %>%
  select(YEAR, SEASON, INDEX_TYPE, INDEX, LOWER_90_CI, UPPER_90_CI) %>%
  mutate(source = "SAGA Shiny App")
  
         
both_indices <- rbind(stockeff_indices, saga_indices_SPRING, saga_indices_FALL)

# Plot both indices together
ggplot(both_indices, aes(x = YEAR, y = INDEX, color = source)) +
  geom_line() +
  geom_point() +
  facet_grid(SEASON ~ INDEX_TYPE) +
  theme_bw() +
  ylab("") +
  xlab("")

# Plot percent differences in indices
pc_diff <-
  both_indices %>%
  select(-LOWER_90_CI, -UPPER_90_CI) %>%
  spread(source, INDEX) %>%
  mutate(`Percent difference` = 100 * (`SAGA Shiny App` - StockEff)/StockEff)

ggplot(pc_diff, aes(x = YEAR, y = `Percent difference`)) +
  geom_line() +
  geom_point() +
  facet_grid(SEASON ~ INDEX_TYPE) +
  theme_bw()



