#' chapter1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_chapter1_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidPage(
      selectInput(
        ns("dataset"),
        label = "Dataset",
        choices = ls("package:datasets")
      ),
      verbatimTextOutput(ns("summary")),
      tableOutput(ns("table")),
      dataTableOutput(ns("dynamic"))
    )
  )
}

#' chapter1 Server Functions
#'
#' @noRd
mod_chapter1_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    dataset <- reactive({
      get(input$dataset, "package:datasets")
    })

    output$summary <- renderPrint({
      # Use a reactive expression by calling it like a function
      summary(dataset())
    })

    output$table <- renderTable({
      head(dataset())
    })
    output$dynamic <-
      renderDataTable(dataset(), options = list(pageLength = 5))

  })
}

