library(dplyr)
library(docstring)

source("src/data_ingestion/import_data.r")
source("src/data_processing/aggregations.r")

config <- config::get()

download_file_if_not_exists(
  paste(config$hes_data_url, config$hes_data_file_name, sep=""), 
  paste(config$download_destination, config$hes_data_file_name, sep="")
)

unzip(
  paste(config$download_destination, config$hes_data_file_name, sep=""),
  config$download_destination
)

df_hes <- read.csv(
  paste(config$download_destination, config$downloaded_hes_folder, config$downloaded_hes_file, sep="")
)

df_hes_england_episode_count = get_distinct_count_of_col(df_hes, "EPIKEY")

write.csv(
  df_hes_england_episode_count,
  file = paste(config$output_path, "hes_england_episode_count.csv"),
  row.names = FALSE,
  quote = FALSE
)
