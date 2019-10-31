#' @name pyphlawd
#' @title pyphlawd
#' @description Run pyphlawd
#' @param taxon Taxon
#' @param db db
#' @param outdir outdir
#' @param logfile logfile
#' @param configfile configfile
#' @example /examples/example.R
#' @export
setup_clade <- function(taxon, db, outdir, logfile='log.txt',
                        configfile = NULL) {
  if (!is.null(configfile)) {
    cmds <- paste0('mv', configfile, '../PyPhlawd/src/')
    files_to_send <- configfile
  } else {
    files_to_send <- NULL
    cmds <- ''
  }
  cmds <- paste(cmds, "python3", '../PyPhlawd/src/setup_clade.py', taxon, db,
                '.', logfile)
  script <- file.path(tempdir(), 'script.sh')
  on.exit(file.remove(script))
  script_cnntn <- file(script, 'wb')
  write(x = cmds, file = script_cnntn)
  close(script_cnntn)
  otsdr <- outsider_init(pkgnm = 'om..pyphlawd', cmd = 'bash',
                         arglist = 'script.sh', wd = outdir,
                         files_to_send = files_to_send)
  run(otsdr)
}

# setup_clade_bait <- function(taxon, baitdir, db, outdir, logfile, configfile) {
#   arglist <- arglist_get(...)
#   config_copy()
#   cmd <- '../PyPhlawd/src/setup_clade_bait.py'
#   otsdr <- outsider_init(pkgnm = 'om..pyphlawd', cmd = cmd, arglist = arglist)
#   run(otsdr)
# }


# db_setup <- function() {
#   
# }
