## load packages
pacman::p_load(dplyr, tidyr, writexl, readxl)


## clean survey data by years and standardise variables

## 2008

## set wd
setwd("C:/Users/vl22683/OneDrive - University of Bristol/Documents/PhD Papers/Paper 3a - Ukraine Sex Work HIV/data/SW data")

## load data
sw_data_2008_raw <- read_excel("2008_IBBS_FSW_TLS AND RDS_Data.xlsx")
View(sw_data_2008_raw)

## save data
write_xlsx(sw_data_2008_clean, "sw_data_2008_clean.xlsx")

## append survey data

## prepare longitudinal data 

# load data
sw_data_linkage <- read_excel("SW IBBS linkage.xlsx")
sw_data_2013_clean <- read_excel("sw_data_2013_clean.xlsx")
sw_data_2015_clean <- read_excel("sw_data_2015_clean.xlsx")
sw_data_2017_clean <- read_excel("sw_data_2017_clean.xlsx")
sw_data_2021_clean <- read_excel("sw_data_2021_clean.xlsx")

# Create a list of data frames and their corresponding IDs
data_frames <- list(
  "2013_id" = sw_data_2013_clean,
  "2015_id" = sw_data_2015_clean,
  "2017_id" = sw_data_2017_clean,
  "2021_id" = sw_data_2021_clean
)

# Initialize an empty list to store the linked data frames
linked_data <- list()

# Loop through the data frames
for (id_col in names(data_frames)) {
  linked_data[[id_col]] <- sw_data_linkage %>%
    select(id, !!sym(id_col)) %>%
    left_join(data_frames[[id_col]], by = id_col)
}

# Only keep rows where the ID is not NA
linked_data <- lapply(linked_data, function(df) {
  df %>% filter(!is.na(id))
})