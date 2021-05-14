library(brapir)
#banana <- read_csv("../data/banana.csv")

# standardise genotypes as per musabase

banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% c("cv-Rose","ITC0712","ITC0712-Cv-Rose", "ITC0712 Cv Rose"),"ITC0712-Aacv_Rose", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% c("ITC0609","Pahang","Pisang Pahang","ITC0609 Pahang"),"ITC0609-Pahang", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% c("Calcutta 4","ITC0249","ITC0249 Calcutta 4"),"ITC0249-Calcutta 4", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% c("Borneo","ITC0253","ITC0253 Borneo"),"ITC0253-Borneo", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% c("ITC0766","Paliama"),"ITC0766-Paliama", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% c("ITC1460","Ijihu nkundu"),"ITC1460-Ijihu_nkundu", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% c("ITC1468","Kahuti"),"ITC1468-kahuti", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "ITC1355","ITC1355-Kazirakwe", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "ITC1354","ITC1354-Enzirabahima", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "TMB2x 9128-3","TMB2X9128-3", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "Tjau Lagada","ITC0090-Tjau_Lagada", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "Akondro mainty","ITC0281-Akondro_Mainty", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "Huti-Green","ITC1559-Huti_green_bell", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "Zebrina GF","ITC0966-Zebrina_GF", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "IITA 02145/1320","02145/1320", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "Huti-White","Huti-white", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "Guyod","ITC0299-guyod", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "Truncata","ITC0393-Truncata", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "Kwaro","ITC0943-Kwaro", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "Nshonowa","ITC1466-Nshonowa", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "Yenai","ITC0774-Yenai", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "Waimara","ITC0600-Waimara", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "Datil","ITC1252-Datil", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "Mlali","ITC1564-Mlali", banana$FemaleGenotype)
banana$FemaleGenotype = ifelse(banana$FemaleGenotype %in% "Nakitengwa","ITC0085-Nakitengwa", banana$FemaleGenotype)

banana$MaleGenotype = ifelse(banana$MaleGenotype %in% c("cv-Rose","ITC0712","ITC0712-Cv-Rose","ITC0712 Cv Rose"),"ITC0712-Aacv_Rose", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% c("ITC0609","Pahang","Pisang Pahang","ITC0609 Pahang"),"ITC0609-Pahang", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% c("Calcutta 4","ITC0249","ITC0249 Calcutta 4"),"ITC0249-Calcutta 4", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% c("Borneo","ITC0253","ITC0253 Borneo"),"ITC0253-Borneo", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% c("ITC0766","Paliama"),"ITC0766-Paliama", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% c("ITC1460","Ijihu nkundu"),"ITC1460-Ijihu_nkundu", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% c("ITC1468","Kahuti"),"ITC1468-kahuti", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "ITC1355","ITC1355-Kazirakwe", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "ITC1354","ITC1354-Enzirabahima", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "TMB2x 9128-3","TMB2X9128-3", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "Tjau Lagada","ITC0090-Tjau_Lagada", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "Akondro mainty","ITC0281-Akondro_Mainty", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "Huti-Green","ITC1559-Huti_green_bell", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "Zebrina GF","ITC0966-Zebrina_GF", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "IITA 02145/1320","02145/1320", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "Huti-White","Huti-white", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "Guyod","ITC0299-guyod", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "Truncata","ITC0393-Truncata", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "Kwaro","ITC0943-Kwaro", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "Nshonowa","ITC1466-Nshonowa", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "Yenai","ITC0774-Yenai", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "Waimara","ITC0600-Waimara", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "Datil","ITC1252-Datil", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "Mlali","ITC1564-Mlali", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% "Nakitengwa","ITC0085-Nakitengwa", banana$MaleGenotype)

