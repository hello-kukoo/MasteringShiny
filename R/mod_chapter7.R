#' chapter7 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_chapter7_ui <- function(id){
  ns <- NS(id)
  tagList(
    plotOutput(ns("plot"), brush = "plot_brush"),
    tableOutput(ns("data"))
  )
}

#' chapter7 Server Functions
#'
#' @noRd
mod_chapter7_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$plot <- renderPlot({
      ggplot(mtcars, aes(wt, mpg)) + geom_point()
    }, res = 96)

    output$data <- renderTable({
      brushedPoints(mtcars, input$plot_brush)
    })
  })
}
