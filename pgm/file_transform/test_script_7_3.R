# Test Case 7.3 openxlsx related function
library(openxlsx)
test_script_7_3 <- function() {
  ## Create a new workbook
  wb <- createWorkbook("test sample")
  ## Add a worksheets
  addWorksheet(wb, "Expenditure", gridLines = FALSE)
  ## write data to worksheet 1
  writeData(wb,
            sheet = 1,
            USPersonalExpenditure,
            rowNames = TRUE)
  ## create and add a style to the column headers
  headerStyle <- createStyle(
    fontSize = 14,
    fontColour = "#FFFFFF",
    halign = "center",
    fgFill = "#4F81BD",
    border = "TopBottom",
    borderColour = "#4F81BD"
  )
  ## style for body
  bodyStyle <-
    createStyle(border = "TopBottom", borderColour = "#4F81BD")
  addStyle(
    wb,
    sheet = 1,
    bodyStyle,
    rows = 2:6,
    cols = 1:6,
    gridExpand = TRUE
  )
  setColWidths(wb, 1, cols = 1, widths = 21) ## set column width for row names column
  ##export to excel
  saveWorkbook(wb, "data/excel_sample.xlsx", overwrite = TRUE)
}
