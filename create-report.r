library(dplyr)

download.file(
  "https://s3.eu-west-2.amazonaws.com/files.digital.nhs.uk/assets/Services/Artificial+data/Artificial+HES+final/artificial_hes_ae_202302_v1_sample.zip", 
  "./artificial_hes_ae_202302_v1_sample.zip"
)


unzip(
  "./artificial_hes_ae_202302_v1_sample.zip"
)

df_hes <- read.csv(
  "./artificial_hes_ae_202302_v1_sample/artificial_hes_ae_2122.csv"
)


df_hes_england_episode_count <- df_hes %>% summarise(
  "EPIKEY" := n_distinct(df_hes[["EPIKEY"]])
)

write.csv(
  df_hes_england_episode_count,
  file = "./hes_england_episode_count.csv",
  row.names = FALSE,
  quote = FALSE
)