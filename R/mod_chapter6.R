#' chapter6 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_chapter6_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' chapter6 Server Functions
#'
#' @noRd 
mod_chapter6_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_chapter6_ui("chapter6_1")
    
## To be copied in the server
# mod_chapter6_server("chapter6_1")
