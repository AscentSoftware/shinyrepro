test_that("Reactive call chunk brings back code required to evaluate reactive", {
  summary_tbl <- shiny::reactive({
    aggregate(
      Sepal.Width ~ Species,
      data = iris,
      FUN = "median"
    )
  })

  reactive_call <- str2lang("summary_tbl()")
  class(reactive_call) <- c(".__reactive", class(reactive_call))

  repro_reactive <- shiny::isolate(repro_call_chunk(reactive_call))
  expect_s7_class(repro_reactive, Repro)

  fn_call <- "summary_tbl <- aggregate(Sepal.Width ~ Species, data = iris, FUN = \"median\")"
  expect_identical(repro_reactive@code, list(str2lang(fn_call)))
  expect_identical(repro_reactive@calls, fn_call)
})

test_that("Reactive call chunk can be evaluated when more than 1 call is in expression", {
  summary_tbl <- shiny::reactive({
    iris_filt <- subset(iris, Petal.Width > 1.3)
    iris_med <- aggregate(
      Sepal.Width ~ Species,
      data = iris,
      FUN = "median"
    )
    t(iris_med)
  })

  reactive_call <- str2lang("summary_tbl()")
  class(reactive_call) <- c(".__reactive", class(reactive_call))

  fn_call <- c(
    "summary_tbl <- local(",
    "  {",
    "    iris_filt <- subset(iris, Petal.Width > 1.3)",
    "    iris_med <- aggregate(Sepal.Width ~ Species, data = iris, FUN = \"median\")",
    "    t(iris_med)",
    "  }",
    ")"
  )

  repro_reactive <- shiny::isolate(repro_call_chunk(reactive_call))
  expect_identical(repro_reactive@calls, fn_call)
})
