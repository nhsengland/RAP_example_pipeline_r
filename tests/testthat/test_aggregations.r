library(dplyr)
library(testthat)

setwd("../../")
source("src/data_processing/aggregations.r")

test_that("get_distinct_count_of_col works", {
    
    # Arrange
    df_test_data <- data.frame(
        test_column = c("A", "B", "C", "D", "D", NULL)
    )

    df_expected <- data.frame(
        test_column = c(4)
    )
  
    # Act
    df_actual = get_distinct_count_of_col(df_test_data, "test_column")

    # Assert
    expect_equal(df_actual, df_expected)
})