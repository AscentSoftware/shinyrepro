# Introduction to shinyrepro

``` r
library(shinyrepro)
```

## Using shinyrepro

There is a single exported function, `repro`, that will take a reactive
object, and returns a character vector of the code required to run
outside of Shiny to re-create the specified reactive.

## Best Practices

### Business Logic Package

So that developers can easily recreate outputs generated in Shiny
applications, add any business logic, such as ETL, data manipulation and
modelling, to a separate package. This will allow users to recreate the
tables and plots generated in the app without having to install all the
packages associated with the application.

## Limitations

### Secrets

If you are using secrets, such as environment variables, make sure that
they are defined within a reactive expression. If it is defined in the
module, or in the global environment, the secret will be written in the
assignment.

``` r
# Good
moduleServer(id, function(input, output, session) {
  my_reactive <- reactive({
    api_key <- Sys.getenv("MY_API_KEY")
    ...
  })
})

# Bad
moduleServer(id, function(input, output, session) {
  api_key <- Sys.getenv("MY_API_KEY")
  
  my_reactive <- reactive({
    ...
  })
})
```
