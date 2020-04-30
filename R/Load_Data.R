#This R script is used for load data into R
library(tidyverse)
library(data.table)

column_names <-c("start_time", "match_id", "stage", "map_type", "map_name", "player", "team", "stat_name", "hero", "stat_amount")     

#load data for season 2018
p18s1 = fread("raw_data/phs_2018/phs_2018_stage_1.csv")
p18s2 = fread("raw_data/phs_2018/phs_2018_stage_2.csv")
p18s3 = fread("raw_data/phs_2018/phs_2018_stage_3.csv")
p18s4 = fread("raw_data/phs_2018/phs_2018_stage_4.csv")
p18pf = fread("raw_data/phs_2018/phs_2018_playoffs.csv")

#load data for season 2019
p19s1 = fread("raw_data/phs_2019/phs_2019_stage_1.csv", header = FALSE, skip = 1)
setnames(p19s1, column_names)
p19s2 = fread("raw_data/phs_2019/phs_2019_stage_2.csv")
p19s3 = fread("raw_data/phs_2019/phs_2019_stage_3.csv")
p19s4 = fread("raw_data/phs_2019/phs_2019_stage_4.csv")
p19pf = fread("raw_data/phs_2019/phs_2019_playoffs.csv")

#load data for season 2020
p20s1 = fread("raw_data/phs_2020/phs_2020_1.csv", header = FALSE, skip = 1)
setnames(p20s1, column_names)

#combine the small datasets into big dataset
phs = bind_rows(p18s1, p18s2, p18s3, p18s4, p18pf,
                p19s1, p19s2, p19s3, p19s4, p19pf,
                p20s1) %>% 
      mutate(
            season = substr(start_time, 6, 9)
          )

mapstat = fread("raw_data/match_map_stats/match_map_stats.csv") %>% 
          mutate(
            season = substr(round_start_time, 6, 9)
          )

save(phs, file = "data/phs.RData")
save(mapstat, file = 'data/mapstat.RData')

load("data/phs.RData")
load("data/mapstat.RData")
