library('move')
library('lubridate')
library(ctmm)

# input: telemetry - output: movestack

rFunction = function(data) {
  timestamps(data) <- with_tz(timestamps(data), tzone = "UTC") # stork data set was giving an error. that why I included this for now
  mv <- move(data)
  result <- moveStack(mv, forceTz="UTC")
  return(result)
}
