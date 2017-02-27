#' \code{init_project} creates a series of standard folders for a new project
#'
#' @return a bunch of folders
#' @export
#'
#' @examples
#' init_project()
init_project <- function(use = 'science'){

  file.create('CITATION.txt', showWarnings = F)

  file.create('LICENSE.md', showWarnings = F)

  file.create('README.md', showWarnings = F)

  dir.create('data')

  dir.create('documents')

  dir.create('results')

  dir.create('scripts')

  dir.create('functions')

  dir.create('presentations')

  if (use == 'consulting'){

    dir.create('invoices')

    dir.create('contracts')
  }
  if (use == 'teaching'){

    dir.create('assignments')

    dir.create('grades')

  }



}
