#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    shinydashboardPlus::dashboardPage(
      header = shinydashboardPlus::dashboardHeader(title = "Mastering Shiny"),

      sidebar = shinydashboard::dashboardSidebar(
        shinydashboard::sidebarMenu(
          # Setting id makes input$tabs give the tabName of currently-selected tab
          id = "tabs",
          shinydashboard::menuItem("Chapter 1",
                                   tabName = "chapter1"
          ),
          shinydashboard::menuItem("Chapter 2",
                                   tabName = "chapter2"
          ),
          shinydashboard::menuItem("Chapter 3",
                                   tabName = "chapter3"
          ),
          shinydashboard::menuItem("Chapter 4",
                                   tabName = "chapter4"
          ),
          shinydashboard::menuItem("Chapter 7",
                                   tabName = "chapter7"
          )
        )
      ),

      body = shinydashboard::dashboardBody(
        shinydashboard::tabItems(
          shinydashboard::tabItem("chapter1", mod_chapter1_ui("chapter1_1")),
          shinydashboard::tabItem("chapter2", mod_chapter2_ui("chapter2_1")),
          shinydashboard::tabItem("chapter3", mod_chapter3_ui("chapter3_1")),
          shinydashboard::tabItem("chapter4", mod_chapter4_ui("chapter4_1")),
          shinydashboard::tabItem("chapter7", mod_chapter7_ui("chapter7_1"))
        )
      ),
      controlbar = NULL,
      title = "Mastering Shiny Samples"
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path("www",
                    app_sys("app/www"))

  tags$head(favicon(),
            bundle_resources(path = app_sys("app/www"),
                             app_title = "MasteringShiny")
            # Add here other external resources
            # for example, you can add shinyalert::useShinyalert()
          )
}
