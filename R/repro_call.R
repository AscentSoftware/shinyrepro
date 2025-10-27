#' Reproducing Code for Call Object
#'
#' @noRd
S7::method(repro_chunk, S7::class_call) <- function(x, ..., repro_code = Repro(), env = rlang::caller_env()) {
  call_env <- env
  call_name <- structure(list(), class = rlang::call_name(x) %||% "NULL")

  if (is_reactive_val_call(x, env)) {
    call_name <- structure(list(), class = ".__reactval")
    # Reactive object created within the module
  } else if (is_reactive_call(x, env)) {
    call_name <- structure(list(), class = ".__reactive")
    # Reactive object sent to the module
  } else if (is_reactive_call(x, parent.env(env))) {
    call_name <- structure(list(), class = ".__reactive")
    call_env <- parent.env(env)
  }

  repro_call_chunk(
    call_name = call_name,
    x = x,
    ...,
    env = call_env,
    repro_code = repro_code
  )
}
