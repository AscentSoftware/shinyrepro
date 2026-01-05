#' Reproducing Code for Reactive Object
#'
#' @include repro_chunk.R
#' @noRd
S7::method(repro_chunk, class_reactive) <- function(x, ..., repro_code = Repro(), env = rlang::caller_env()) {
  observer <- attr(x, "observable", exact = TRUE)
  reactive_body <- rlang::fn_body(observer$.origFunc)
  reactive_exprs <- as.list(reactive_body)[-1]

  module_env <- rlang::env_parent(env = environment(observer$.origFunc))
  for (reactive_expr in reactive_exprs) {
    repro_code <- repro_chunk(reactive_expr, repro_code = repro_code, env = module_env)
  }

  repro_code
}
