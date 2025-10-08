#' Custom S7 Classes
#'
#' @description
#' Additional classes to include in S7 to use in \code{repro_code} methods:
#'
#' \describe{
#' \item{class_reactive}{The class capturing \code{reactive} objects}
#' }
#'
#' @noRd
class_reactive <- S7::new_S3_class("reactiveExpr")
class_event_reactive <- S7::new_S3_class("reactive.event")
