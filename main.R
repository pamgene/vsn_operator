suppressPackageStartupMessages({
  library(tercen)
  library(dplyr)
  library(vsn)
})

ctx = tercenCtx()

df <- ctx$as.matrix(fill = NA) %>%
  t() %>%
  justvsn() %>%
  as_tibble()

colnames(df) <- seq_len(ncol(df)) - 1L

df %>%
  mutate(.ci = seq_len(nrow(.)) - 1L) %>%
  tidyr::pivot_longer(cols = !matches(".ri|.ci"), names_to = ".ri", values_to = "norm") %>%
  arrange(.ci, .ri) %>%
  mutate(.ri = as.integer(.ri)) %>%
  relocate(norm) %>%
  ctx$addNamespace() %>%
  ctx$save()
