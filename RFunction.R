library('move')
library("ctmm")

# input: telemetry.list - output: movestack

rFunction <- function(data){
  # incase we would need to do some checking for the input
  # if(class(data)== "telemetry"){
  #   data <- list(data)
  # } else if((unique(unlist(lapply(data, class))) == "telemetry")){data <- data}
  move(data) # when input is a list of telemetry obj, output is a movestack. if input is a telemetry obj, output is move
}

