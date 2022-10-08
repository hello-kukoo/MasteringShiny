#' chapter3 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_chapter3_ui <- function(id) {
  ns <- NS(id)
  tagList(fluidPage(
    fluidRow(
      column(
        4,
        ns("Distribution 1"),
        numericInput(
          ns("n1"),
          label = "n",
          value = 1000,
          min = 1
        ),
        numericInput(
          ns("mean1"),
          label = "µ",
          value = 0,
          step = 0.1
        ),
        numericInput(
          ns("sd1"),
          label = "σ",
          value = 0.5,
          min = 0.1,
          step = 0.1
        )
      ),
      column(
        4,
        ns("Distribution 2"),
        numericInput(
          ns("n2"),
          label = "n",
          value = 1000,
          min = 1
        ),
        numericInput(
          ns("mean2"),
          label = "µ",
          value = 0,
          step = 0.1
        ),
        numericInput(
          ns("sd2"),
          label = "σ",
          value = 0.5,
          min = 0.1,
          step = 0.1
        )
      ),
      column(
        4,
        ns("Frequency polygon"),
        numericInput(
          ns("binwidth"),
          label = "Bin width",
          value = 0.1,
          step = 0.1
        ),
        sliderInput(
          ns("range"),
          label = "range",
          value = c(-3, 3),
          min = -5,
          max = 5
        ),
        actionButton(ns("simulate"), "Simulate!")
      )
    ),
    fluidRow(column(9, plotOutput(ns(
      "hist"
    ))),
    column(3, verbatimTextOutput(ns(
      "ttest"
    ))))
  ))
}

#' chapter3 Server Functions
#'
#' @noRd
mod_chapter3_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    x1 <- eventReactive(input$simulate, {
      rnorm(input$n1, input$mean1, input$sd1)
    })
    x2 <- eventReactive(input$simulate, {
      rnorm(input$n2, input$mean2, input$sd2)
    })

    output$hist <- renderPlot({
      freqpoly(x1(),
               x2(),
               binwidth = input$binwidth,
               xlim = input$range)
    }, res = 96)

    output$ttest <- renderText({
      t_test(x1(), x2())
    })

    observeEvent(input$simulate, {
      message("Simulating performed")
    })
  })
}

## To be copied in the UI
# mod_chapter3_ui("chapter3_1")

## To be copied in the server
# mod_chapter3_server("chapter3_1")
