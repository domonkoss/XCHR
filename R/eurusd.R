#' Most recent USD/EUR exchange rate as number
#' @param decimals number of decimals to show
#' @export
#' @return integer
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom data.table data.table
#' @importFrom data.table setkey
#' @importFrom lubridate ymd
#' @importFrom logger log_info
#' @examples
#' eurusd()
#' eurusd(1000)

eurusd <- function(decimals = 5){
  response <- GET('https://api.exchangeratesapi.io/latest?base=USD')
  exchange_rates <- content(response)
  round(exchange_rates$rates$EUR, decimals)
