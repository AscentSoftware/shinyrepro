#' Generic Method for Reproducing Code
#'
#' @description
#' Standard response is to return the called object
#'
#' @include repro_chunk.R
#' @noRd
S7::method(repro_chunk, S7::class_any) <- function(x, ..., repro_code = Repro(), env = rlang::caller_env()) {
  repro_code@code <- x
  repro_code
}
