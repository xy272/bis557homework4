context("Testing casl_lm_ridge")
test_that("You casl_lm_ridge function works",{
  library(reticulate)
  br <- My_ridge_regression(X, y, 0.1)
  br
  
  source_python("C:/Users/Xining/Dropbox/My PC (DESKTOP-Q77OU8J)/Desktop/Campus/First Year/First Semester/Computitional Statistics/bis557homework4/R/py_ridge_regression.py")
  b <- ridge_regression(y, X, 0.1)
  b
  
  expect_equivalent(br[1], b[1], tolerance = 1e-5 )
  expect_equivalent(br[2], b[2], tolerance = 1e-5 )
  expect_equivalent(br[3], b[3], tolerance = 1e-5 )
})  