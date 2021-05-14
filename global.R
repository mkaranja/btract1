suppressPackageStartupMessages(library(shiny))
suppressPackageStartupMessages(library(shinydashboard))
suppressPackageStartupMessages(library(shinyWidgets))
suppressPackageStartupMessages(library(shinycssloaders))
suppressPackageStartupMessages(library(shinyFeedback))
suppressPackageStartupMessages(library(shinyBS))
suppressPackageStartupMessages(library(jsonlite))
suppressPackageStartupMessages(library(shinyjs))
suppressPackageStartupMessages(library(DT))
suppressPackageStartupMessages(library(data.table))
suppressPackageStartupMessages(library(summarytools))
suppressPackageStartupMessages(library(qrencoder))
suppressPackageStartupMessages(library(plotly))
suppressPackageStartupMessages(library(highcharter))
suppressPackageStartupMessages(library(collapsibleTree))
suppressPackageStartupMessages(library(magrittr))
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(plyr))
suppressPackageStartupMessages(library(brapi))
suppressPackageStartupMessages(library(WriteXLS))
suppressPackageStartupMessages(library(dataframes2xls))
suppressPackageStartupMessages(library(stringr))
suppressPackageStartupMessages(library(vroom))
suppressPackageStartupMessages(library(plotly))
suppressPackageStartupMessages(library(Hmisc))

                               
source("data_prep/main_data.R", local = T)
#source("data_prep/scheduler.R", local = T) 
enableBookmarking(store = "url")

# Tabs
tab_files <- list.files(path = "tabs/ui", full.names = T, recursive = T)
suppressMessages(lapply(tab_files, source))

appCSS <- "
#loading-content {
position: absolute;
background: #000000;
opacity: 0.9;
z-index: 100;
left: 0;
right: 0;
height: 100%;
text-align: center;
color: #FFFFFF;
}
"

BTracTFooter <- function() tagList(
  fluidRow(
    HTML('<footer align="center">
         <div class="row">
         <div class="col-sm-2 col-sm-offset-3">
         <a href = "http://breedingbetterbananas.org/">
         <img src = "betterbananaLogo.png", height="65", width="120">
         </a>
         </div>
         <div class="col-sm-2">
         <a href = "http://www.iita.org/">
         <img src = "iita.png", height="65", width="120">
         </a>
         </div>
         <div class="col-sm-2">
         <a href = "https://btiscience.org/">
         <img src="bti.png", height="70", width="120">
         </a>
         </div>
         </div>
         </footer>')
    )
)
