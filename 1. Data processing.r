## load packages
pacman::p_load(dplyr, tidyr, writexl, readxl)

## set wd
setwd("C:/Users/vl22683/OneDrive - University of Bristol/Documents/PhD Papers/Paper 3a - Ukraine Sex Work HIV/data/SW data")

## load data
sw_data_2008_raw <- read_excel("2008_IBBS_FSW_TLS AND RDS_Data.xlsx")
View(sw_data_2008_raw)

## save data
write_xlsx(sw_data_2008_clean, "sw_data_2008_clean.xlsx")

