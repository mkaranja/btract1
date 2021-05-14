
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

banana <- readr::read_csv("data/banana.csv")
banana[,c("Location", "FemaleGenotype","MaleGenotype","FemalePloidy", "MalePloidy")] %<>% 
  dplyr::mutate_all(as.factor)
     
banana[,c("Cycle", "Number of Repeats","Total Seeds", "Good Seeds", "Number of Embryo Rescued", "Number of Embryo Germinating")] %<>%             
  dplyr::mutate_all(as.integer)

banana[, grep("Date", names(banana), value = T)] %<>%
  dplyr::mutate_all(anytime::anydate)
banana$TrialName <- NULL
banana <- banana %>%
  dplyr::select(Location, Crossnumber, starts_with("Female"), Cycle, starts_with("Male"), everything())

plantlets <- function(){
  dt <- list.files(patt="*PlantletsData.csv$", recursive = TRUE) %>%
    lapply(read_csv) %>%
    rbind.fill() %>%
    unique() %>%
    dplyr::filter(!is.na(Location))
  dt <- dt %>%
    dplyr::left_join(
      banana %>%
        dplyr::select(Crossnumber, FemaleGenotype,MaleGenotype)
    )
  dt[,c("Mother", "Father")] <- NULL
    
  dt[,c("Location","Crossnumber", "FemaleGenotype","MaleGenotype")] %<>% mutate_all(as.factor)
  dt[,grep("Date", names(dt))] %<>% mutate_all(as.Date, origin = "1970-01-01")
  dt[,grep("Number", names(dt))] %<>% mutate_all(as.integer)
  return(dt)
}

