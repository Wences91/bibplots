#' point_indicators
#' 
#' @param indicators indicators data.frame
#' @param size size of value labels
#' @param vjust vertical justification of value labels
#' @export
#' @importFrom ggplot2 ggplot aes geom_point geom_text labs scale_y_discrete scale_color_gradient theme_minimal
#' 

point_indicators <- function(indicators, size=1, vjust=0.5){
  p <- ggplot2::ggplot()
  
  sapply(unique(names(indicators)), function(x){
    print(x)
    p <<- p + ggplot2::geom_point(ggplot2::aes(x=row.names(indicators), y=x, color=100*indicators[,x]/sum(indicators[,x])), size=100*indicators[,x]/sum(indicators[,x]), alpha=.8)
    p <<- p + ggplot2::geom_text(ggplot2::aes(x=row.names(indicators), y=x, label=as.character(indicators[,x])), size=size, vjust=vjust, color='grey30')
  })
  
  p <- p + ggplot2::labs(y='', x='') +
    ggplot2::scale_y_discrete(limits = rev(sort(unique(names(indicators))))) +
    ggplot2::scale_color_gradient('Legend', low='cornsilk', high='red', label=function(x) paste0(x,'%')) +
    ggplot2::theme_minimal()
  
  return(p)
}
