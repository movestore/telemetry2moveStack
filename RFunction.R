library('move')
library("ctmm")

# input: telemetry.list - output: movestack
rFunction <- function(data, projection=c("current", "geographic")){
  # result <- move(data) # with next cran release of move this function should work retraining all attributes
  result <- moveStack(lapply(data, function(tl) {
    df <- data.frame(tl)
    df <- df[,!names(df)%in%c("x","y","t")]
    mv <- move(
      x = tl$x, y = tl$y,
      time = as.POSIXct(tl$t, origin = "1970-01-01", tz = tl@info$timezone),
      data = df,
      proj = if (is.null(tl@info$projection)) {
        as.character(NA)
      } else {
        tl@info$projection
      },
      animal = if (is.null(tl@info$identity)) {
        "unnamed"
      } else {
        as.character(tl@info$identity)
      }
    )
    if ("VAR.xy" %in% names(tl)) {
      mv$error.loc.mts <- sqrt(tl$VAR.xy)
    }
    return(mv)
  }), forceTz = data[[1]]@info$timezone)
  # return(stk)
  
  if(projection=="geographic"){
    result <-  spTransform(result, CRSobj=CRS("+proj=longlat +ellps=WGS84"))
  }
  return(result)
}

