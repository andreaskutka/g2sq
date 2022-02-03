

library(kableExtra)
library(readxl)

schedule <- read_xlsx("resources/training_schedule.xlsx")

schedule %>%
  kbl(align = "cll") %>%
  kable_styling() %>%
  column_spec(1, bold = T)