banana$MaleGenotype = ifelse(banana$MaleGenotype %in% c("ITC1455-Mchare Mlelembo", "ITC.1455_Mshale Mlelembo","Mshale-Mlelembo", "Mshare Mlelembo"),"ITC1455-Mchare Mlelembo", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% c("Mchare Laini", "MchareLaini"),"Mchare Laini", banana$MaleGenotype)
banana$MaleGenotype = ifelse(banana$MaleGenotype %in% c("Kisukari Mchare","Kisukari-Mchare"),"Kisukari-Mchare", banana$MaleGenotype)


genotypes <- unique(c(banana$FemaleGenotype, banana$MaleGenotype))

# accessions
library(brapir)
con = brapi_db()$musabase

germplasm_list = list()
germplasm_attr <- list()

for (x in genotypes){
  tryCatch({
    
    # get id
    t <- brapi_get_germplasm(
      con = con, germplasmName = as.character(x)
    )
    
    # get attributes eg. ploidy level
    d <- brapi_get_germplasm_germplasmDbId_attributes(
            con, germplasmDbId = as.character(t$germplasmDbId)
          )
    germplasm_list[[x]] <- t
    germplasm_attr[[x]] <- d
    
  }, error=function(e){cat("Error: ", x)})
}


df <- do.call(plyr::rbind.fill,germplasm_list) %>%
  dplyr::select(germplasmDbId, germplasmName, synonyms)
df %<>% mutate_all(as.character)

# split synonyms
synonmys <- do.call(rbind, stringr::str_split(df$synonyms,";"))
prefix <- "germplasmName"
suffix <- seq(1:ncol(synonmys))
snames <- paste0(prefix, suffix, sep = "")
synonmys <- as.data.frame(synonmys)
colnames(synonmys) <- snames

germplasm_df <- cbind(df, synonmys) %>%
  tidyr::gather(id, germplasmName, starts_with("germplasmName"), na.rm=T)
germplasm_df$germplasmName <- trimws(germplasm_df$germplasmName)
germplasm_df <- unique(germplasm_df)
germplasm_df$id <- NULL
germplasm_df$synonyms <- NULL
germplasm_df %<>% mutate_all(as.character)



dt <- do.call(rbind.fill,germplasm_attr)%>%
  dplyr::select(germplasmDbId, attributeCode, value) %>%
  dplyr::filter(attributeCode == "ploidy_level")
dt %<>% mutate_all(as.character)

# merge all info
germplasm_info <- germplasm_df %>%
  dplyr::left_join(dt)
names(germplasm_info)[names(germplasm_info) == 'value'] <- 'ploidy'
germplasm_info$germplasmPUI <- paste0('<a  target=_blank href=', paste0("https://musabase.org/stock/",germplasm_info$germplasmDbId,"/view"), '>', 'view','</a>' )
germplasm_info[,c("attributeCode","germplasmDbId")] <- NULL
germplasm_info <- unique(germplasm_info)
colnames(germplasm_info) <- c("germplasmName", "Ploidy","Link")
germplasm_info$Ploidy <- toupper(germplasm_info$Ploidy)
germplasm_info <- germplasm_info[!duplicated(germplasm_info),]
# germplasm_info$FemaleGenotype<- germplasm_info$germplasmName
# germplasm_info$MaleGenotype<- germplasm_info$germplasmName
# germplasm_info$Female_Ploidy <- germplasm_info$Ploidy
# germplasm_info$Male_Ploidy <- germplasm_info$Ploidy
# germplasm_info$Female_Link <- germplasm_info$Link
# germplasm_info$Male_Link <- germplasm_info$Link
# 
# ITC1460-Ijihu_Inkundu
# 
# 
# germplasm_info[,c("germplasmName","Ploidy","Link")] <- NULL
x <- germplasm_info[duplicated(germplasm_info$Link),] %>%
  dplyr::group_by(Link) %>%
  dplyr::mutate(n=n()) %>%
  ungroup()
z = spread(x, key = germplasmName, value = n )

write_csv(z, file = 'germplasm_info.csv')
# 
