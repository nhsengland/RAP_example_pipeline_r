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