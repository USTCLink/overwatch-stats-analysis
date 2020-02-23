
#This script is used for fetch newest data for 2020 season
get_newest_data = function(){
  
Player18URL = "https://assets.blz-contentstack.com/v3/assets/blt321317473c90505c/bltc1b83b55692b42f4/5e4c1368de213a0dff736e29/phs_2018.zip"
Player19URL = "https://assets.blz-contentstack.com/v3/assets/blt321317473c90505c/blt034e0b484f2dae47/5e4c1369b6a7c40dd9c69e9f/phs_2019.zip"
Player20URL = "https://assets.blz-contentstack.com/v3/assets/blt321317473c90505c/bltee1ac9147bbc2e71/5e4eb44d8286c81bdae785c6/phs_2020.zip"
MapURL = "https://assets.blz-contentstack.com/v3/assets/blt321317473c90505c/blt992272f77a02c6dd/5e4c13676cf37d0df4b4a833/match_map_stats.zip"

# Download And Unzip Data
# download a zip file containing broadband data, save it to the raw_data directory
download.file(Player18URL, destfile="raw_data/phs_2018.zip")
# unzip the file
unzip("raw_data/phs_2018.zip", exdir = "raw_data/phs_2018",overwrite = TRUE)
#delete the zip file
file.remove("raw_data/phs_2018.zip")

#do the same step for the rest URLs
download.file(Player19URL, destfile="raw_data/phs_2019.zip")
unzip("raw_data/phs_2019.zip", exdir = "raw_data/phs_2019",overwrite = TRUE)
file.remove("raw_data/phs_2019.zip")

download.file(Player20URL, destfile="raw_data/phs_2020.zip")
unzip("raw_data/phs_2020.zip", exdir = "raw_data/phs_2020",overwrite = TRUE)
file.remove("raw_data/phs_2020.zip")

download.file(MapURL, destfile="raw_data/map.zip")
unzip("raw_data/map.zip", exdir = "raw_data/match_map_stats",overwrite = TRUE)
file.remove("raw_data/map.zip")

# save it in the data folder.
#save(data, file = "data/Map.RData")

}
get_newest_data()
