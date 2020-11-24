context("Testing out_of_core_im function")
test_that("You out_of_core_im function works",{
  library(reticulate)
  # load all data, run ls model
  bhat_all <- coef(lm(y2 ~ X2 - 1))
  
  # load data row-by-row, run rls model
  source_python("C:/Users/Xining/Dropbox/My PC (DESKTOP-Q77OU8J)/Desktop/Campus/First Year/First Semester/Computitional Statistics/bis557homework4/R/py_rls.py")
  n <- length(y2)
  p <- 4
  G <- diag(p)
  bhat_one <- matrix(0, p, 1)
  for (i in 1:n) 
  {
    Xi <- X2[i,]
    Xi <- matrix(Xi, ncol=p)
    yi <- y2[i]
    result <- recursive_ls(Xi, yi, bhat_one, G)
    bhat_one <- result[[1]]
    G <- result[[2]]
  }
  
  
  expect_equivalent(bhat_all[1], bhat_one[1], tolerance = 1e-2 )
  expect_equivalent(bhat_all[2], bhat_one[2], tolerance = 1e-2 )
  expect_equivalent(bhat_all[3], bhat_one[3], tolerance = 1e-2 )
  expect_equivalent(bhat_all[4], bhat_one[4], tolerance = 1e-2 )
})  