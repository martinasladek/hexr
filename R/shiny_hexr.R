#' A simple colour picker shiny app
#'
#' @param ... Additional shiny arguments
#'
#' @return A shiny runtime
#' @import shiny shinyWidgets
#' @export
#'
#' @examples
#'  \dontrun{
#'  shiny_hexr()
#' }
shiny_hexr <- function(...){

  block_height = 300
  block_width = 350

  ui <- shiny::fluidPage(

    # Title
    title = "Hex Colours",

    # Show a plot of the generated distribution
    shiny::column(4),
    shiny::fluidRow(
      shiny::column(4,
                    shiny::br(),
                    shiny::fluidRow(align = "center", style = paste0("height:", block_height, "px"),
                                    shiny::plotOutput("hex_block_plot")),
                    shiny::fluidRow(align = "center",
                                    shiny::htmlOutput("hex_code")),
                    shiny::fluidRow(align = "center",
                                    shinyWidgets::setSliderColor(c("red", "green", "blue"), c(1, 2, 3)),
                                    shiny::sliderInput("red_slider",
                                                       "",
                                                       min = 0,
                                                       max = 1,
                                                       value = 0.5),
                                    shiny::sliderInput("green_slider",
                                                       "",
                                                       min = 0,
                                                       max = 1,
                                                       value = 0.5),
                                    shiny::sliderInput("blue_slider",
                                                       "",
                                                       min = 0,
                                                       max = 1,
                                                       value = 0.5)
                    )
      )
    ),
    shiny::column(4)
    # )
  )

  # Define server logic required to draw a histogram
  server <- function(input, output) {

    rvs <- shiny::reactiveValues(
      hex_code = NULL
    )

    output$hex_block_plot <- shiny::renderPlot({

      rvs$hex_code <- hex_code(input$red_slider, input$green_slider, input$blue_slider)
      hex_block <- hex_block(input$red_slider, input$green_slider, input$blue_slider)
      hex_block[[2]]
    }, height = block_height, width = block_width)

    output$hex_code <- shiny::renderUI({

      shiny::HTML(
        paste0(
          '<br>',
          '<h1 style="font-size:200%;">',
          rvs$hex_code,
          '</h1>'
        )
      )
    })
  }



  # Run the application
  app <- shiny::shinyApp(ui = ui, server = server,
                         ...)

  shiny::runGadget(
    app = app,
    viewer = shiny::paneViewer(minHeight = "maximize")
  )

}

