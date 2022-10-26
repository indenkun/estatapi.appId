#' Wrap functions of `{estatapi}` Functions
#'
#' @description
#' Wrap function to execute functions of `{estatapi}` using the appId set by [set_appId()].
#' If appId is set by [set_appId()], the set value is used if not specified by appId in the function.
#' Also, if appId is specified in the function, it is used first.
#'
#' Please refer to the `{estatapi}` documentation of each function.
#' @param appId
#'   Application ID.
#' @param path
#'   API endpoint.
#' @param statsDataId
#'   ID of the statistical dataset.
#' @param startPosition
#'   Index of the first record to get.
#' @param limit
#'   Max number of records to get.
#' @param lang
#'   Language of the data. `"J"`(Japanese) or `"E"`(English).
#' @param .fetch_all
#'   Whether to fetch all records when the number of records is larger than
#'   100,000.
#' @param searchWord
#'   Keyword for searching. You can use `OR` and `AND` to combine conditions
#'   (e.g.: `"apple AND orange"`).
#' @param .use_label
#'   Whether to take the human-redable label value or the code value when
#'   flattening a field containing both (default: `TRUE`).
#' @param surveyYears
#'   Year and month when the survey was conducted. The format is either
#'   `"YYYY"`, `"YYYYMM"`, or `"YYYYMM-YYYYMM"`.
#' @param openYears
#'   Year and month when the survey result was opened. The format is the
#'   same as `surveyYears`.
#' @param statsField
#'   Field of statistics. The format is either two digits(large classification)
#'   or four digits (small classification). For the detail of the
#'   classification, see <http://www.soumu.go.jp/toukei_toukatsu/index/seido/sangyo/26index.htm>.
#' @param statsCode
#'   Code assigned for each statistical agency and statistics. The format can
#'   be five digits (agency), and eight digits (statistics). For the detail,
#'   see <http://www.stat.go.jp/info/guide/public/code/code.htm>.
#' @param searchKind
#'   Type of statistics.
#'   \itemize{
#'     \item `1`:
#'       summary
#'     \item `2`:
#'       regional mesh
#'   }
#' @param collectArea
#'   Area of statistics.
#'   \itemize{
#'     \item `1`:
#'       country
#'     \item `2`:
#'       prefecture
#'     \item `3`:
#'       municipality
#'   }
#' @param updatedDate
#'   Last updated date. The format is either `"YYYY"`, `"YYYYMM"`, or
#'   `"YYYYMM-YYYYMM"`.
#' @param ...
#'   Other parameters.
#' \itemize{
#'  \item `lvTab`:
#'    Level of the meta-information. The format can be `X` or `X-Y`, `-X` and `X-`.
#'  \item `cdTab`:
#'    Code(s) of the meta-infomation items to select. The format can be a character vector (`c("001", "002")`) or
#'    a chraracter of values and commas (`"001,002"`).
#'  \item `cdTabFrom`:
#'    The code of the first meta-information item to select.
#'  \item `cdTabTo`:
#'    The code of the last meta-information item to select.
#'  \item `lvTime`:
#'     Level of the time to select. The format is the same as `lvTab`
#'  \item `cdTime`
#'     Time(s) to select. The format is the same way like `cdTab`
#'  \item `cdTimeFrom`:
#'    The first time to select. The format is the same way like `cdTabFrom`
#'  \item `cdTimeTo`:
#'    The last time to select. The format is the same way like `cdTabTo`
#'  \item `lvArea`:
#'     Level of the area to select. The format is the same as `lvTab`
#'  \item `cdArea`
#'     Code(s) of the Area to select. The format is the same way like `cdTab`
#'  \item `cdAreaFrom`:
#'    The code of the first area to select. The format is the same way like `cdTabFrom`
#'  \item `cdAreaTo`:
#'    The code of the last area to select. The format is the same way like `cdTabTo`
#'  \item `lvCat01`, `cdCat01`, `cdCat01From`, `cdCat01To`, ...:
#'    The same way like above.
#' }
#' @param dataType
#'   Type of data. `XLS`: Excel file, `CSV`: CSV file, `PDF`: PDF file, `DB`: Database.
#' @param catalogId
#'   Catalog ID.
#' @param resourceId
#'   Catalog resource ID.
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
