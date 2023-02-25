#' Display a hex colour as a plot
#'
#' @param red_val a value between 0-1 for the red spectrum
#' @param green_val a value between 0-1 for the green spectrum
#' @param blue_val a value between 0-1 for the blue spectrum
#'
#' @return a hex code (character) and a plot (ggplot2 object)
#' @import ggplot2
#' @export
#'
#' @examples
#' hex_block(0.9, 0.1, 0.5)
hex_block <- function(red_val, green_val, blue_val){

  hex_code <- hex_code(red_val, green_val, blue_val)

  hex_block <- ggplot2::ggplot(data = NULL, ggplot2::aes(1, 1)) +
    ggplot2::theme_void() +
    ggplot2::theme(
      panel.background = ggplot2::element_rect(hex_code)
    )

  list(hex_code, hex_block)
}
