library(sf)
library(maps)
library(proj4shortcut)

prj <- geo_wgs84

##
# clip available cyan lakes for california

# state poly
state <- st_as_sf(map('state', region = 'california', plot = F, fill = T), crs = prj) %>% 
  st_buffer(0)

# import whole state meris, clip by cali
merisdat <- st_read('Z:/MarcusBeck/GIS/CyAN/NDH_MERIS_OLCI_lakes_03_2018.shp') %>% 
  st_transform(crs = prj)
merisdat_ca <- st_intersection(merisdat, state)

save(merisdat_ca, file = 'data/merisdat_ca.RData', compress = 'xz')
