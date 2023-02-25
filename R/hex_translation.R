#' Show RGB digits to hex digits translatation
#'
#' @return a named vector
#' @export
#'
#' @examples
#' hex_translation()
hex_translation <- function(){

  hex_translation = c(0:9, LETTERS[1:6])
  names(hex_translation) <- as.character(0:15)
  return(hex_translation)

}
