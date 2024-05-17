library(dplyr)

get_distinct_count_of_col <- function(df_input, col_name) {
  #' @title function get_distinct_count_of_col
  #' 
  #' @description Returns the distint count of a single column
  #' in a dataframe.
  #' 
  #' @param df_input dataframe: The dataframe containing the column you want to count
  #' @param col_name string: The name of the column you want to count
  #' 
  #' @section Returns: dataframe: df with one column and one row containing the distinct count 

  df_output <- df_hes %>% summarise(
    {{col_name}} := n_distinct(df_input[[col_name]])
  )

  return(df_output)

}

download_file_if_not_exists <- function(url, destination) {
    #' @title function download_file_if_not_exists
    #' 
    #' @description Downloads a file from a specified URL to a
    #' specified local path. Checks if the file already exists
    #' and does not download if so.
    #' 
    #' @param url The URL of the file to be downloaded.
    #' Must include the file name e.g. http://example.com/data.csv
    #' @param destination The local path and file name where the
    #' file will be downloaded to e.g., data_in/data.csv
    #' 
    #' @section Returns: Nothing
    
    if (file.exists(destination)) {
      print("File already exists.")
      return() 
    }

    download.file(url, destination)   
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