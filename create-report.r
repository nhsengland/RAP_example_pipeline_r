library(dplyr)

get_distinct_count_of_col <- function(df_input, col_name) {

  df_output <- df_hes %>% summarise(
    {{col_name}} := n_distinct(df_input[[col_name]])
  )

  return(df_output)

}

download_file_if_not_exists <- function(url, destination) {

  if (!file.exists(destination)) {
    download.file(
      url, 
      destination
    )    
  } else {
    print("File already exists.")
  }

}

download_file_if_not_exists(
  "https://s3.eu-west-2.amazonaws.com/files.digital.nhs.uk/assets/Services/Artificial+data/Artificial+HES+final/artificial_hes_ae_202302_v1_sample.zip", 
  "./artificial_hes_ae_202302_v1_sample.zip"
)

unzip(
  "./artificial_hes_ae_202302_v1_sample.zip"
)

df_hes <- read.csv(
  "./artificial_hes_ae_202302_v1_sample/artificial_hes_ae_2122.csv"
)

df_hes_england_episode_count = get_distinct_count_of_col(df_hes, "EPIKEY")

write.csv(
  df_hes_england_episode_count,
  file = "./hes_england_episode_count.csv",
  row.names = FALSE,
  quote = FALSE
)