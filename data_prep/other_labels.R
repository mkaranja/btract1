
germinating_embryos <- function(){
  dt <- list.files(patt="*GerminatingIDs.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill() %>%
    unique() %>%
    dplyr::select(Location, PlantletID,Crossnumber, Germination_Date)
  
  dt$Location <- as.factor(dt$Location)
  dt$Germination_Date <- lubridate::ymd(as.Date(dt$Germination_Date, origin="1970-01-01"))
  return(dt)
}

subcultures <- function(){
  dt <- list.files(patt="*Subcultures.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill()  %>%
    unique()  %>%
    dplyr::select(Location, PlantletID, everything())  %>%
    dplyr::rename(Number = Copies) %>%
    dplyr::filter(!is.na(Number)) %>%
    .[complete.cases(.),]
  
  dt$Subculture_Date <- as.Date(dt$Subculture_Date, "1970-01-01")
  dt$Number <- as.integer(dt$Number)
  dt$Location <- as.factor(dt$Location)
  return(dt)
}

rooting <- function(){
  dt <- list.files(patt="*Rooting.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill()  %>%
    unique()  %>%
    dplyr::select(Location, PlantletID, everything()) %>%
    dplyr::rename(Number = Number_Rooting) %>%
    dplyr::filter(!is.na(Number)) %>%
    .[complete.cases(.),]
  
  dt$Location <- as.factor(dt$Location)
  dt$Date_of_Rooting <- as.Date(dt$Date_of_Rooting, "1970-01-01")
  dt$Number <- as.integer(dt$Number)
  return(dt)
}

weaning1 <- function(){
  dt <- list.files(patt="*Weaning1.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill() %>%
    unique() %>%
    dplyr::select(Location, PlantletID, everything())  %>%
    dplyr::rename(Number = Number_Sent_Out) %>%
    dplyr::filter(!is.na(Number)) %>%
    .[complete.cases(.),]
  
  dt$Location <- as.factor(dt$Location)
  dt$Sending_Out_Date <- as.Date(dt$Sending_Out_Date, origin="1970-01-01")
  dt$Number <- as.integer(dt$Number)
  return(dt)
}

weaning2 <- function(){
  dt <- list.files(patt="*Weaning2.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill()  %>%
    unique() %>%
    dplyr::select(Location, PlantletID, everything())%>%
    dplyr::filter(!is.na(Number)) %>%
    .[complete.cases(.),]
  
  dt$Location <- as.factor(dt$Location)
  dt$Weaning_2_Date <- as.Date(dt$Weaning_2_Date, origin="1970-01-01")
  dt$Number <- as.integer(dt$Number)
  return(dt)
}
screenhouse <- function(){
  dt <- list.files(patt="*Screenhouse.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill() %>%
    unique() %>%
    dplyr::select(Location, PlantletID, everything())%>%
    dplyr::filter(!is.na(Number)) %>%
    .[complete.cases(.),]
  
  dt$Location <- as.factor(dt$Location)
  dt$Screenhouse_Transfer_Date <- as.Date(dt$Screenhouse_Transfer_Date, origin="1970-01-01")
  dt$Number <- as.integer(dt$Number)
  return(dt)
}

hardening <- function(){
  dt <- list.files(patt="*Hardening.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill()  %>%
    unique() %>%
    dplyr::select(Location, PlantletID, everything())%>%
    dplyr::filter(!is.na(Number)) %>%
    .[complete.cases(.),]
  
  dt$Location <- as.factor(dt$Location)
  dt$Hardening_Date <- as.Date(dt$Hardening_Date, origin="1970-01-01")
  dt$Number <- as.integer(dt$Number)
  return(dt)
}

openfield <- function(){
  dt <- list.files(patt="*Openfield.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill()  %>%
    unique() %>%
    dplyr::select(Location, PlantletID, everything())%>%
    dplyr::filter(!is.na(Number)) %>%
    .[complete.cases(.),]
  
  dt$Location <- as.factor(dt$Location)
  dt$Openfield_Transfer_Date <- as.Date(dt$Openfield_Transfer_Date, origin="1970-01-01")
  dt$Number <- as.integer(dt$Number)
  return(dt)
}
