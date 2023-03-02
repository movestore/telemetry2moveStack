library('move')
library("ctmm")

# input: telemetry.list - output: movestack

rFunction <- function(data, projection=c("current", "geographic")){
  result <- move(data) 
  if(projection=="geographic"){
    result <-  spTransform(result, CRSobj=CRS("+proj=longlat +ellps=WGS84"))
  }
  return(result)
}

