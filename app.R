library(shiny)
library(shinyWidgets)
library(lubridate)
library(glue)
source("countdownCalculate.R")

ui <- fluidPage(
    includeCSS("www/styles.css"),
    modalDialog(
      "Hi! Welcome to this Countdown Timer made with R Shiny. Select a posterior date and see how many days, hours, minutes and seconds are left for the event to occur.",
      title = "Welcome"
    ),
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
    req(as.numeric(difftime(input$date, lubridate::now())) >= 0)
    time_remaining(input$date, lubridate::now())
  })

  output$outputDays <- renderText({
    glue::glue("{timeLeft()$days} Days : {timeLeft()$hours} Hours : {timeLeft()$minutes} Minutes : {timeLeft()$seconds} Seconds")
  })
}

shiny::shinyApp(ui = ui, server = server)