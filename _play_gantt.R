install.packages("wesanderson")
remotes::install_github("giocomai/ganttrify")

source("resources/ganttrify.R")
library(readxl)
library(dplyr)
project <- read_xlsx("play/workplan.xlsx", sheet = "project")
spots <- read_xlsx("play/workplan.xlsx", sheet = "spots")

ganttrify(project)

ganttrify(ganttrify::test_project)
