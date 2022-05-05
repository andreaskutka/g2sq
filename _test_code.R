

library(kableExtra)
library(readxl)

schedule <- read_xlsx("resources/training_schedule.xlsx", col_types = c("numeric","text","text","text"))

schedule %>%
  kbl(align = "cll") %>%
  kable_styling() %>%
  column_spec(1, bold = T)

days <- rle(schedule$Day)$lengths
names(days) <- paste("Day",rle(schedule$Day)$values)
days

schedule[,2:4] %>%
  kbl() %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) %>%
  pack_rows(index = days, label_row_css = "background-color: #666; color: #fff;")





acronyms <- read_xlsx("resources/acronyms.xlsx")

acronyms %>%
  kbl(col.names = NULL) %>%
  kable_styling() %>%
  column_spec(1, bold = T)

acronyms %>%
  kable_minimal(acronyms,  lightable_options = "basic")


quality <- as.data.frame(matrix(c(
     "Accuracy", "Total survey error is minimized ",
     "Credibility", 	"Data are considered trustworthy by the survey community",
     "Comparability",	"Demographic, spatial, and temporal comparisons are valid",
     "Usability/Interpretability", "Documentation is clear and metadata are well-managed",
     "Relevance", "Data satisfy users needs",
     "Accessibility",	"Access to the data is user friendly",
     "Timeliness/Punctuality", "Data deliveries adhere to schedules",
     "Completeness", "Data are rich enough to satisfy the analysis objectives without undue burden on respondents",
     "Coherence",	"Estimates from different sources can be reliably combined"),
     ncol = 2,
     byrow = T))
colnames(quality) <- c("Dimension", "Description")
