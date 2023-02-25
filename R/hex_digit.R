#' Convert an RGB digit into a hex digits (helper function)
#'
#' @param rgb_digit a raw RGB digit value between 0 and 255
#'
#' @return a double
#' @export
#'
#' @examples
#' hex_digit(123)
hex_digit <- function(rgb_digit){

  digit_1 <- rgb_digit/16
  digit_2 <- as.character(floor((digit_1 - floor(digit_1))*16))
  digit_1 <- as.character(floor(digit_1))

  return(
    c(digit_1, digit_2)
  )
}
