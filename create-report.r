library(dplyr)
library(docstring)

source("src/data_ingestion/import_data.r")
source("src/data_processing/aggregations.r")

download_file_if_not_exists(
  "https://files.digital.nhs.uk/assets/Services/Artificial%20data/Artificial%20HES%20final/artificial_hes_ae_202302_v1_sample.zip", 
  "./data_in/artificial_hes_ae_202302_v1_sample.zip"
)

unzip(
  "./data_in/artificial_hes_ae_202302_v1_sample.zip",
  exdir="./data_in/"
)

df_hes <- read.csv(
  "./data_in/artificial_hes_ae_202302_v1_sample/artificial_hes_ae_2122.csv"
)

df_hes_england_episode_count = get_distinct_count_of_col(df_hes, "EPIKEY")

write.csv(
  df_hes_england_episode_count,
  file = "./data_out/hes_england_episode_count.csv",
  row.names = FALSE,
  quote = FALSE
)