library(tidyverse)

objKillsCareerData = phs %>% filter(
        hero == "All Heroes",
        stat_name == "Objective Kills" 
      ) %>% 
      group_by(player) %>% 
      summarise(
        obj_career = sum(stat_amount)  
      ) %>% 
      filter(obj_career != Inf | obj_career != 0) %>% 
      arrange(desc(obj_career))




