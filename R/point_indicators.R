#' point_indicators
#' 
#' @param indicators data.frame whith thre variables: 1 actors, 2 indicators and 3 values
#' @param size size of value labels
#' @param vjust vertical justification of value labels
#' @export
#' @importFrom ggplot2 ggplot geom_point geom_text labs scale_y_discrete scale_color_gradient theme_minimal
#' 

point_indicators <- function(indicators, size=1, vjust=0.5){
  p <- ggplot2::ggplot()
  
  sapply(unique(indicators[,2]), function(x){
    p <<- p + ggplot2::geom_point(data=indicators[which(indicators[,2]==x),], aes(x=indicators[which(indicators[,2]==x),1], y=indicators[which(indicators[,2]==x),2], color=100*indicators[which(indicators[,2]==x),3]/sum(indicators[which(indicators[,2]==x),3])), size=100*indicators[which(indicators[,2]==x),3]/sum(indicators[which(indicators[,2]==x),3]), alpha=.8)
    p <<- p + ggplot2::geom_text(data=indicators[which(indicators[,2]==x),], aes(x=indicators[which(indicators[,2]==x),1], y=indicators[which(indicators[,2]==x),2], label=as.character(indicators[which(indicators[,2]==x),3])), size=size, vjust=vjust, color='grey30')
  })
  
  p <- p + ggplot2::labs(y='', x='') +
    ggplot2::scale_y_discrete(limits = rev(sort(unique(indicators[,2])))) +
    ggplot2::scale_color_gradient('Legend', low='cornsilk', high='red', label=function(x) paste0(x,'%')) +
    ggplot2::theme_minimal()
  
  return(p)
}
