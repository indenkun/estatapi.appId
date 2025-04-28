#' Wrap functions of `{estatapi}` Functions
#'
#' @description
#' Wrap function to execute functions of `{estatapi}` using the appId set by [set_appId()].
#' If appId is set by [set_appId()], the set value is used if not specified by appId in the function.
#' Also, if appId is specified in the function, it is used first.
#'
#' Please refer to the `{estatapi}` documentation of each function.
#'
#' @inheritParams estatapi::estat_getStatsData
#' @inheritParams estatapi::estat_api
#' @inheritParams estatapi::estat_getDataCatalog
#' @inheritParams estatapi::estat_getMetaInfo
#' @inheritParams estatapi::estat_getStatsList
#'
#' @seealso
#' [estatapi::estat_api()]
#' [estatapi::estat_getDataCatalog()]
#' [estatapi::estat_getMetaInfo()]
#' [estatapi::estat_getStatsData()]
#' [estatapi::estat_getStatsList()]
#'
#' <http://www.e-stat.go.jp/api/e-stat-manual3-0/#api_2_3>
#' <http://www.e-stat.go.jp/api/e-stat-manual3-0/#api_3_4>
#' @rdname estatapi
#' @export

estat_getDataCatalog <- function(lang = c("J", "E"),
                                 .use_label = TRUE,
                                 surveyYears = NULL,
                                 openYears = NULL,
                                 statsField = NULL,
                                 statsCode = NULL,
                                 searchWord = NULL,
                                 dataType = NULL,
                                 catalogId = NULL,
                                 resourceId = NULL,
                                 startPosition = NULL,
                                 limit = NULL,
                                 updatedDate = NULL,
                                 appId = check_appId(),
                                 ...){

  if(is.null(appId)) stop("appId is not specified.")

  estatapi::estat_getDataCatalog(appId = appId,
                                 lang = lang,
                                 .use_label = .use_label,
                                 surveyYears = surveyYears,
                                 openYears = openYears,
                                 statsField = statsField,
                                 statsCode = statsCode,
                                 searchWord = searchWord,
                                 dataType = dataType,
                                 catalogId = catalogId,
                                 resourceId = resourceId,
                                 startPosition = startPosition,
                                 limit = limit,
                                 updatedDate = updatedDate,
                                 ...)
}

#' @rdname estatapi
#' @export

estat_getMetaInfo <- function(statsDataId, lang = c("J", "E"), appId = check_appId(), ...){

  if(is.null(appId)) stop("appId is not specified.")

  estatapi::estat_getMetaInfo(appId = appId,
                              statsDataId = statsDataId,
                              lang = lang,
                              ...)
}

#' @rdname estatapi
#' @export

estat_getStatsData <- function(statsDataId,
                               startPosition = NULL,
                               limit = NULL,
                               lang = c("J", "E"),
                               .fetch_all = TRUE,
                               appId = check_appId(),
                               ...){

  if(is.null(appId)) stop("appId is not specified.")

  estatapi::estat_getStatsData(appId = appId,
                               statsDataId = statsDataId,
                               startPosition = startPosition,
                               limit = limit,
                               lang = lang,
                               .fetch_all = .fetch_all,
                               ...)
}

#' @rdname estatapi
#' @export

estat_getStatsList <- function(searchWord,
                              lang = c("J", "E"),
                              .use_label = TRUE,
                              surveyYears = NULL,
                              openYears = NULL,
                              statsField = NULL,
                              statsCode = NULL,
                              searchKind = NULL,
                              collectArea = NULL,
                              startPosition = NULL,
                              limit = NULL,
                              updatedDate = NULL,
                              appId = check_appId(),
                              ...){

  if(is.null(appId)) stop("appId is not specified.")

  estatapi::estat_getStatsList(appId = appId,
                               searchWord = searchWord,
                               lang = lang,
                               .use_label = .use_label,
                               surveyYears = surveyYears,
                               openYears = openYears,
                               statsField = statsField,
                               statsCode = statsCode,
                               searchKind = searchKind,
                               collectArea = collectArea,
                               startPosition = startPosition,
                               limit = limit,
                               updatedDate = NULL,
                               ...)
}

#' @rdname estatapi
#' @export

estat_api <- function(path,
                      appId = check_appId(),
                      ...){

  if(is.null(appId)) stop("appId is not specified.")

  estatapi::estat_api(path = path,
                      appId = appId)
}
