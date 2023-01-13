dataset <- c(1, 2, 3)

test_that("testing on correct input data and column name", {
  returned_value <- unique_count(data, "age")
  expected_value <- 47
  expect_equal(returned_value, expected_value)
})

test_that("testing on wrong column name", {
  returned_value <- unique_count(data, "ages")
  expect_equal(returned_value, "Error: there is no column named ` ages ` in the data.frame")
})

test_that("testing on a list data", {
  returned_value <- unique_count(dataset, "age")
  expect_equal(returned_value, "Error: the given input is not a data.frame")
})
