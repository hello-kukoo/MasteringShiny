#' chapter4 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_chapter4_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' chapter4 Server Functions
#'
#' @noRd 
mod_chapter4_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_chapter4_ui("chapter4_1")
    
## To be copied in the server
# mod_chapter4_server("chapter4_1")
