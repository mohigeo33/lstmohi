# Author: Gulam Mohiuddin
# Date : 13 December 2021
# Version 1.0.0
# Licence GPL v3
#' Get Normalized Difference Vegetation Index (NDVI)
#'
#' @param b5 band 5/ Near Infra-Red (NIR) band of Landsat 8 image
#' @param b4 band 4/ Near Infra-Red (NIR) band of Landsat 8 image
#'
#' @return ndvi
#' @export
#'
#' @examples
#' ls.ndvi(b5,b4)
ls.ndvi <- function(b5,b4){
  ndvi <-((b5-b4)/(b5+b4))
  return(ndvi)
}

#' Get land surface temperature (LST)
#'
#' @param b10 band 10/ thermal band of Landsat 8 image
#' @param b5 band 5/ Near Infra-Red (NIR) band of Landsat 8 image
#' @param b4 band 4/ Near Infra-Red (NIR) band of Landsat 8 image
#'
#' @return LST
#' @export
#'
#' @examples
#' ls.lst(b10,b5,b4)
ls.lst <- function(b10,b5,b4){
  ndvi <-((b5-b4)/(b5+b4))
  pv <- (ndvi - minValue(ndvi))/(maxValue(ndvi) - minValue(ndvi))
  e <- (0.004*pv) + 0.986
  L <- (0.0003342 * b10) + 0.10000
  TB <- (1321.0789 / log(774.8853 / L + 1)) - 273.15
  LST <- TB / (1 + (10.8 * TB / 14388) * log(e))
  return(LST)
}

#' Get emissivity
#'
#' @param b5 Raster object
#' @param b4 Raster object
#'
#' @return emissivity
#' @export
#'
#' @examples
#' ls.e(b5,b4)
ls.e <- function(b5,b4){
  ndvi <-((b5-b4)/(b5+b4))
  pv <- (ndvi - minValue(ndvi))/(maxValue(ndvi) - minValue(ndvi))
  e <- (0.004*pv) + 0.986
  return(e)
}

#' Get radiance
#'
#' @param b10 band 10/ thermal band of Landsat 8 image
#'
#' @return radiance
#' @export
#'
#' @examples
#' ls.l(b10)
ls.l <- function(b10){
  L <- (0.0003342 * b10) + 0.10000
  return(L)
}

#' Get Top of atmosphere brightness temperature (TB) in degree celcius
#'
#' @param b10 band 10/ thermal band of Landsat 8 image
#'
#' @return TB
#' @export
#'
#' @examples
#' ls.tb(b10)
ls.tb <- function(b10){
  L <- (0.0003342 * b10) + 0.10000
  TB <- (1321.0789 / log(774.8853 / L + 1)) - 273.15
  return(TB)
}

#' Get land surface temperature (LST) in Kelvin
#'
#' @param b10 band 10/ thermal band of Landsat 8 image
#' @param b5 band 5/ Near Infra-Red (NIR) band of Landsat 8 image
#' @param b4 band 4/ Near Infra-Red (NIR) band of Landsat 8 image
#'
#' @return LST in Kelvin
#' @export
#'
#' @examples
#' ls.lst(b5,b4,b10)
ls.lstK <- function(b10,b5,b4){
  ndvi <-((b5-b4)/(b5+b4))
  pv <- (ndvi - minValue(ndvi))/(maxValue(ndvi) - minValue(ndvi))
  e <- (0.004*pv) + 0.986
  L <- (0.0003342 * b10) + 0.10000
  TB <- (1321.0789 / log(774.8853 / L + 1))
  LSTK <- TB / (1 + (10.8 * TB / 14388) * log(e))
  return(LSTK)
}
