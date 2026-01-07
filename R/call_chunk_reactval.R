#' @description
#' Extracting the contents of the `reactiveVal` in a human-readable way
#'
#' @noRd
S7::method(repro_call_chunk, class_call_reactval) <- function(x, repro_code = Repro(), env = rlang::caller_env()) {
  reactive_val <- construct_reactive(x, env = env)
  eval_call <- str2lang(paste(rlang::call_name(x), "<-", reactive_val))

  repro_code@packages <- get_pkg_name(x)
  repro_code@code <- eval_call
  repro_code
}
