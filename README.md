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
```r
devtools::install_github("Santatr/dataVizPkg")
```



## Example usage


* #### To visualize the data.frane provided by {dataVizPkg} package:
```r
print(dataVizPkg::data)
```
```c
# A tibble: 1,338 × 7
     age sex      bmi children smoker region    charges
   <dbl> <chr>  <dbl>    <dbl> <chr>  <chr>       <dbl>
 1    19 female  27.9        0 yes    southwest  16885.
 2    18 male    33.8        1 no     southeast   1726.
 3    28 male    33          3 no     southeast   4449.
 4    33 male    22.7        0 no     northwest  21984.
 5    32 male    28.9        0 no     northwest   3867.
 6    31 female  25.7        0 no     southeast   3757.
 7    46 female  33.4        1 no     southeast   8241.
 8    37 female  27.7        3 no     northwest   7282.
 9    37 male    29.8        2 no     northeast   6406.
10    60 female  25.8        0 no     northwest  28923.
# … with 1,328 more rows
# ℹ Use `print(n = ...)` to see more rows
```


* #### To load the data.frame  
```r
insurance_data <- dataVizPkg::data
```



* #### To create and show plots for every columns in the data.frame `insurance_data
```r
dataVizPkg::make_report(insurance_data)
```
<a href="url"><img src="https://user-images.githubusercontent.com/38108435/212416244-dbe76c4d-1d58-4e6d-82de-246efd8468a8.png" height="350" width="550" ></a>
 
*NB*: if you use the rstudio console, it will not show all the plots that have been created, instead, it will show only the last plot. To view all plots, I suggest you to use rmarkdown or quarto for a better vizualization.




* #### To plot an histogram plot for the column `age`
```r
dataVizPkg::make_histogram_plot(insurance_data,"age")
```
<a href="url"><img src="https://user-images.githubusercontent.com/38108435/212420420-e366e085-eaed-416b-96c8-a276b945bd97.png" height="250" width="420" ></a>



 
* #### To plot a piechart plot for the column `region`
```r
dataVizPkg::make_piechart_plot(insurance_data,"region")
```
<a href="url"><img src="https://user-images.githubusercontent.com/38108435/212417270-cf121490-ce95-4e15-adce-eb8652daaeee.png" height="250" width="420" ></a>




* #### To plot a density plot for the column `charges`
```r
dataVizPkg::make_density_plot(insurance_data,"charges")
```
<a href="url"><img src="https://user-images.githubusercontent.com/38108435/212420504-ae481e56-258a-4028-af50-64e04acc4fdd.png" height="250" width="420" ></a>



* #### To count the unique elements in the column `age` in the `insurance_data` data.frame
```r
print(dataVizPkg::unique_count(insurance_data,"age"))
```
```r
[1] 47
```


