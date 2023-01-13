data <- readr::read_csv("https://raw.githubusercontent.com/Santatr/datasets/main/heath_insurance_data.csv")
dataset <- c(1, 2, 3)

test_that("testing on a list data", {
  returned_value <- make_report(dataset)
  expect_equal(returned_value, "Error: the given input is not a data.frame")
})
