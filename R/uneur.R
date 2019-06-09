#' Converts currency string into sole number
#' @param eur € value
#' @export
#' @return integer
#' @examples
#' uneur('€99,999.338309475')
#' uneur('-€987,765,333.4657')
#' @seealso eur()

uneur <- function(eur){
  options(digits=12)

  if(substring(eur, 0, 1) == '-'){
    number <- -as.numeric(as.character(gsub(',','',substring(eur, 3))))
    number <- round(number, 2)
    number

  } else {
    number <- as.numeric(as.character(gsub(',','',substring(eur, 2))))
    number <- round(number, 2)
    number
  }

}
