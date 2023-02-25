
library(shiny)
library(shinydashboard)
library(shinyWidgets)


hex_translation <- function(){
    hex_translation = c(0:9, LETTERS[1:6])
    names(hex_translation) <- as.character(0:15)
    return(hex_translation)
}

hex_digit <- function(rgb_digit){

    digit_1 <- rgb_digit/16
    digit_2 <- as.character(floor((digit_1 - floor(digit_1))*16))
    digit_1 <- as.character(floor(digit_1))

    return(
        c(digit_1, digit_2)
    )
}

# if hex codes are on a scale 0-1
hex_code <- function(red_val, green_val, blue_val){

    red_val = red_val*255
    green_val = green_val*255
    blue_val = blue_val*255

    r_hexes <- hex_digit(red_val)
    g_hexes <- hex_digit(green_val)
    b_hexes <- hex_digit(blue_val)

    hex_code = paste0(
        "#",
        hex_translation()[[r_hexes[1]]],
        hex_translation()[[r_hexes[2]]],

        hex_translation()[[g_hexes[1]]],
        hex_translation()[[g_hexes[2]]],

        hex_translation()[[b_hexes[1]]],
        hex_translation()[[b_hexes[2]]]
    )

    return(hex_code)
}

hex_block <- function(red_val, green_val, blue_val){

    hex_code <- hex_code(red_val, green_val, blue_val)

    hex_block <- ggplot2::ggplot(data = NULL, ggplot2::aes(1, 1)) +
        ggplot2::theme_void() +
        ggplot2::theme(
            panel.background = ggplot2::element_rect(hex_code)
        )

    list(hex_code, hex_block)
}


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Title
    title = "Hex Colours",

    # Show a plot of the generated distribution
    column(4),
    fluidRow(
        column(4,
               br(),
               fluidRow(plotOutput("hex_block_plot")),
               fluidRow(htmlOutput("hex_code"), align = "center"),
               fluidRow(align = "center",
                        shinyWidgets::setSliderColor(c("red", "green", "blue"), c(1, 2, 3)),
                        sliderInput("red_slider",
                                    "",
                                    min = 0,
                                    max = 1,
                                    value = 0.5),
                        sliderInput("green_slider",
                                    "",
                                    min = 0,
                                    max = 1,
                                    value = 0.5),
                        sliderInput("blue_slider",
                                    "",
                                    min = 0,
                                    max = 1,
                                    value = 0.5)
               )
        )
    ),
    column(4)
    # )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    rvs <- reactiveValues(
        hex_code = NULL
    )

    output$hex_block_plot <- renderPlot({

        rvs$hex_code <- hex_code(input$red_slider, input$green_slider, input$blue_slider)
        hex_block <- hex_block(input$red_slider, input$green_slider, input$blue_slider)
        hex_block[[2]]
    })

    output$hex_code <- renderUI({

        HTML(
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
shinyApp(ui = ui, server = server)
