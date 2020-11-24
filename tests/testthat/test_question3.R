context("Testing LASSO_regression_model")
test_that("You LASSO_regression_model function works",{
  library(reticulate)
  bhat_r <- casl_lenet(X1, y1, lambda = 0.1)
  bhat_r[bhat_r != 0]
  
  source_python("C:/Users/Xining/Dropbox/My PC (DESKTOP-Q77OU8J)/Desktop/Campus/First Year/First Semester/Computitional Statistics/bis557homework4/R/py_lasso.py")
  out <- lasso_fista(y1, X1, 0.1, 10000L)
  bhat_py <- out[[1]]
  bhat_py[abs(bhat_py) > 0.02]
  
  expect_equivalent(bhat_r[1], bhat_py[1], tolerance = 0.1)
  expect_equivalent(bhat_r[2], bhat_py[2], tolerance = 0.1)
  expect_equivalent(bhat_r[3], bhat_py[3], tolerance = 0.1)
})