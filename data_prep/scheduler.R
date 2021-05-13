source("data_prep/cleantable.R", local = T)

dt <- cleantable()%>%
  arrange(Date = as.Date(Date, "%d-%m-%Y"))
df = dt[!duplicated(dt[,1:4]),]
df = df[!duplicated(df$Accession),] %>%
  setDT()
df = df[Activity != "Flowering"][,-c(5:6)]

# days elapsed
df$`Days Elapsed` = Sys.Date()-df$Date

# mean number of days between activities
dff <- banana() %>%
  dplyr::left_join(
    repeatpollination()
    )
colnames(dff) <- gsub("_"," ", names(dff))

dff$`Days to Germination` <- lubridate::date(dff$`Germination Date`) - lubridate::date(dff$`Embryo Rescue Date`)
dff$`Days to Embryo Rescue` = lubridate::date(dff$`Embryo Rescue Date`) - lubridate::date(dff$`Seed Extraction Date`)
dff$`Days to Repeat Pollination` <- as.Date(dff$`Repeat Pollination Date`, "1970-01-01") - 
  as.Date(dff$`First Pollination Date`, "1970-01-01")

mean_days_to_repeatpollination = mean(as.integer(na.omit(dff$`Days to Repeat Pollination`))) %>% floor() # to repeat
mean_days_to_maturity = mean(as.integer(na.omit(dff$`Days to Maturity`))) %>% floor() # to harvest
mean_days_in_ripening = mean(as.integer(na.omit(dff$`Days in ripening shed`))) %>% floor() # to extraction
mean_days_to_embryo_rescue = mean(as.integer(na.omit(dff$`Days to Embryo Rescue`))) %>% floor() # to rescue
mean_days_to_germination = mean(as.integer(na.omit(dff$`Days to Germination`))) %>% floor() # to germination


df$status = ifelse(df$Activity=='First pollination' & df$`Days Elapsed` > (mean_days_to_repeatpollination+5), "Overdue",
                ifelse(df$Activity=='First pollination' & df$`Days Elapsed` >= mean_days_to_repeatpollination-5 & df$`Days Elapsed` <= mean_days_to_repeatpollination+5, "Ready",
                    ifelse(df$Activity=='First pollination' & df$`Days Elapsed` >= mean_days_to_repeatpollination-10 & df$`Days Elapsed` <= mean_days_to_repeatpollination-5, "Approaching",
                           ifelse(df$Activity=='First pollination' & df$`Days Elapsed` < mean_days_to_repeatpollination-10, "Wait",
                
              ifelse(df$Activity=='Repeat pollination' & df$`Days Elapsed` > (mean_days_to_maturity+10),"Overdue",
                     ifelse(df$Activity=='Repeat pollination' & df$`Days Elapsed` <= mean_days_to_maturity-10 & df$`Days Elapsed` >= mean_days_to_maturity+10, "Ready",
                            ifelse(df$Activity=='Repeat pollination' & df$`Days Elapsed` >= mean_days_to_maturity-30 & df$`Days Elapsed` <= mean_days_to_maturity-10, "Approaching",
                                   ifelse(df$Activity=='Repeat pollination' & df$`Days Elapsed` < mean_days_to_maturity-30, "Wait",
                                                              
                           # harvested
                  ifelse(df$Activity=='Harvested bunches' & df$`Days Elapsed` > mean_days_in_ripening+3,"Overdue",
                      ifelse(df$Activity=='Harvested bunches' & df$`Days Elapsed` >= mean_days_in_ripening-3 & df$`Days Elapsed` <= mean_days_in_ripening+3, "Ready",
                        ifelse(df$Activity=='Harvested bunches' & df$`Days Elapsed` >= mean_days_in_ripening-5 & df$`Days Elapsed` <= mean_days_in_ripening-3, "Approaching",
                               ifelse(df$Activity=='Harvested bunches' & df$`Days Elapsed` < mean_days_in_ripening-5, "Wait",
                        
                               # Seed extraction 
                           ifelse(df$Activity=='Seed extraction'  & df$`Total Seeds` > 0 & df$`Days Elapsed` > (mean_days_to_embryo_rescue+3), "Overdue",
                                ifelse(df$Activity=='Seed extraction'  & df$`Total Seeds` > 0 & df$`Days Elapsed` >= mean_days_to_embryo_rescue-2 & df$`Days Elapsed` <= mean_days_to_embryo_rescue+3, "Ready",
                                      ifelse(df$Activity=='Seed extraction'  & df$`Total Seeds` > 0 & df$`Days Elapsed` >= 3 & df$`Days Elapsed` <= mean_days_to_embryo_rescue-3, "Approaching",
                                             ifelse(df$Activity=='Seed extraction'  & df$`Total Seeds` > 0 & df$`Days Elapsed` < 3, "Wait",
                                         
                                              # EMbryo rescue
                                            ifelse(df$Activity=='Embryo Rescue' & df$`Number of Embryo Rescued` >0 & df$`Days Elapsed` > 56, "Overdue",
                                               ifelse(df$Activity=='Embryo Rescue'  & df$`Number of Embryo Rescued` >0 & df$`Days Elapsed` >= 50 & df$`Days Elapsed` <= 56, "Ready",
                                                  ifelse(df$Activity=='Embryo Rescue'  & df$`Number of Embryo Rescued` >0 & df$`Days Elapsed` >= 45 & df$`Days Elapsed` <= 49, "Approaching",
                                                         ifelse(df$Activity=='Embryo Rescue'  & df$`Number of Embryo Rescued` >0 & df$`Days Elapsed` < 45, "Wait",NA
                                                       
                                  ))))))))))))))))))))
schedulerdata = df[!is.na(df$status),]
schedulerdata = schedulerdata[status !='Wait']
schedulerdata$NextActivity = ifelse(schedulerdata$Activity=="First pollination","Repeat pollination",
                                   ifelse(schedulerdata$Activity=="Repeat pollination","Bunch Harvesting",
                                          ifelse(schedulerdata$Activity=="Harvested bunches","Seed Extraction",
                                                 ifelse(schedulerdata$Activity=="Seed extraction","Embryo Rescue",
                                                        ifelse(schedulerdata$Activity=="Embryo Rescue","Germination",'')))))
schedulerdata = schedulerdata[,c("Location", "Accession","Date", "Activity","Days Elapsed", "status", "NextActivity")]
colnames(schedulerdata)[4] = "CurrentActivity"

