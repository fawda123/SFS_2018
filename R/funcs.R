# https://github.com/ggobi/ggally/issues/250
# define new log10 functions
log10_diagonal <- function(data, mapping, ...) {
  ggally_densityDiag(data, mapping, ...) + scale_x_log10()
}
log10_points <- function(data, mapping, ...) {
  ggally_points(data, mapping, ...) + scale_x_log10() + scale_y_log10()
}
log10_cor <- function(data, mapping, ...) {
  # preprocess the data for the correlation calculations
  data[[deparse(mapping$x)]] <- log10(data[[deparse(mapping$x)]])
  data[[deparse(mapping$y)]] <- log10(data[[deparse(mapping$y)]])
  
  ggally_cor(data, mapping, ...) + # grids will not match. hide them
    theme(
      panel.grid.major = element_blank(), 
      panel.border = element_rect(color = "black", fill = NA)
    )
}