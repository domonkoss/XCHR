#' Takes the provided number as USD and converts it to EUR on the current exchange rate
#' @param x number of USD
#' @param decimals number of decimals for the exchange rate
#' @export
#' @return integer
#' @examples
#' convert_usd_to_eur(5)
#' convert_usd_to_eur(42)

convert_usd_to_eur <- function(usd, decimals = 5){
  exchange_rate <- eurusd(decimals)
  exchange_rate * usd
}
