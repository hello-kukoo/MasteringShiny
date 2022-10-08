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
 
  )
}
    
#' chapter7 Server Functions
#'
#' @noRd 
mod_chapter7_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_chapter7_ui("chapter7_1")
    
## To be copied in the server
# mod_chapter7_server("chapter7_1")
