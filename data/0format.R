library(tidyverse)
library(readxl)
library(janitor)
options(dplyr.width = Inf)

# Federal R&D Spending ------------------------------

fed_spend <- read_csv(here::here("data", "fed_spend_orig.csv"))

fed_spend_long <- fed_spend %>% 
    mutate(rd_budget_mil = rd_budget / 10^6) %>% 
    select(department, year, rd_budget_mil)

fed_spend_wide <- fed_spend_long %>% 
    spread(key = department, value = rd_budget_mil)

write_csv(fed_spend_long, here::here("data", "fed_spend_long.csv"))
write_csv(fed_spend_wide, here::here("data", "fed_spend_wide.csv"))

# Tuberculosis cases ------------------------------

tb_cases <- table1

write_csv(tb_cases, here::here("data", "tb_cases.csv"))

# PV cell production ------------------------------
pvCellPath <- here::here("data", "pv_cell_production.xlsx")
pv_cells <- read_excel(pvCellPath, sheet = 'Cell Prod by Country', skip = 2) %>%
  mutate(Year = as.numeric(Year)) %>% # Convert "non-years" to NA #<<
  filter(!is.na(Year)) # Drop NA rows in Year #<<
pv_cells_long <- pv_cells %>% 
    gather(key = "country", value = "numCells", China:Others) %>% 
    select(year = Year, country, numCells)

write_csv(pv_cells_long, here::here("data", "pv_cells_long.csv"))

# US COVID 19 cases and deaths ------------------------------------

us_covid_full <- read_csv(here::here("data", "us_covid_full.csv")) %>% 
  clean_names()
us_covid <- us_covid_full %>% 
  group_by(date, province_state) %>% 
  summarise(
    deaths = sum(deaths), 
    cases = sum(confirmed)) %>% 
  rename(state = province_state)

write_csv(us_covid, here::here("data", "us_covid.csv"))  
