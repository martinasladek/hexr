#' Helper function to show RGB colour presets at 0-1 scale
#'
#' @return A data frame
#' @export
#'
#' @examples
#' colour_presets()
#'
colour_presets <- function(){

  colour_preset_df <- data.frame(
    r = c(0, 0, 0, 0, 1, 1, 1, 1),
    g = c(0, 0, 1, 1, 1, 0, 0, 1),
    b = c(0, 1, 1, 0, 0, 0, 1, 1)
  )

  rownames(colour_preset_df) <- c("Black", "Blue", "Cyan", "Green", "Yellow", "Red", "Pink", "White")

  return(colour_preset_df)

}
