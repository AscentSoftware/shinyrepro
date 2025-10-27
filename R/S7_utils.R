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

class_event_cache <- S7::new_S3_class("reactive.cache")
class_event_reactive <- S7::new_S3_class("reactive.event")
class_bind_reactive <- S7::new_union(class_event_reactive, class_event_cache)

class_call_function <- S7::new_S3_class("function")
class_call_reactive <- S7::new_S3_class(".__reactive")
class_call_reactval <- S7::new_S3_class(".__reactval")
class_call_if <- S7::new_S3_class("if")
class_call_null <- S7::new_S3_class("NULL")
class_call_shiny <- S7::new_union(S7::new_S3_class("req"), S7::new_S3_class("validate"))
class_call_subset <- S7::new_S3_class("$")
