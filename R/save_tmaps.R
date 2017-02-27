#' save_tmaps saves all plots in the environment tagged
#' with the appropriate variable name, such as '_plot'
#'
#' @param plot_dir the directory to save plots
#' @param extension the extension to save the plots as
#' @param plot_tag the tag to identify what's a plot
#' @param fig_width the height of the figure in inches
#' @param fig_height the width of the figure in inches
#'
#' @return saved plots
#' @export
#'
#' @examples save_tmaps(plot_dir = 'results/')
save_tmaps <- function(plot_dir = '.', extension = '.pdf',
                       plot_tag = '_map', fig_width = 6,
                       fig_height = 4){

  plot_list <- names(.GlobalEnv)[stringr::str_detect(names(.GlobalEnv),paste0(plot_tag,'$'))]

  for (i in seq_along(plot_list)) {
    eval(parse(text = paste('this_graph =', plot_list[i], sep = '')))

      tmap::save_tmap(tm = this_graph,
                      filename = paste(plot_dir, '/', plot_list[i], extension, sep = ''),
        height = fig_height,
        width = fig_width
      )

}

}
