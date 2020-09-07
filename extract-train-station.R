library(RJSONIO)

train <- fromJSON("https://raw.githubusercontent.com/adieuadieu/japan-train-data/master/data/raw-data.json")
tokyo <- train[[13]][["lines"]]

tokyo[[var]][["name"]][["en"]] # line names address
tokyo[[var]][["stations"]][[1]][["name"]][["en"]] # station names
tokyo[[var]][["stations"]][[2]][["name"]][["en"]] # station names
tokyo[[var]][["stations"]] # stations for indexing

# extract line info
line <- data.frame()
for(i in 1:80){
  temp <- rbind(tokyo[[1]][["name"]][["en"]])
  temp2 <- data.frame(temp)
  line <- rbind(line,temp2)
}
write.csv2(line, "line.csv")

stationlist.col1 <- data.frame()
for(i in 1:80){
  temp <- rbind(tokyo[[i]][["name"]][["en"]])
  temp2 <- data.frame(rep(temp,length(tokyo[[i]][["stations"]])))
  stationlist.col1 <- rbind(stationlist.col1,temp2)
}

stationlist.col2 <- data.frame()
for(i in 1:80){
  for(j in seq_along(tokyo[[i]][["stations"]])){
    temp <- rbind(tokyo[[i]][["stations"]][[j]][["name"]][["en"]])
    temp2 <- data.frame(temp)
    stationlist.col2 <- rbind(stationlist.col2,temp2)
    
  }}
stationlist <- cbind(stationlist.col1, stationlist.col2)
colnames(stationlist) <- c("line", "station")
stationlist <- #adding new station in Yamanote line
  rbind(stationlist, c("JR Yamanote Line","Takanawa Gateway"))
stationlist$comb <- paste0(stationlist$station," -- ",stationlist$line)
stationlist <- stationlist[order(stationlist$comb),]
comb <- data.frame("comb"=stationlist$comb)
write.csv2(comb, "comb.csv")
