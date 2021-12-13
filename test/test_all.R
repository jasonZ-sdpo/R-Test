source("pgm/file_import/test_script_6_1.R")
testthat::expect_true(test_script_6_1(),
                      label = "Test Case 6.1 Import Excel File")



source("pgm/file_import/test_script_6_2.R")
testthat::expect_true(test_script_6_2(),
                      label = "Test Case 6.2 Import CSV File")



source("pgm/file_import/test_script_6_3.R")
testthat::expect_true(test_script_6_3(),
                      label = "Test Case 6.3 Import SAS7BDAT File")



source("pgm/file_import/test_script_6_4.R")
testthat::expect_true(test_script_6_4(),
                      label = "Test Case 6.4 Import PDF File")



source("pgm/file_transform/test_script_7_1.R")
testthat::expect_silent(test_script_7_1())

source("pgm/file_transform/test_script_7_2.R")
testthat::expect_silent(test_script_7_2())

source("pgm/file_transform/test_script_7_3.R")
testthat::expect_silent(test_script_7_3())

source("pgm/file_transform/test_script_7_3.R")
testthat::expect_silent(test_script_7_3())

source("pgm/file_transform/test_script_7_4.R")
testthat::expect_silent(test_script_7_4())

source("pgm/file_transform/test_script_7_5.R")
testthat::expect_silent(test_script_7_5())

source("pgm/file_transform/test_script_7_5.R")
testthat::expect_silent(test_script_7_5())


source("pgm/file_export/test_script_8_1.R")
testthat::expect_true(test_script_8_1(), label = "Test Case 8.1 Export Excel File")

source("pgm/file_export/test_script_8_2.R")
testthat::expect_true(test_script_8_2(), label = "Test Case 8.2 Export CSV File")

source("pgm/file_export/test_script_8_3.R")
testthat::expect_true(test_script_8_3(), label = "Test Case 8.3 Export PDF File")

source("pgm/file_export/test_script_8_4.R")
testthat::expect_true(test_script_8_4(), label = "Test Case 8.4 Export Image File")

source("pgm/file_export/test_script_8_5.R")
testthat::expect_true(test_script_8_5(), label = "Test Case 8.5 Export Word File")

source("pgm/file_export/test_script_8_6.R")
testthat::expect_true(test_script_8_6(), label = "Test Case 8.1 Export RTF File")
