library(knitr)
library(cowplot)
library(tidyverse)
library(viridis)
library(gganimate)
library(ggrepel)
library(here)
library(countdown)
library(metathis)

options(
    htmltools.dir.version = FALSE,
    knitr.table.format = "html",
    knitr.kable.NA = '',
    dplyr.width = Inf,
    width = 250
)

knitr::opts_chunk$set(
    cache = FALSE,
    warning = FALSE,
    message = FALSE,
    fig.path = "figs/",
    fig.width = 7.252,
    fig.height = 4,
    comment = "#>",
    fig.retina = 3
)

xaringanExtra::use_tile_view()
xaringanExtra::use_panelset()
xaringanExtra::use_clipboard()
xaringanExtra::use_share_again()
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
class <- "8-trends"
root <- paste0("https://eda.seas.gwu.edu/2021-Spring/class/", class, "/")
path_slides <- file.path("class", class, "index.html")
path_pdf <- paste0(root, class, ".pdf")
path_notes <- paste0(root, class, ".zip")

# Set main plot theme
theme_set(theme_cowplot(font_size = 20))

# Read in data
gapminder        <- read_csv(here::here('data', 'gapminder.csv'))
milk_production  <- read_csv(here::here('data', 'milk_production.csv'))
global_temps     <- read_csv(here::here('data', 'nasa_global_temps.csv'))
hotdogs          <- read_csv(here::here('data', 'hot_dog_winners.csv'))
internet_country <- read_csv(here::here('data', 'internet_users_country.csv'))
internet_region  <- read_csv(here::here('data', 'internet_users_region.csv'))
us_diseases      <- read_csv(here::here('data', 'us_contagious_diseases.csv'))
us_covid         <- read_csv(here::here('data', 'us_covid.csv'))

# Modify data
milk_production <- milk_production %>%
    mutate(
        milk_produced = milk_produced / 10^9,
        state = fct_reorder(state, milk_produced))

gapminder <- gapminder %>%
    mutate(year = as.integer(year))

# Make data subsets
milk_ca <- milk_production %>%
    filter(state == 'California')

milk_ca_sparse <- milk_ca %>%
    mutate(yearColor = ifelse(year %in% seq(1970, 2020, 10), 'one', 'two'))

milk_region <- milk_production %>%
    filter(region %in% c(
        'Pacific', 'Northeast', 'Lake States', 'Mountain')) %>%
    group_by(year, region) %>%
    summarise(milk_produced = sum(milk_produced)) %>%
    ungroup() %>%
    mutate(label = ifelse(year == max(year), region, NA))

milk_race <- milk_production %>%
    group_by(year) %>%
    mutate(
        rank = rank(-milk_produced),
        Value_rel = milk_produced / milk_produced[rank==1],
        Value_lbl = paste0(' ', round(milk_produced))) %>%
    group_by(state) %>%
    filter(rank <= 10) %>%
    ungroup() %>%
    mutate(year = as.integer(year))

hotdogs_mens <- hotdogs %>%
    filter(Competition == 'Mens') %>%
    rename(dogs = `Dogs eaten`,
           record = `New record`) %>%
    mutate(
        record = if_else(record == 1, 'Yes', 'No'),
        Winner = fct_other(Winner,
            keep = c('Joey Chestnut', 'Takeru Kobayashi')))

internet_country_summary <- internet_country %>%
    filter(country %in% c(
        'United States', 'China',
        'Singapore', 'Cuba')) %>%
    mutate(
        label = ifelse(year == max(year), country, NA))

internet_region_summary <- internet_region %>%
    mutate(
        numUsers = numUsers / 10^9,
        label    = ifelse(year == max(year), region, NA))

measles <- us_diseases %>%
  filter(
    disease == 'Measles',
    !state %in% c("Hawaii", "Alaska")) %>%
  mutate(
    rate = (count / population) * 10000,
    state = fct_reorder(state, rate)) %>%
  # Compute annual mean rate across all states
  group_by(year) %>% #<<
  mutate( #<<
    mean_rate = sum(count) / sum(population) * 10000) #<<

measles_ca <- measles %>%
    filter(state == "California")

measles_us <- measles %>%
    group_by(year) %>%
    summarize(rate = sum(count) / sum(population) * 10000)
