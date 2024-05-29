library(dplyr)
library(docstring)
library(config)

source("src/data_ingestion/import_data.r")
source("src/data_processing/aggregations.r")

config <- config::get()

download_file_if_not_exists(
  paste0(config$hes_data_url, config$hes_data_file_name), 
  paste0(config$download_destination, config$hes_data_file_name)
)

unzip(
  paste0(config$download_destination, config$hes_data_file_name),
  exdir = config$download_destination
)

df_hes <- read.csv(
  paste0(config$downloaded_hes_folder, config$downloaded_hes_file)
)

df_hes_england_episode_count = get_distinct_count_of_col(df_hes, "EPIKEY")

write.csv(
  df_hes_england_episode_count,
  file = paste(config$output_path, "hes_england_episode_count.csv"),
  row.names = FALSE,
  quote = FALSE
)
