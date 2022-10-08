#' chapter2 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList

animals <- c("dog", "cat", "mouse", "bird", "other", "I hate animals")

mod_chapter2_ui <- function(id){
  ns <- NS(id)
  tagList(
    # input ------------------------------------------------------------------

    textInput(ns("name"), "What's your name?"),
    passwordInput(ns("password"), "What's your password?"),
    textAreaInput(ns("story"), "Tell me about yourself", rows = 3),

    numericInput(ns("num"), "Number one", value = 10, min = 0, max = 100),
    sliderInput(ns("num2"), "Number two", value = 50, min = 0, max = 100),
    sliderInput(ns("rng"), "Range", value = c(10, 20), min = 0, max = 100),

    dateInput(ns("dob"), "When were you born?", language = "zh-CN"),
    dateRangeInput(ns("holiday"),
                   "假期何时开始?",
                   language = "zh-CN",
                   separator = " 至 "),

    selectInput(ns("state"), "What's your favourite state?",
                state.name, multiple = TRUE),
    radioButtons(ns("animal"), "What's your favourite animal?", animals),
    radioButtons(ns("rb"), "Choose one:",
                 choiceNames = list(
                   icon("angry"),
                   icon("smile"),
                   icon("sad-tear")
                 ),
                 choiceValues = list("angry", "happy", "sad")
    ),
    checkboxGroupInput(ns("animals"), "What animals do you like?", animals),

    checkboxInput(ns("cleanup"), "Clean up?", value = TRUE),
    checkboxInput(ns("shutdown"), "Shutdown?"),

    fileInput(ns("upload"), NULL),

    actionButton(ns("click"), "Click me!"),
    actionButton(ns("drink"), "Drink me!", icon = icon("cocktail")),

    fluidRow(
      actionButton(ns("click"), "Click me!", class = "btn-danger"),
      actionButton(ns("drink"), "Drink me!", class = "btn-lg btn-success")
    ),
    fluidRow(
      actionButton(ns("eat"), "Eat me!", class = "btn-block")
    ),

    # output ------------------------------------------------------------------

    textOutput(ns("text")),
    verbatimTextOutput(ns("code")),


    # output table ------------------------------------------------------------
    br(),
    h3("Fixed table"),
    tableOutput(ns("static")),
    br(),
    h3("Dynamic table"),
    dataTableOutput(ns("dynamic")),

    # plotting ----------------------------------------------------------------
    br(),
    h3("Plotting"),
    plotOutput(ns("plot"), width = "400px")
  )
}

#' chapter2 Server Functions
#'
#' @noRd
mod_chapter2_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$text <- renderText({
      "Hello friend!"
    })
    output$code <- renderPrint({
      summary(1:10)
    })
    output$static <- renderTable(head(mtcars))
    output$dynamic <- renderDataTable(mtcars,
                                      options = list(pageLength = 5,
                                                     searching = FALSE))
    output$plot <- renderPlot(plot(1:5), res = 96)

  })
}
