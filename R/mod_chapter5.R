#' chapter5 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_chapter5_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' chapter5 Server Functions
#'
#' @noRd 
mod_chapter5_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_chapter5_ui("chapter5_1")
    
## To be copied in the server
# mod_chapter5_server("chapter5_1")
