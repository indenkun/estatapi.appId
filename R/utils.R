#' e-Stat API ID Utils
#'
#' @description
#' Function to check the directory and file location where e-Stat's API ID (appId) is stored.
#' The behavior is independent of the existence of the directory and file.
#' @rdname Utils

dir_appId <- function(){
  rappdirs::user_data_dir(appname = "estatapi.appId", appauthor = "R")
}

#' @rdname Utils

file_appId <- function(){
  file.path(dir_appId(), "appId")
}
