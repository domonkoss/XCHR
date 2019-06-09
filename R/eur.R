#' Provided value in € format, separated by comma every 3 digits, rounded to 2 digits
#' @param amount amount to transform to €
#' @export
#' @return string
#' @examples
#' eur(87654321)
#' eur(-632678)
#' @seealso uneur()

eur <- function(value){

  input <- round(value, 2)
  eur <- format(input, big.mark = ",", scientific = FALSE)

  ifelse(input < 0,
         eur <- paste0("-€", substring(as.character(eur), 2)),
         eur <- paste0("€", as.character(eur))
         )

  return(eur)
}
