#' Generate a hex code
#'
#' @param red_val a value between 0-1 for the red spectrum
#' @param green_val a value between 0-1 for the green spectrum
#' @param blue_val a value between 0-1 for the blue spectrum
#'
#' @return a hex code character vector
#' @export
#'
#' @examples
#' hex_code(0.9, 0.1, 0.5)
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
