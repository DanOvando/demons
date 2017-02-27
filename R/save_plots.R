#' save_plots saves all plots in the environment tagged
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
#' @examples plot_dir(plot_dir = 'results/')
save_plots <- function(plot_dir = '.', extension = '.pdf',
                       plot_tag = '_plot', fig_width = 6,
                       fig_height = 4,
                       dev = cairo_pdf){


  plot_list <- names(.GlobalEnv)[stringr::str_detect(names(.GlobalEnv),paste0(plot_tag,'$'))]

  # globa_env = new.env(parent = globalenv())

  for (i in seq_along(plot_list)) {
    eval(parse(text = paste('this_graph =', plot_list[i], sep = '')))

    if (class(this_graph)[1] == 'gg') {
      ggsave(
        file = paste(plot_dir, '/', plot_list[i], extension, sep = ''),
        this_graph,
        height = fig_height,
        width = fig_width,
        device = dev
      )
    } else{
      pdf(
        file = paste(plot_dir, '/', plot_list[i], extension, sep = ''),
        width = fig_width,
        height = fig_height
      )
      print(this_graph)
      dev.off()
    }

  }

}
