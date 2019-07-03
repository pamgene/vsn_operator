library(tercen)
library(reshape2)
library(vsn)

ctx = tercenCtx()

data = select(ctx, .y, .ci, .ri )
data = reshape2::acast(data, .ri ~ .ci, value.var='.y', fun.aggregate=mean)
data[is.nan( data )] <- NA
norm_data <- justvsn(data)


output_df = data.frame(
  norm = as.vector(norm_data),
  .ci  = rep(0:(ncol(norm_data)-1), each=nrow(norm_data)),
  .ri  = rep(seq.int(from=0,to=nrow(norm_data)-1), ncol(norm_data)))

# save it to tercen

output_df <- ctx$addNamespace(output_df )
ctx$save(output_df )

