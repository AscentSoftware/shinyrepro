#' Reproduce Call Chunk
#'
#' @description
#' A short description...
#'
#' @param call_name The function name of `x` converted into an S7 object
#' @param x \code{\link[shiny]{reactive}} object to make reproducible
#' @param env The environment `x` is defined in. By default it is the environment of where \code{repro} is called
#' @param ... Additional arguments to pass to other methods
#'
#' @details
#' Whilst a default is provided to \code{env}, it is unlikely that this is the same environment `x` is defined
#' in. This is more of a placeholder for sending the correct environment to
#'
#' @return
#' A \code{\link{Repro}} object containing all the necessary code and packages to recreate
#' the provided expression when evaluated.
#'
#' @noRd
repro_call_chunk <- S7::new_generic(
  name = "repro_call_chunk",
  dispatch_args = "call_name",
  fun = function(call_name, x, ..., env = rlang::caller_env()) S7::S7_dispatch()
)
