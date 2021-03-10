library(knitr)
library(tidyverse)
library(cowplot)
library(readxl)
library(lubridate)
library(metathis)
library(janitor)
library(here)
library(countdown)

options(
    htmltools.dir.version = FALSE,
    knitr.table.format = "html",
    knitr.kable.NA = '',
    dplyr.width = Inf,
    width = 250
)
knitr::opts_chunk$set(
    cache   = FALSE,
    warning = FALSE,
    message = FALSE,
    fig.path = "figs/",
    fig.width = 7.252,
    fig.height = 4,
    comment = "#>",
    fig.retina = 3
)

# Setup xaringanExtra options 
xaringanExtra::use_xaringan_extra(c(
  "tile_view", "panelset", "clipboard", "share_again"))
xaringanExtra::style_share_again(share_buttons = "none")
xaringanExtra::use_extra_styles(
  hover_code_line = TRUE,
  mute_unhighlighted_code = FALSE
)

# Set up website metadata
meta() %>%
  meta_general(
    description = rmarkdown::metadata$subtitle,
    generator = "xaringan and remark.js"
  ) %>%
  meta_name("github-repo" = "emse-eda-gwu/2021-Spring") %>%
  meta_social(
    title = rmarkdown::metadata$title,
    url = "https://eda.seas.gwu.edu/2021-Spring/",
    og_type = "website",
    og_author = "John Paul Helveston",
    twitter_card_type = "summary_large_image",
    twitter_creator = "@johnhelveston"
  )

# Setup class-specific paths
class <- "9-cleaning-data"
root <- paste0("https://eda.seas.gwu.edu/2021-Spring/class/", class, "/")
path_slides <- file.path("class", class, "index.html")
path_pdf <- paste0(root, class, ".pdf")
path_notes <- paste0(root, class, ".zip")

# Read in data
wildlife_impacts <- read_csv(here::here('data', 'wildlife_impacts.csv'))
milk_production  <- read_csv(here::here('data', 'milk_production.csv'))
msleep           <- read_csv(here::here('data', 'msleep.csv'))
tb_rates         <- table3

# Add new variables
wildlife_impacts_orig <- wildlife_impacts
wildlife_impacts <- wildlife_impacts %>%
    mutate(
        weekday_name = wday(incident_date, label = TRUE),
        phase_of_flt = str_to_lower(phase_of_flt),
        phase_of_flt = case_when(
            phase_of_flt %in% c('approach', 'arrival', 'descent',
                                'landing roll') ~ 'arrival',
            phase_of_flt %in% c('climb', 'departure',
                                'take-off run') ~ 'departure',
            TRUE ~ 'other'))

# Abbreviations: https://www.50states.com/abbreviations.htm
state_abbs <- tibble::tribble(
                  ~state_name,              ~state_abb,
                     "Alabama",             "AL",
                      "Alaska",             "AK",
                     "Arizona",             "AZ",
                    "Arkansas",             "AR",
                  "California",             "CA",
                    "Colorado",             "CO",
                 "Connecticut",             "CT",
                    "Delaware",             "DE",
                     "Florida",             "FL",
                     "Georgia",             "GA",
                      "Hawaii",             "HI",
                       "Idaho",             "ID",
                    "Illinois",             "IL",
                     "Indiana",             "IN",
                        "Iowa",             "IA",
                      "Kansas",             "KS",
                    "Kentucky",             "KY",
                   "Louisiana",             "LA",
                       "Maine",             "ME",
                    "Maryland",             "MD",
               "Massachusetts",             "MA",
                    "Michigan",             "MI",
                   "Minnesota",             "MN",
                 "Mississippi",             "MS",
                    "Missouri",             "MO",
                     "Montana",             "MT",
                    "Nebraska",             "NE",
                      "Nevada",             "NV",
               "New Hampshire",             "NH",
                  "New Jersey",             "NJ",
                  "New Mexico",             "NM",
                    "New York",             "NY",
              "North Carolina",             "NC",
                "North Dakota",             "ND",
                        "Ohio",             "OH",
                    "Oklahoma",             "OK",
                      "Oregon",             "OR",
                "Pennsylvania",             "PA",
                "Rhode Island",             "RI",
              "South Carolina",             "SC",
                "South Dakota",             "SD",
                   "Tennessee",             "TN",
                       "Texas",             "TX",
                        "Utah",             "UT",
                     "Vermont",             "VT",
                    "Virginia",             "VA",
                  "Washington",             "WA",
               "West Virginia",             "WV",
                   "Wisconsin",             "WI",
                     "Wyoming",             "WY",
        "District of Columbia",             "DC",
            "Marshall Islands",             "MH",
         "Armed Forces Africa",             "AE",
       "Armed Forces Americas",             "AA",
         "Armed Forces Canada",             "AE",
         "Armed Forces Europe",             "AE",
    "Armed Forces Middle East",             "AE",
        "Armed Forces Pacific",             "AP"
)

bad_abbs <- c("MH", "AE", "AA", "AE", "AP")

state_abbs_50 <- state_abbs %>% 
  filter(!state_abb %in% bad_abbs)

# # scraping version:
# library(rvest)
# html <- read_html('https://www.50states.com/abbreviations.htm')
# table <- html %>%
#     html_node('#content') %>%
#     html_nodes("table") %>%
#     html_table(fill = T)
# table[[1]]
