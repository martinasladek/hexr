
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



