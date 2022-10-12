#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  mod_chapter1_server("chapter1_1")
  mod_chapter2_server("chapter2_1")
  mod_chapter3_server("chapter3_1")
  mod_chapter4_server("chapter4_1")
  mod_chapter7_server("chapter7_1")
}
