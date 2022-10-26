#' e-Stat API ID Tools
#'
#' @description
#' Functions for setting, deleting, and confirming the API ID (appId) of e-Stat.
#' @param appId Application ID of e-stat API.
#' @rdname Tools
#' @export

set_appId <- function(appId){
  if(!is.character(appId)){
    stop("appId must be entered as a string.")
  }

  dir_appId <- dir_appId()
  if(!dir.exists(dir_appId)) dir.create(dir_appId, recursive = TRUE)

  write(appId, file = file_appId())
}

#' @rdname Tools
#' @export

clear_appId <- function(){
  file_appId <- file_appId()

  if(file.exists(file_appId)){
    message("appId that has been set is cleared.")
    invisible(file.remove(file_appId))
  }else{
    stop("appId has no cash value.")
  }
}

#' @rdname Tools
#' @export

check_appId <- function(){
  file_appId <- file_appId()

  if(file.exists(file_appId)){
    scan(file = file_appId,
         what = "character",
         quiet = TRUE)
  }else{
    NULL
  }
}


