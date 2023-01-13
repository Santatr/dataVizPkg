#' Count number of distinct elements in a specified column of a data frame
#' @param data A data frame.
#' @param col (type = "character"), a column of the data.frame `data` that you wish to select.
#' @importFrom dplyr n_distinct
#' @export
#' @return An `integer`
#' @details
#' This function computes the number of distinct elements in a data frame column.
#' See the examples below for its usage.
#' @examples
#' # Return the number of unique elements in the column `age` of the data frame `data`.
#' n <- unique_count(data, "age")
unique_count <- function(data = NULL, col = NULL) {
  col <- as.character(col)
  if(is.data.frame(data)) {
    if ((col %in% names(data))) {

      result <- dplyr::n_distinct(data[,col])

    }else {
      paste("Error: there is no column named `", col, "` in the data.frame")
    }
  }else {
    paste("Error: the given input is not a data.frame")
  }
}


#' create and show a plot for every column in the data frame (with some condition: see details)
#' @param data A data frame.
#' @export
#' @return Plots
#' @details
#' if the column has less or exactly 5 number of distinct elements, it will show a pie chart
#' if the column has less or exactly between 6 and 50 number of distinct elements, it will show an histogram
#' otherwise it will show a density plot
#' it raises an error if the total number of column in the data frame is greater than 100, or if the given attributes `data` is not of a class "data.frame"
#' See the examples below for its usage.
#' @examples
#' # create and show a plot for every column in the data frame `data`.
#' make_report(data)
make_report <- function(data = NULL) {
  if(is.data.frame(data)) {
    if(ncol(data) <= 100) {

      lapply(names(data), function(col) {

        count_element <- unique_count(data,col)
        if(count_element <= 5){
          make_piechart_plot(data,col)
        }else if(count_element > 5 & count_element <= 50){
          make_histogram_plot(data,col)
        }else {
          make_density_plot(data,col)
        }

      })

    }else {
      paste("Error: the data.frame exceeds the maximum number of columns allowed ( max = 100, found =", ncol(data),")")
    }
  }else {
    paste("Error: the given input is not a data.frame")
  }
}


#' Plot an histogram for a specified data frame column
#' @param data A data frame.
#' @param col (type "character"), a column of the data frame `data` that you wish to select.
#' @importFrom ggplot2 ggplot geom_bar aes labs theme
#' @export
#' @return A plot
#' @details
#' This function plots an histogram. It returns an error message if the given column name `col`is not correct.
#' See the examples below for its usage.
#' @examples
#' # Return and show an histogram plot of the column "age" of the data frame "data"
#' plot <- make_histogram_plot(data, "age")
#' plot
make_histogram_plot <- function(data = NULL, col = NULL) {
  col_sym <- as.symbol(col)
  col_enquo <- rlang::enquo(col_sym)

  if(is.data.frame(data)) {
    if ((col %in% names(data))) {

      ggplot2::ggplot(data, ggplot2::aes(x = !!col_enquo)) +
        ggplot2::geom_bar(fill = "dodgerblue", color = "black", alpha = 0.5) +
        ggplot2::labs(title = paste("Histogram plot for", col), y = 'Frequency') +
        ggplot2::theme(text = element_text(family="Times"),
                       plot.title = element_text(hjust = 0.5, size=20),
                       axis.title.x = element_blank(),
                       axis.title.y= element_text(size=15),
                       axis.text.x = element_text(size=15),
                       axis.text.y = element_text(size=15))

    }else {
      paste("Error: there is no column named `", col, "` in the data.frame ` data `")
    }
  }else {
    paste("Error: the given input is not a data.frame")
  }
}


#' Plot pie chart plot for a specified data frame column
#' @param data A data frame.
#' @param col (type "character"), a column of the data frame `data` that you wish to select.
#' @importFrom ggplot2 ggplot geom_col aes labs theme geom_label coord_polar theme_void
#' @importFrom dplyr group_by summarize mutate arrange
#' @export
#' @return A plot
#' @details
#' This function plots a pie chart. It returns an error message if the given column name `col`is not correct.
#' See the examples below for its usage.
#' @examples
#' # Return and show a pie chart of the column "region" of the data frame "data".
#' plot <- make_piechart_plot(data, "region")
#' plot
make_piechart_plot <- function(data = NULL, col = NULL) {
  col_sym <- as.symbol(col)
  col_enquo <- rlang::enquo(col_sym)

  if(is.data.frame(data)) {
    if ((col %in% names(data))) {

      data_piechart <- data %>%
        dplyr::group_by_at(col) %>%
        dplyr::summarize(count = n()) %>%
        dplyr::mutate(proportion = count / sum(count) * 100) %>%
        dplyr::arrange(proportion) %>%
        dplyr::mutate(ypos = cumsum(proportion) - 0.5 * proportion)

      data_piechart %>%
        ggplot2::ggplot() +
        ggplot2::aes(x = "", y = proportion, fill = !!col_enquo) +
        ggplot2::geom_col(color = "white", alpha = 0.5) +
        ggplot2::geom_label(ggplot2::aes(label = scales::percent(proportion / 100)),
                            position = position_stack(vjust = 0.5),
                            size = 4,
                            show_guide = F) +
        ggplot2::coord_polar(theta = "y", start = 0) +
        ggplot2::theme_void() +
        ggplot2::labs(title = paste("Pie chart plot for", col)) +
        ggplot2::theme(text=element_text(family="Times"),
                       plot.title = element_text(hjust = 0.5, size=20),
                       axis.title.x = element_blank(),
                       axis.title.y= element_blank(),
                       axis.text.x = element_blank(),
                       axis.text.y = element_text(size=15),
                       legend.title = element_text(size=15),
                       legend.text = element_text(size=15),
                       legend.position = "right")

    }else {
      paste("Error: there is no column named `", col, "` in the data.frame ` data `")
    }
  }else {
    paste("Error: the given input is not a data.frame")
  }
}


#' Plot pie chart plot for a specified data frame column
#' @param data A data frame.
#' @param col (type "character"), a column of the data frame `data` that you wish to select.
#' @importFrom ggplot2 ggplot geom_density aes labs theme
#' @export
#' @return A plot
#' @details
#' This function plots a density plot. It returns an error message if the given column name `col`is not correct.
#' See the examples below for its usage.
#' @examples
#' # Return and show a density plot of the column "charges" of the data frame "data".
#' plot <- make_density_plot(data, "charges")
#' plot
make_density_plot <- function(data = NULL, col = NULL) {
  col_sym <- as.symbol(col)
  col_enquo <- rlang::enquo(col_sym)

  if(is.data.frame(data)) {
    if ((col %in% names(data))) {

      ggplot2::ggplot(data, ggplot2::aes(x = !!col_enquo)) +
        #geom_histogram(aes(y = ..density..), fill = "dodgerblue", color = "black", alpha = 0.5) +
        ggplot2::geom_density(color = "dodgerblue", fill = "dodgerblue", alpha = 0.5) +
        ggplot2::labs(title = paste("Density plot for", col), y = 'Density') +
        ggplot2::theme(text=element_text(family="Times"),
                       plot.title = element_text(hjust = 0.5, size=20),
                       axis.title.x = element_blank(),
                       axis.title.y= element_text(size=15),
                       axis.text.x = element_text(size=15),
                       axis.text.y = element_text(size=15))

    }else {
      paste("Error: there is no column named `", col, "` in the data.frame ` data `")
    }
  }else {
    paste("Error: the given input is not a data.frame")
  }
}
