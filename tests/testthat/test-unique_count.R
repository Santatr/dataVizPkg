data <- readr::read_csv("https://raw.githubusercontent.com/Santatr/datasets/main/heath_insurance_data.csv")

test_that("test on a true column of the dataframe", {
  returned_value <- unique_count(data, age)
  expected_value <- 47
  expect_equal(returned_value, expected_value)
})

test_that("test on a column name typo", {
  returned_value <- unique_count(data, ages)
  expect_equal(returned_value, "Error: there is no column named ages in the data frame")
})
