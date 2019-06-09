#' Daily exchange rates between the provide dates
#' @param date_from starting date of the period, back-filled for missing dates
#' @param date_to ending date of the period, back-filled for missing dates
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
#' eurusds('2019-06-01', '2019-06-08')

eurusds <- function(date_from, date_to, decimals = 5) {
  date_from <- ymd(date_from)
  date_to <- ymd(date_to)
  dates_good <- date_from < date_to

  if(dates_good==FALSE){
    log_info("You swapped the start and end date... exit the function")
    stop()
  }

  if(date_from > Sys.Date()){
    log_info("Can't tell you about the future, sorry... exit the function")
    stop()
  }

  if(date_to > Sys.Date()){
    log_info('I can only see until today, no further... resetting to today')
    date_to <- Sys.Date()
  }


  api_response <- GET(
    'https://api.exchangeratesapi.io/history',
    query = list(
      start_at = date_from - 30,
      end_at   = date_to,
      base     = 'USD',
      symbols  = 'EUR'
    ))

  exchange_rates <- content(api_response)$rates

  rate_table <- data.table(
    date = as.Date(names(exchange_rates)),
    eurusd = round(as.numeric(unlist(exchange_rates)), decimals))

  rate_table <- rate_table[order(date)]

  rate_table <- rate_table[date >= date_from & date <= date_to]

  return(rate_table)
  }
