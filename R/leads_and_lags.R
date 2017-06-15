#' leads_and_lags can be used to add in leads or lags of a variables
#'
#' @param df data frame
#' @param variable the variable to lead or lag
#' @param foo the function to use (lead or lag)
#' @param x the number of leads or lags to include
#'
#' @return a leaded or lagged vector to data frame
#' @export
#'
#' @examples
#' edat <- edat %>%
#'group_by(region,fishery,gear) %>%
#'  arrange(year) %>%
#'  leads_and_lags(quo(`average price`),lag,0:5) %>%
#'  leads_and_lags(quo(`average price`),lead,1:5)

leads_and_lags <- function(df,variable,foo, x) {
  foo_name <- enquo(foo)

  for (i in seq_along(x)) {
    name <- paste(quo_name(foo_name),x[i], sep = '_')

    df <-  mutate(df,
                  !!name := foo(!!variable,x[i])
    )
  }

  return(df)
}