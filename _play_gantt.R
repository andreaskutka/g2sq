install.packages("wesanderson")
remotes::install_github("giocomai/ganttrify")

source("play/ganttrify.R")
library(readxl)
library(dplyr)
project <- read_xlsx("play/workplan.xlsx", sheet = "project")
spots <- read_xlsx("play/workplan.xlsx", sheet = "spots")

ganttrify(project,
          hide_wp = TRUE)
ganttrify(ganttrify::test_project)



df <- project %>%
  dplyr::mutate(start_date = as.numeric(start_date),
                end_date = as.numeric(end_date))

project_start_date<-Sys.Date()
start_yearmon <- zoo::as.yearmon(project_start_date)-(1/12)

df_yearmon <- df %>%
  dplyr::mutate(start_date_yearmon = start_yearmon+(1/12)*start_date,
                end_date_yearmon = start_yearmon+(1/12)*zoo::as.yearmon(end_date)) %>%
  dplyr::transmute(wp = as.character(wp),
                   activity = as.character(activity),
                   start_date = zoo::as.Date(start_date_yearmon, frac = 0),
                   end_date = zoo::as.Date(end_date_yearmon, frac = 1))

sequence_months <- seq.Date(from = min(df_yearmon[["start_date"]]),
                            to = max(df_yearmon[["end_date"]]),
                            by = "1 month")

date_range_matrix <- matrix(as.numeric(sequence_months),
                            ncol = 2,
                            byrow = TRUE)


df_levels <- rev(df_yearmon %>%
                   dplyr::select(wp, activity) %>%
                   t() %>%
                   as.character() %>%
                   unique())
