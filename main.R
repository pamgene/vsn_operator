suppressPackageStartupMessages({
  library(tercen)
  library(dplyr)
  library(vsn)
})

# connect to tercen
ctx = tercenCtx()

# get data from tercen
data = ctx$as.matrix(fill = NA)

# perform vsn
norm_data <- justvsn(data)

# prepare the result for tercen
output_df = data.frame(
  norm = as.vector(norm_data),
  .ci  = rep(0:(ncol(norm_data)-1), each=nrow(norm_data)),
  .ri  = rep(seq.int(from=0,to=nrow(norm_data)-1), ncol(norm_data)))

# save it to tercen
output_df <- ctx$addNamespace(output_df )
ctx$save(output_df )
