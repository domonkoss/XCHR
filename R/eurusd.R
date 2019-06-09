#' Most recent USD/EUR exchange rate as number
#' @param decimals number of decimals to show
#' @export
#' @return integer
#' @importFrom httr GET
#' @importFrom httr content
#' @examples
#' eurusd()
#' eurusd(1000)

eurusd <- function(decimals = 5){
  api_response <- GET('https://api.exchangeratesapi.io/latest?base=USD')
  exchange_rates <- content(api_response)
  round(exchange_rates$rates$EUR, decimals)
}
