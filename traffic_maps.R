#dplyr for performing data wrangling and data analysis, we make use of the dplyr package. ...
#ggplot2 this is the most popular visualization package that is created for R. ...
#tidyr is a package that we use for tidying the data. ...
#shiny shiny is an interactive web application that allows you to embed visualizations like graphs, plots, and charts.
#plotly This package extends on the JavaScript library which is mainly for building interactive quality graphs. 

############ load the required R packages ######################################
library(googleway) #for plotting Google Map and overlaying it with shapes and markers such as traffic data
library(htmlwidgets) #for creating standalone googlemap web pages
library(magick) #for animating images
library(tidyverse) #a collection of packages for data wrangling and string manipulation
library(webshot) #for taking screenshot of saved standalone googlemap web pages

############ setup working directory where maps will be saved ##################
setwd("YOUR/DESIRED/WORKING/DIRECTORY/HERE/")

dat_traffic <- Sys.Date()

if (file.exists(paste0(getwd(), "/", `dat_traffic`))){
  print("Directory already exists")
  
} else {
  
  dir.create(paste0(getwd(), "/", `dat_traffic`))
  print("Directory has now been Created")
  
}