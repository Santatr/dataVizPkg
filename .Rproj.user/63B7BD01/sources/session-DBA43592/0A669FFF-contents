#' Count number of distinct elements in a specified data frame column
#' @param data A data frame.
#' @param col A column of the `data` data frame that you wish to select.
#' @importFrom dplyr select n_distinct
#' @export
#' @return A `int`
#' @details
#' This function allows compute the number of distinct elements in a data frame column. I doesn’t include NaN in the count.
#' See the examples below for its usage.
#' @examples
#' # Return the number of unique elements in the column age for the data frame data
#'
#' n <- unique_count(data, age)
unique_count <- function(data, col) {
  col<-rlang::enquo(col)

  if ((rlang::quo_text(col) %in% names(data))) {
    result <- data |>
      dplyr::select(!!col) |>
      dplyr::n_distinct()
  }else {
    paste("Error: there is no column named", rlang::quo_text(col), "in the data frame")
  }
}




# make_report <- function(data) {
#   if(ncol(data) > 150)
#     print(paste("Error: the expected number of columns in the data is 150 not", ncol(data)))
#   else {
#     for col in
#   }
# }



make_histogram_plot <- function(data, col) {
  # data -> [dataframe]
  # col -> [col_name]
  col<-rlang::enquo(col)

  data %>%
    ggplot(aes(x = !!col)) +
      geom_histogram(aes(y = ..density..), fill = "dodgerblue", color = "black", alpha = 0.5) +
      labs(title = paste("Histogram plot for", rlang::quo_text(col)), y = 'Frequency') +
      theme(text=element_text(family="Times"),
            plot.title = element_text(hjust = 0.5, size=20),
            axis.title.x = element_blank(),
            axis.title.y= element_text(size=15),
            axis.text.x = element_text(size=15),
            axis.text.y = element_text(size=15))
}




make_piechart_plot <- function(data, col) {
  col<-rlang::enquo(col)

  data_piechart <- data %>%
    group_by(!!col) %>%
    summarize(count = n()) %>%
    mutate(proportion = count / sum(count) * 100) %>%
    arrange(proportion) %>%
    mutate(ypos = cumsum(proportion) - 0.5 * proportion)

  data_piechart %>%
    ggplot() +
    aes(x = "", y = proportion, fill = !!col) +
    geom_col(color = "white", alpha = 0.5) +
    geom_label(aes(label = scales::percent(proportion / 100)),
               position = position_stack(vjust = 0.5),
               size = 4,
               show_guide = F) +
    coord_polar(theta = "y", start = 0) +
    theme_void() +
    labs(title = paste("Pie chart plot for", rlang::quo_text(col)), y = 'Density') +
    theme(text=element_text(family="Times"),
          plot.title = element_text(hjust = 0.5, size=20),
          axis.title.x = element_blank(),
          axis.title.y= element_blank(),
          axis.text.x = element_blank(),
          axis.text.y = element_text(size=15),
          legend.title = element_text(size=15),
          legend.text = element_text(size=15),
          legend.position = "right")
}




make_density_plot <- function(data, col) {
  col<-rlang::enquo(col)

  data %>%
    ggplot(aes(x = !!col)) +
    geom_density(fill = "dodgerblue", color = "black", alpha = 0.5) +
    labs(title = paste("Density plot for", rlang::quo_text(col)), y = 'Density') +
    theme(text=element_text(family="Times"),
          plot.title = element_text(hjust = 0.5, size=20),
          axis.title.x = element_blank(),
          axis.title.y= element_text(size=15),
          axis.text.x = element_text(size=15),
          axis.text.y = element_text(size=15))
}



# get_plot <- function(df , column1 , column2, plot_func){
#   column1<-rlang::enquo(column1)
#   column2<-rlang::enquo(column2)
#   if(rlang::quo_text(column2) %in% colnames(df)){
#     title = paste(as.character(substitute(plot_func))[3] , "plot for" ,rlang::quo_text(column1) , rlang::quo_text(column2))
#     print(title)
#     ggplot2::ggplot(data = df, mapping = ggplot2 :: aes(x = !!column1, y = !!column2)) +
#       plot_func()+
#       ggplot2::labs(title = title)+
#       theme_bw()}
#
#   else{
#     title = paste(as.character(substitute(plot_func))[3] , "plot for" ,rlang::quo_text(column1))
#     print(title)
#     plot <- ggplot2::ggplot(data = df, mapping = ggplot2 :: aes(x = !!column1)) +
#       plot_func()
#
#     plot+
#       ggplot2::labs(title = title)+
#       theme_bw()}
#
# }
