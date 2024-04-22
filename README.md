# R package for calculating land surface temperature (LST) from Landsat 8 image

Gulam Mohiuddin (Gulam.Mohiuddin@hnee.de)

13 December 2021

## Package Objective
The objective of this package is to calculate LST using simple command line and omit the in between steps of putting quite a few equations and parameters.

## Input files stored in the /data folder
* Since the data need to be defined by the user, **/data** folder is ignored

## Output files stored in the /output folder
* Since the output folder need to be defined by the user, **/output** folder is also ignored

## Requirements
This project is developed using the following packages:
* R version 4.0.3
* `RStoolbox` 0.2.6
* `rgdal` 1.5-27
* `raster` 3.5-9

## Basic preparation code

install.packages(c("devtools","raster", "rgdal"))

library(devtools)

library(raster)

library(rgdal)

## Loading the 'lstmohi' package
install_github("mohigeo33/lstmohi")

library(lstmohi)

## Introducing the input
use the raster() function

define the band 10, band 5 and band 4 

## Example of code required to calculate LST
ls.ndvi(b5,b4)

ls.lst(b10,b5,b4)
