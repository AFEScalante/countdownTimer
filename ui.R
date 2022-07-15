library(shiny)
library(shinyWidgets)

shinyUI(
  fluidPage(
    includeCSS("www/styles.css"),
    div(id = "input", airDatepickerInput("date", label = "Choose a date"))
  )
)
