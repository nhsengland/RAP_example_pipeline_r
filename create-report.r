library(dplyr)

if (!file.exists(destination)) {
    download.file(
        "https://s3.eu-west-2.amazonaws.com/files.digital.nhs.uk/assets/Services/Artificial+data/Artificial+HES+final/", 
        "./"
    )
} else {
    print( "file already exists" )
}

unzip(
    "./artificial_hes_ae_202302_v1_sample.zip"
)

df_hes <- read.csv(
    "./artificial_hes_ae_202302_v1_sample.zip"
)

df_hes_england_episode_count <- df_hes %>% summarise({{"EPIKEY"}} := n_distinct(df_input[["EPIKEY"]]))

write.csv(
    df_hes_england_episode_count,
    file = "./hes_england_episode_count.csv", sep = ""),
    row.names = FALSE,
    quote = FALSE
)