#INSTALL PACKGAGES
#install.packages('tidyr')
#install.packages('rvest')
#install.packages('reshape')
#install.packages('dplyr')

#LOAD PACKAGES
library(rvest)  #USED TO SCRAPE DATA FROM WEBSITE
library(tidyr)   #USED TO 
library(reshape) #USED TO TRANSPOSE COLUMNS AND ROWS
library(dplyr)
library(purrr)

#Specifying the url for desired website to be scraped
url <- 'https://www.offleaseonly.com/used-cars/type_used/location_orlando/page_1/'#original url
m_url <- 'https://www.offleaseonly.com/used-cars/type_used/location_orlando/page_%s/' #modified for function
rurl <- read_html(url) #read url

# SCRAPE DATA

#PREVENT GRABBING 100 PAGES OF DATA
y <-  rurl %>%
  html_nodes('.listing-results-summary') %>%
  html_text() %>%
  gsub("\\D","",.)
z = as.numeric(y) / 25 #DIVIDE RESULTS BY # PER PAGE

if (z > 5) { x <- 5} else {x <- z} #SET PAGE CAP

map_df(1:x, function(i) {
  
  # simple but effective progress indicator
  cat(".")
  
  pg <- read_html(sprintf(m_url, i))
  
  data.frame(VehicleName=html_text(html_nodes(pg,'.title')),
             VIN= html_text(html_nodes(pg,'.sub-title')),
             Mileage= gsub("\\D","",html_text(html_nodes(pg,'.mileage'))),
             OurPrice= gsub("\\D","",html_text(html_nodes(pg,'.our-price'))),
             #kbbprice=    gsub("\\D","",html_text(html_nodes(pg,'.kbb-price'))),
             stringsAsFactors=FALSE)
  
}) -> autos

dplyr::glimpse(autos)

