# Reproduce Code Chunk

Evaluate a chunk of code to extract Shiny inputs and reactives,
replacing the inputs with the values selected by the user, and the
reactives with the code bodies used to generate them.

## Usage

``` r
repro_chunk(x, repro_code = Repro(), env = rlang::caller_env())
```

## Arguments

- x:

  [`reactive`](https://rdrr.io/pkg/shiny/man/reactive.html) object to
  make reproducible

- repro_code:

  A `Repro` object to

- env:

  The environment `x` is defined in. By default it is the environment of
  where `repro` is called

## Value

A
[`Repro`](https://jubilant-dollop-5lekoky.pages.github.io/reference/repro_s7.md)
object containing all the necessary code and packages to recreate the
provided expression when evaluated.

## Details

Whilst a default is provided to `env`, it is unlikely that this is the
same environment `x` is defined in. This allows the top-level `repro`
call
