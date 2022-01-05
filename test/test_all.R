########## Section 1 General Workflow #########
source("pgm/general_workflow/test_script_1_1.R")
testthat::expect_silent(test_script_1_1())

source("pgm/general_workflow/test_script_1_2.R")
testthat::expect_silent(test_script_1_2())

source("pgm/general_workflow/test_script_1_6.R")
testthat::expect_silent(test_script_1_6())

########## Section 2 Global Options #########
source("pgm/global_option/test_script_2_3.R")
testthat::expect_true(test_script_2_3(),
                      label = "Test Case 2.3 Git Version Contorl Support")

########## Section 3 Project Options #########
source("pgm/project_option/test_script_3_1.R")
testthat::expect_output(test_script_3_1())


########## Section 4 Package Management #########
# move to a separate project as this project is using virtual environment.
# source("pgm/package_management//test_script_4_1.R")
# testthat::expect_equal(test_script_4_1(), 0)

source("pgm/package_management//test_script_4_3.R")
testthat::expect_silent(test_script_4_3)


########## Section 6 File Import #########
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


########## Section 7 File Transformation #########
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


########## Section 8 File Export #########
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


########## Section 9 Performance Test #########
source("pgm/performance/test_script_9_1.R")
output_9_1 <- test_script_9_1()
write.csv(output_9_1, 'output/performance_9_1.csv')
result <- ggplot2::ggplot(output_9_1,
                          ggplot2::aes(
                            x = replications,
                            y = elapsed,
                            color = test,
                            linetype = type
                          )) +
  ggplot2::geom_line() + ggplot2::ggtitle("Test Cases 9.1 Performance Testing")
ggplot2::ggsave("output/performance_9_1.png", result)

# Require manually switch session and run the test_script_9_2.R in R Package Test

source("pgm/performance/test_script_9_2.R")
output_9_2 <- test_script_9_2()
if(exists("output_9_1")){
  output_9_2 <- rbind(output_9_2, output_9_1)
  write.csv(output_9_2, 'output/performance_9_2.csv')
}else{
  output_9_1 <- read.csv("output/performance_9_1.csv")
  output_9_2 <- rbind(output_9_2, output_9_1)
  write.csv(output_9_2, 'output/performance_9_2.csv')
}
result <- ggplot2::ggplot(output_9_2,
                          ggplot2::aes(
                            x = replications,
                            y = elapsed,
                            color = test,
                            linetype = type
                          )) +
  ggplot2::geom_line() + ggplot2::geom_point() + ggplot2::ggtitle("Test Cases 9.2 Performance Testing")
ggplot2::ggsave("output/performance_9_2.png", result)

# source("pgm/performance/test_script_9_6.R")
# # move to a separate project as this project is using virtual environment.
# output_9_6 <- test_script_9_6()
# ggplot2::ggsave("output/performance_9_6.png", output_9_6)
