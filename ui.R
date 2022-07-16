library(shiny)
library(shinyWidgets)

source("spinner.R")

shinyUI(
  fluidPage(
    includeCSS("www/styles.css"),
    fluidRow(
      div(id = "input",
          airDatepickerInput("date", label = "Choose a date")
      )
    ),
    fluidRow(
      div(id = "mi-spinner",
          spinner()
      )
    )
  )
)
