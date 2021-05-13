
flowering <- function(){
  dt <- list.files(patt="*AllFlowering.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill() %>%
    unique()
  dt[,c('Location', 'Genotype', 'Plant_Sex')] %<>% mutate_all(as.factor)
  return(dt)
}

repeatpollination <- function(){
  dt <- list.files(patt="*RepeatPollinations.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill() %>%
    unique()
  return(dt)
}

status <- function(){
  dt <- list.files(patt="*PlantStatus.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill() %>%
    unique()
  return(dt)
}

contamination <- function(){
  dt <- list.files(patt="*Contamination.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill()  %>%
    unique()
  return(dt)
}


crosses <- function(){
  dt <- list.files(patt="*BananaData.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill() %>%
    unique() %>%
    dplyr::rename(
      "FemaleGenotype" = 'Mother',
      "MaleGenotype" = 'Father'
    )
  dt[,grep("Date", names(dt))] %<>% mutate_all(as.Date, origin = "1970-01-01")
  return(dt)
}

arusha_crosses2015 <- function(){
  dt <- read_csv("data/Last_6_months_tisssue_culture_data.csv")  %>%
    unique()
  dt[c("contamination","badseeds",grep("^days", names(dt), value = T))] <- NULL
  colnames(dt) <- c("Location","Crossnumber","FemaleGenotype","MaleGenotype",
                    "First_Pollination_Date","Bunch_Harvest_Date",
                    "Seed_Extraction_Date", "Total_Seeds",
                    "Good_Seeds","Number_of_Embryo_Rescued",
                    "Embryo_Rescue_Date", "Germination_Date",
                    "Number_of_Embryo_Germinating")
  return(dt)
}

banana <- function(){
  dt <- plyr::rbind.fill(crosses(), arusha_crosses2015()) %>%
    dplyr::select(
      Location, Crossnumber, everything()
    )
  dt[,c("Location","Crossnumber", "FemaleGenotype","MaleGenotype")] %<>% mutate_all(as.factor)
  colnames(dt) <- gsub("_"," ", names(dt))
  return(dt)
}

plantlets <- function(){
  dt <- list.files(patt="*PlantletsData.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill() %>%
    unique() %>%
    dplyr::rename(
      "FemaleGenotype" = 'Mother',
      "MaleGenotype" = 'Father'
    ) %>%
    dplyr::filter(!is.na(Location))
  dt[,c("Location","Crossnumber", "FemaleGenotype","MaleGenotype")] %<>% mutate_all(as.factor)
  dt[,grep("Date", names(dt))] %<>% mutate_all(as.Date, origin = "1970-01-01")
  dt[,grep("Number", names(dt))] %<>% mutate_all(as.integer)
  return(dt)
}

