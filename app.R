library(shiny)
library(shinyWidgets)
library(lubridate)
library(glue)
source("countdownCalculate.R")

ui <- fluidPage(
    includeCSS("www/styles.css"),
    div(class = "flex-container-main",
      h1("Countdown Timer"),
      div(id = "dateInput",
        airDatepickerInput("date", label = "Choose a date", clearButton = TRUE)
      ),
      div(class = "output-days", textOutput(outputId = "outputDays"))
    )
  )

server <- function(input, output) {
  timeLeft <- reactive({
    invalidateLater(1000)
    time_remaining(input$date, now())
  })

  output$outputDays <- renderText({
    glue::glue("{timeLeft()$days} Days : {timeLeft()$hours} Hours : {timeLeft()$minutes} Minutes : {timeLeft()$seconds} Seconds")
  })
}

shiny::shinyApp(ui = ui, server = server)