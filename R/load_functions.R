#' \code{load_functions} loads locally created functions to the environment
#'
#' @param func_dir the directory where the functions live
#'
#' @export
#'
#' @examples load_functions(func_dir = 'functions')
load_functions <- function(func_dir = 'functions') {


  local_foos <- sapply(list.files(
    pattern = "[.]R$",
    path = func_dir,
    full.names = TRUE
  ),
  source, local = F)

}
