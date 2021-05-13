
source("data_prep/main_data.R", local = T)
source("data_prep/other_labels.R", local = T)


cleantable <- function(){
  
  # F.Polln
  first_pollination <- banana() %>%
    dplyr::select(Location, Crossnumber, FemaleGenotype, MaleGenotype, `First Pollination Date`) %>%
    .[complete.cases(.),]
  colnames(first_pollination) <- c("Location","Accession","FemaleGenotype","MaleGenotype","Date")
  first_pollination$Activity <- "First pollination"
  
  # Repeat Polln
  repeat_pollination <- repeatpollination() %>%
    dplyr::arrange(Crossnumber,desc(Repeat_Pollination_Date))
  repeat_pollination <- repeat_pollination[!duplicated(repeat_pollination$Crossnumber),]
  colnames(repeat_pollination) <- c("Accession","Date","Location")
  
  repeat_pollination <- repeat_pollination %>%
    dplyr::left_join(first_pollination %>% dplyr::select(Accession, FemaleGenotype, MaleGenotype))
  repeat_pollination$Activity <- 'Repeat pollination'
  
  # Harvest
  harvest <- banana() %>%
    dplyr::select(Location, Crossnumber, FemaleGenotype, MaleGenotype, `Bunch Harvest Date`) %>%
    .[complete.cases(.),]
  colnames(harvest)[c(2,5)] <- c("Accession","Date")
  harvest$Activity <- "Harvesting"
  
  # Extracted
  extracted <- banana() %>%
    dplyr::select(Location, Crossnumber, FemaleGenotype, MaleGenotype, `Seed Extraction Date`,`Total Seeds`)%>%
    .[complete.cases(.),]
  
  colnames(extracted)[c(2,5,6)] <- c("Accession","Date","Number")
  extracted$Activity <- "Seed extraction"
  
  # Rescue
  rescued <- banana() %>%
    dplyr::select(Location, Crossnumber, FemaleGenotype, MaleGenotype,  `Embryo Rescue Date`, `Number of Embryo Rescued`)%>%
    .[complete.cases(.),]
  colnames(rescued)[c(2,5,6)] <- c("Accession","Date", "Number")
  rescued$Activity <- "Embryo Rescue"
  
  # Germination
  germinated <- banana() %>%
    dplyr::select(Location, Crossnumber, FemaleGenotype, MaleGenotype,`Germination Date`,`Number of Embryo Germinating`)%>%
    .[complete.cases(.),]
  colnames(germinated)[c(2,5,6)] <- c("Accession","Date", "Number")
  germinated$Activity <- "Germination"
  
  # Subculture
  subcul <- subcultures() %>%
    dplyr::left_join(germinating_embryos() %>% dplyr::select(Crossnumber, PlantletID)) %>%
    dplyr::left_join(banana() %>% dplyr::select(Crossnumber, FemaleGenotype, MaleGenotype))
  subcul$Crossnumber <- NULL
  colnames(subcul)[c(2,4)] <- c("Accession","Date")
  subcul$Activity <- "Subculturing"
  
  # # Rooted
  rooted <- rooting() 
  colnames(rooted)[2:3] <- c("Accession","Date")
  rooted <- rooted %>%
    dplyr::left_join(subcul %>% dplyr::select(Accession, FemaleGenotype, MaleGenotype))
  rooted$Activity <- "Rooting"
  rooted <- rooted[complete.cases(rooted),]
  
  # weaning1
  weaning1 <- weaning1()
  colnames(weaning1)[2:3] <- c("Accession","Date")
  weaning1 <- weaning1 %>%
    dplyr::left_join(subcul %>% dplyr::select(Accession, FemaleGenotype, MaleGenotype))
  weaning1$Activity <- "Weaning 1/ Sent out"
  weaning1 <- weaning1[complete.cases(weaning1),]
  
  # weaning2
  weaning2 <- weaning2()
  colnames(weaning2)[2:3] <- c("Accession","Date")
  weaning2 <- weaning2 %>%
    dplyr::left_join(subcul %>% dplyr::select(Accession, FemaleGenotype, MaleGenotype))
  weaning2$Activity <- "Weaning 2"
  weaning2 <- weaning2[complete.cases(weaning2),]
  
  # Screenhse
  screen_housed <- screenhouse()
  colnames(screen_housed)[2:3] <- c("Accession","Date")
  screen_housed <- screen_housed %>%
    dplyr::left_join(subcul %>% dplyr::select(Accession, FemaleGenotype, MaleGenotype))
  screen_housed$Activity <- "Screenhouse"
  screen_housed <- screen_housed[complete.cases(screen_housed),]
  
  # Hardened
  hardened <- hardening()
  colnames(hardened)[2:3] <- c("Accession","Date")
  hardened <- hardened %>%
    dplyr::left_join(subcul %>% dplyr::select(Accession, FemaleGenotype, MaleGenotype))
  hardened$Activity <- "Hardening"
  hardened <- hardened[complete.cases(hardened),]
  
  # Openfield
  open_field <- openfield()
  colnames(open_field)[2:3] <- c("Accession","Date")
  open_field <- open_field %>%
    dplyr::left_join(subcul %>% dplyr::select(Accession, FemaleGenotype, MaleGenotype))
  open_field$Activity <- "Open-field"
  open_field <- open_field[complete.cases(open_field),]
  
  cleantable <- plyr::rbind.fill(first_pollination,repeat_pollination,harvest,extracted,rescued,germinated,
                                 subcul, rooted,weaning1, weaning2,screen_housed,hardened, open_field)
  cleantable$Date <- as.Date(cleantable$Date, origin="1970-01-01")
  return(cleantable)
}
