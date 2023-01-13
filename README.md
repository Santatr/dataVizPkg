# dataVizPkg

#### Author: Rafidison Santatra Rakotondrasoa

## Description

It is an r package that will allow us to visualize a dataset. The available plots are histogram, pie chart and density plot. You can use those plots to visualize any column in your dataset. It also provides a single function to create and visualize every columns at once. 


## Installation

#### Run in your console the following command to install all the required libraries:
```r
install.packages("devtools")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("magrittr")
```

#### Run on your console the following command to execute the pipeline:
```devtools::install_github("Santatr/dataVizPkg")```



## Example usage


##### To visualize the data.frane provided by {dataVizPkg} package:
```r
print(dataVizPkg::data)
```

##### To load the data.frame  
```r
insurance_data <- dataVizPkg::data
```

##### To create and show plots for every columns in the data.frame `insurance_data
```r
dataVizPkg::make_report(insurance_data)
```

##### To plot a piechart plot for the column `region`
```r
dataVizPkg::make_piechart_plot(insurance_data,"region")
```

##### To plot a density plot for the column `charges`
```r
dataVizPkg::make_density_plot(insurance_data,"charges")
```

##### To plot an histogram plot for the column `age`
```r
dataVizPkg::make_histogram_plot(insurance_data,"age")
```

##### To count the unique elements in the column `age` in the `insurance_data`data.frame
```r
print(dataVizPkg::unique_count(insurance_data,"age"))
```

*NB*: if you use the rstudio console, it will not show all the plots that have been created, instead, it will show only the last plot. To view all plots, I suggest you to use rmarkdown or quarto for a better vizualization.


