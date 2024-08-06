source("./backtests/backtest_params.r")

setwd("../../")

source("./create-report.r")

config <- config::get()

for (backtest in backtest_params$files_to_compare) {

    actual_path = paste(backtest_params$output_base_path, backtest$output_file, sep="")
    expected_path = paste(backtest_params$ground_truth_base_path, backtest$ground_truth_file, sep="")
    test_name = paste(backtest$test_name, "matches ground truth")

    if(!file.exists(actual_path)) {
        print('output file does not exist... running pipeline')
        pipeline(config)
    } else {
        print("output file already exists")
    }

    df_actual <- read.csv(actual_path)
    df_expected <- read.csv(expected_path)

    test_that(test_name, {
        expect_equal(df_actual, df_expected)
    })
}