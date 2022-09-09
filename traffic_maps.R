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
setwd("/Users/allanabala/Desktop/traffic-data")

dat_traffic <- Sys.Date()

if (file.exists(paste0(getwd(), "/", `dat_traffic`))){
  print("Directory already exists")
  
} else {
  
  dir.create(paste0(getwd(), "/", `dat_traffic`))
  print("Directory has now been Created")
  
}

##### create an object that will hold information on the date-time that maps are downloaded #####
dat_time <- Sys.time() %>% 
  ## Format on my local machine is: "2020-04-01 20:21:30"
  str_sub(start = 6) %>% 
  str_replace(pattern = ":",
              replacement = "-") %>% 
  
  str_replace(pattern = ":",
              replacement = "-") %>% 
  
  str_replace(pattern = " ",
              replacement = "_")

############ Google Maps Traffic Data Retrieval - kampala ######################
Kampala_traffic <- google_map(key = 'AIzaSyCZ4XXTQLx1q3qcADTzQY9IB08HFfquL-Q', 
                                   location = c(0.32144,
                                                32.58353),
                                   width = 1280,
                                   height = 980,
                                   zoom = 13) %>%
  add_traffic()

saveWidget(Kampala_traffic,
           "temp.html",
           selfcontained = FALSE)

webshot("temp.html", 
        vwidth = 1280,
        vheight = 980,
        file = paste0(`dat_traffic`, "/",
                      "Kampala ", dat_time,
                      ".png"),
        cliprect = "viewport",
        delay = 4)




