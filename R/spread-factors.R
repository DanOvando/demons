#' spread_factors turns any character or factors into dummy variables
#'
#' @param data the data
#' @param drop_one logical indicating whether one level should be dropped
#'
#' @return a data frame with dummy variables instead of factors
#' @export
#'
#' @examples
#' spread_factors(iris, drop_one = T)
spread_factors <- function(data, drop_one = T) {
  factors <-
    colnames(data)[map_lgl(data, ~ class(.x) %in% c('character', 'factor'))]

  for (i in seq_along(factors)) {
    var <- factors[i]

    data <- data %>%
      mutate(dummy = 1, index = 1:nrow(.)) %>%
      spread_(var, 'dummy', fill = 0, sep = 'dummy') %>% {
        if (drop_one == T) {
          dplyr::select(.,-index,-contains('dummy')[1]) #drop the first dummy
        } else{
          dplyr::select(.,-index)
        }

      } %>%
      set_names(str_replace(colnames(.), 'dummy', '')) # remove dummy from names

  } # close for loop

  return(data)
}