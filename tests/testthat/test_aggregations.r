library(dplyr)
library(testthat)

setwd("../../")
source("src/data_processing/aggregations.r")

test_that("get_distinct_count_of_col works", {
    
    df_test_data <- data.frame(
        test_column = c("A", "B", "C", "D", "D", NULL)
    )

    df_expected <- data.frame(
        test_column = c(4)
    )
  
    df_actual = get_distinct_count_of_col(df_test_data, "test_column")

    expect_equal(df_actual, df_expected)
})