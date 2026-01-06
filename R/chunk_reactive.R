#' @description
#' When reproducing a reactive object, a step is required to get the environment that
#' the reactive was assigned in, rather than the environment that is calling `repro`.
#' For that, some diving into the internals of the observable object is required to
#' get the specific environment, before generating the repro code.
#'
#' @include repro_chunk.R
#' @noRd
S7::method(repro_chunk, class_reactive) <- function(x, repro_code = Repro(), env = rlang::caller_env()) {
  observer <- attr(x, "observable", exact = TRUE)
  module_env <- rlang::env_parent(env = environment(observer$.origFunc))
  inner_reactive <- observer$.origFunc

  # Accounts for bindEvent and bindCache
  while ("wrappedFunc" %in% names(attributes(module_env$valueFunc))) {
    inner_reactive <- attr(module_env$valueFunc, "wrappedFunc", exact = TRUE)
    module_env <- rlang::env_parent(env = environment(inner_reactive))
  }

  reactive_body <- rlang::fn_body(inner_reactive)
  reactive_exprs <- as.list(reactive_body)[-1]

  for (reactive_expr in reactive_exprs) {
    repro_code <- repro_chunk(reactive_expr, repro_code = repro_code, env = module_env)
  }

  repro_code
}
