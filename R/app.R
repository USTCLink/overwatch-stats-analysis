library(shiny)
library(tidyverse)
library(DT)
library(ggplot2)
library(ggthemes)



#load("data/phs.RData")
#load("data/mapstat.RData")
StageName = c(
  "Overwatch League - Stage 1",                    
  "Overwatch League - Stage 1 - Title Matches",    
  "Overwatch League - Stage 2",                    
  "Overwatch League - Stage 2 Title Matches",      
  "Overwatch League - Stage 3",                    
  "Overwatch League - Stage 3 Title Matches",      
  "Overwatch League - Stage 4",                    
  "Overwatch League - Stage 4 Title Matches",      
  "Overwatch League Inaugural Season Championship",
  "Overwatch League Stage 1",                      
  "Overwatch League Stage 1 Title Matches",        
  "Overwatch League Stage 2",                      
  "Overwatch League Stage 2 Title Matches",        
  "Overwatch League Stage 3",                      
  "Overwatch League Stage 3 Title Matches",        
  "Overwatch League Stage 4",                      
  "Overwatch League 2019 Post-Season",             
  "OWL 2020 Regular Season" )

MapName = c(
  "Dorado",               
  "Temple of Anubis",     
  "Ilios",                 
  "Numbani",              
  "Eichenwalde",           
  "Junkertown",           
  "Oasis",                 
  "Horizon Lunar Colony", 
  "Lijiang Tower",         
  "Volskaya Industries",  
  "Nepal",                 
  "King's Row",           
  "Route 66",              
  "Hollywood",            
  "Hanamura",              
  "Watchpoint: Gibraltar",
  "Blizzard World",        
  "Rialto",               
  "Busan",                 
  "Paris",                
  "Havana" 
)

TeamName = c(
  "Los Angeles Valiant",   
  "San Francisco Shock",   
  "Los Angeles Gladiators",
  "Shanghai Dragons",      
  "Dallas Fuel",           
  "Seoul Dynasty",         
  "Florida Mayhem",        
  "London Spitfire",       
  "Houston Outlaws",      
  "Philadelphia Fusion",   
  "Boston Uprising",       
  "New York Excelsior",    
  "Hangzhou Spark",        
  "Toronto Defiant",       
  "Atlanta Reign",         
  "Chengdu Hunters",       
  "Guangzhou Charge",      
  "Paris Eternal",         
  "Washington Justice",    
  "Vancouver Titans" 
)

HeroName = c(
  "All Heroes",    "Genji",        
  "D.Va",          "Winston",      
  "Mercy",         "Tracer",       
  "Widowmaker",    "Zenyatta",     
  "Junkrat",       "McCree",       
  "Orisa",         "Lúcio",        
  "Soldier: 76",   "Sombra",       
  "Moira",         "Pharah",       
  "Bastion",       "Ana",          
  "Doomfist",      "Reaper",       
  "Zarya",         "Reinhardt",    
  "Roadhog",       "Hanzo",        
  "Mei",           "Torbjörn",     
  "Symmetra",      "Brigitte",     
  "Wrecking Ball", "Ashe",         
  "Baptiste",      "Sigma"
)



# Define UI for dataset viewer app ----
ui <- navbarPage("Overwatch Stats Analysis",
  
  tabPanel('Player Ranks',
           
  fluidRow(
    column(12, align="center",
      h1("Rankings per 10 minutes for Selected Statistics"),
    )
  ),


  
  fluidRow(
    column(4, align="center",
           selectInput("season", "Season",
                       choices = c("2018", "2019", "2020"))
           ),
    column(4, align="center",
           selectInput("stage", "Stage", 
                       choices = StageName)
           ),
    column(4, align="center",
           selectInput("hero", "Hero",
                       choices = HeroName),
    )
  ),
           
  fluidRow(
    column(6, align="center",
           checkboxGroupInput("team", "Team",
                               choices = TeamName,
                               selected = TeamName)
           ),
    column(6, align="center",
           checkboxGroupInput("map", "Map",
                              choices = MapName,
                              selected = MapName)
           )
  ),
  

  fluidRow(
    
    column(3, align="center",
    h4("Final Blows per 10 mins"),
    dataTableOutput("finalBlows"),
    ),
    column(3, align="center",
    h4("Eliminations per 10 mins"),
    dataTableOutput("Eliminations"),
    ),
    column(3, align="center",
    h4("Hero Damage per 10 mins"),
    dataTableOutput("heroDamage"),
    ),
    column(3, align="center",
    h4("Healing per 10 mins"),
    dataTableOutput("healing"),
    )
  ),
  
  
  fluidRow(
    column(12, align="center",
           actionButton("do", "Plot Them !")
    )
  ),
  
  fluidRow(
    
    column(3, align="center",
           plotOutput("finalBlowsPlot"),
    ),
    column(3, align="center",
           plotOutput("eliminationsPlot"),
    ),
    column(3, align="center",
           plotOutput("heroDamagePlot"),
    ),
    column(3, align="center",
           plotOutput("healingPlot"),
    )
  )
  
),
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------

tabPanel("History Record",
  
  
  fluidRow(
    column(12, align="center",
           h1("Search Match Result")
    ),
  ),
  
  
  fluidRow(
    column(3, align="center",
           selectInput("mapSeason", "Season",
                       choices = c("2018", "2019", "2020"))
    ),

    column(3, align="center",
             selectInput("mapTeam", "Team1",
                                choices = TeamName,
                                selected = "Seoul Dynasty")
    ),
    column(3, align="center",
           selectInput("oppoTeam", "Team2",
                         choices = TeamName,
                         selected = "New York Excelsior")
    ),
    column(3, align="center",
           selectInput("matchMap", "Match Map",
                       choices = MapName,
                       selected = "Hollywood")
    ),
  ),
  
  fluidRow(
    column(12, align="center",
           actionButton("search", "Search it !")
    )
  ),
  
  fluidRow(
    
    column(10, align="center",
           h3("History Match Result"),
           dataTableOutput("matchHistory"),
    ),
  )
),

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
  tabPanel("Career Ranks",

    fluidRow(
      column(12, align="center",
             h1("Career Total Ranks")
      ),
    ),
    
    fluidRow( 
      column(2, align="center",
             h4("Final Blows Career"),
             dataTableOutput("finalBlowsCareer"),
      ),
      column(2, align="center",
             h4("Eliminations Career"),
             dataTableOutput("EliminationsCareer"),
      ),
      column(2, align="center",
             h4("Hero Damage Career"),
             dataTableOutput("heroDamageCareer"),
      ),
      column(2, align="center",
             h4("Healing Career"),
             dataTableOutput("healingCareer"),
      ),
      column(2, align="center",
             h4("Deaths Career"),
             dataTableOutput("deathsCareer"),
      ),
      column(2, align="center",
             h4("Objective Kills Career"),
             dataTableOutput("objKillsCareer"),
      )
      
    ),
    
    fluidRow(
      column(12, align="center",
             actionButton("go", "Plot Them !")
      )
    ),
    
    fluidRow(
      
      column(2, align="center",
             plotOutput("finalBlowsCareerPlot"),
      ),
      column(2, align="center",
             plotOutput("eliminationsCareerPlot"),
      ),
      column(2, align="center",
             plotOutput("heroDamageCareerPlot"),
      ),
      column(2, align="center",
             plotOutput("healingCareerPlot"),
      ),
      column(2, align="center",
             plotOutput("deathsCareerPlot"),
      ),
      column(2, align="center",
             plotOutput("objkillsCareerPlot")
      )
    )
    
    
  
  )


#-----
)



#---------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------








# Define server logic to summarize and view selected dataset ----
server <- function(input, output) {

selectedData = reactive(
                phs %>% filter(season == input$season,
                               stage == input$stage,
                               map_name %in% input$map,
                               team %in% input$team,
                               hero == input$hero
                )
  
)


finalblowsData = reactive(
  selectedData() %>% filter(
    stat_name == "Final Blows" | stat_name == "Time Played"
  ) %>% 
    pivot_wider(
      names_from = stat_name,
      values_from = stat_amount
    )%>% 
    group_by(player) %>% 
    summarise(
      final_blows_per_10min = sum(`Final Blows`, na.rm = TRUE) / sum(`Time Played`, na.rm = TRUE)  * 600
    ) %>% 
    filter(final_blows_per_10min != Inf | final_blows_per_10min != 0) %>% 
    arrange(desc(final_blows_per_10min))
  
)
output$finalBlows = DT::renderDataTable({finalblowsData()},  options = list(pageLength = 10))


eliminationsData = reactive(
                  selectedData() %>% filter(
                                     stat_name == "Eliminations" | stat_name == "Time Played"
                    ) %>% 
                      pivot_wider(
                        names_from = stat_name,
                        values_from = stat_amount
                      )%>% 
                      group_by(player) %>% 
                      summarise(
                        elim_per_10min = sum(Eliminations, na.rm = TRUE) / sum(`Time Played`, na.rm = TRUE)  * 600
                      ) %>% 
                      filter(elim_per_10min != Inf | elim_per_10min != 0) %>% 
                      arrange(desc(elim_per_10min))
                      
)
output$Eliminations = DT::renderDataTable({eliminationsData()},options = list(pageLength = 10))

 


herodamageData = reactive(
  if (input$hero == "All Heroes"){
    selectedData() %>% filter(
      stat_name == "Hero Damage Done" | stat_name == "Time Played"
      ) %>% 
      pivot_wider(
        names_from = stat_name,
        values_from = stat_amount
      )%>% 
      group_by(player) %>% 
      summarise(
        hero_damage_per_10min = sum(`Hero Damage Done`, na.rm = TRUE) / sum(`Time Played`, na.rm = TRUE)  * 600
      ) %>% 
      filter(hero_damage_per_10min != Inf & hero_damage_per_10min != 0) %>% 
      arrange(desc(hero_damage_per_10min))
  }
  else{
  selectedData() %>% filter(
    stat_name == "All Damage Done" | stat_name == "Time Played"
  ) %>% 
    pivot_wider(
      names_from = stat_name,
      values_from = stat_amount
    )%>% 
    group_by(player) %>% 
    summarise(
      hero_damage_per_10min = sum(`All Damage Done`, na.rm = TRUE) / sum(`Time Played`, na.rm = TRUE)  * 600
    ) %>% 
    filter(hero_damage_per_10min != Inf & hero_damage_per_10min != 0) %>% 
    arrange(desc(hero_damage_per_10min))
  }
)

output$heroDamage = DT::renderDataTable({herodamageData()}, options = list(pageLength = 10))

healingData = reactive(
  selectedData() %>% filter(
    stat_name == "Healing Done" | stat_name == "Time Played"
  ) %>% 
    pivot_wider(
      names_from = stat_name,
      values_from = stat_amount
    )%>% 
    group_by(player) %>% 
    summarise(
      healing_per_10min = sum(`Healing Done`, na.rm = TRUE) / sum(`Time Played`, na.rm = TRUE)  * 600
    ) %>% 
    filter(healing_per_10min != Inf & healing_per_10min != 0) %>% 
    arrange(desc(healing_per_10min))
  
)
output$healing = DT::renderDataTable({healingData()},options = list(pageLength = 10))


v = reactiveValues(doPlot = FALSE)

observeEvent(input$do,{
  v$doPlot = input$do
})

output$finalBlowsPlot = renderPlot({
  if (v$doPlot == FALSE) return()
  
  head(finalblowsData(),5) %>% 
    ggplot(mapping=aes(x=reorder(player,-final_blows_per_10min), y=final_blows_per_10min)) +
    geom_bar(stat='identity')+
    xlab("")+
    ggtitle('Final Blows Top5')+
    theme_economist_white()+
    theme(
      plot.title = element_text(hjust = 0.5)
    )
})

output$eliminationsPlot = renderPlot({
  if (v$doPlot == FALSE) return()
  
  head(eliminationsData(),5) %>% 
    ggplot(mapping=aes(x=reorder(player,-elim_per_10min), y=elim_per_10min)) +
    geom_bar(stat='identity')+
    xlab("")+
    ggtitle('Eliminations Top5')+
    theme_economist_white()+
    theme(
      plot.title = element_text(hjust = 0.5)
    )
})

output$heroDamagePlot = renderPlot({
  if (v$doPlot == FALSE) return()
  
  head(herodamageData(),5) %>% 
    ggplot(mapping=aes(x=reorder(player,-hero_damage_per_10min), y=hero_damage_per_10min)) +
    geom_bar(stat='identity')+
    xlab("")+
    ggtitle('Hero Damage Top5')+
    theme_economist_white()+
    theme(
      plot.title = element_text(hjust = 0.5)
    )
})

output$healingPlot = renderPlot({
  if (v$doPlot == FALSE) return()
  
  head(healingData(),5) %>% 
    ggplot(mapping=aes(x=reorder(player,-healing_per_10min), y=healing_per_10min)) +
    geom_bar(stat='identity')+
    xlab("")+
    ggtitle('Healing Top5')+
    theme_economist_white()+
    theme(
      plot.title = element_text(hjust = 0.5)
    )
})

#-------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------

s = reactiveValues(doSearch = FALSE)

observeEvent(input$search,{
  s$doSearcj = input$search
})


selectedMapData = reactive(
  mapstat %>% filter(season == input$mapSeason,
                 map_name == input$matchMap,
                 team_one_name == input$mapTeam | team_one_name == input$oppoTeam,
                 team_two_name == input$oppoTeam | team_two_name == input$mapTeam
  )
  
)


matchHistoryData = reactive(
  selectedMapData() %>% 
    select(-round_start_time,- round_end_time, -match_id, -team_one_name, -team_two_name, -season, -map_name )
  
)
output$matchHistory = DT::renderDataTable({matchHistoryData()},  options = list(pageLength = 10))




#-------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------

   EliminationsCareerData = reactive(
      phs %>% filter(
       hero == "All Heroes",
       stat_name == "Eliminations" 
       ) %>% 
       group_by(player) %>% 
       summarise(
         elim_career = sum(stat_amount,na.rm = TRUE)  
       ) %>% 
       filter(elim_career != Inf | elim_career != 0) %>% 
       arrange(desc(elim_career))
     
   )
   output$EliminationsCareer = DT::renderDataTable({EliminationsCareerData()},options = list(pageLength = 10))
   
   
   finalBlowsCareerData = reactive(
     phs %>% filter(
       hero == "All Heroes",
       stat_name == "Final Blows" 
     ) %>% 
       group_by(player) %>% 
       summarise(
         final_blows_career = sum(stat_amount,na.rm = TRUE)  
       ) %>% 
       filter(final_blows_career != Inf | final_blows_career != 0) %>% 
       arrange(desc(final_blows_career))
     
   )
   output$finalBlowsCareer = DT::renderDataTable({finalBlowsCareerData()},options = list(pageLength = 10))
   
   
   heroDamageCareerData = reactive(
     phs %>% filter(
       hero == "All Heroes",
       stat_name == "Hero Damage Done" 
     ) %>% 
       group_by(player) %>% 
       summarise(
         hero_damage_career = sum(stat_amount,na.rm = TRUE)  
       ) %>% 
       filter(hero_damage_career != Inf | hero_damage_career != 0) %>% 
       arrange(desc(hero_damage_career))
     
   )
   output$heroDamageCareer = DT::renderDataTable({heroDamageCareerData()},options = list(pageLength = 10))
         
   healingCareerData = reactive(
     phs %>% filter(
       hero == "All Heroes",
       stat_name == "Healing Done" 
     ) %>% 
       group_by(player) %>% 
       summarise(
         healing_career = sum(stat_amount,na.rm = TRUE)  
       ) %>% 
       filter(healing_career != Inf | healing_career != 0) %>% 
       arrange(desc(healing_career))
     
   )
   output$healingCareer = DT::renderDataTable({healingCareerData()},options = list(pageLength = 10))
         
  
   deathsCareerData = reactive(
     phs %>% filter(
       hero == "All Heroes",
       stat_name == "Deaths" 
     ) %>% 
       group_by(player) %>% 
       summarise(
         death_career = sum(stat_amount,na.rm = TRUE)  
       ) %>% 
       filter(death_career != Inf | death_career != 0) %>% 
       arrange(desc(death_career))
     
   )
   output$deathsCareer = DT::renderDataTable({deathsCareerData()},options = list(pageLength = 10))
   
   objKillsCareerData = reactive(
     phs %>% filter(
       hero == "All Heroes",
       stat_name == "Objective Kills" 
     ) %>% 
       group_by(player) %>% 
       summarise(
         obj_career = sum(stat_amount,na.rm = TRUE)  
       ) %>% 
       filter(obj_career != Inf | obj_career != 0) %>% 
       arrange(desc(obj_career))
   )
   output$objKillsCareer = DT::renderDataTable({objKillsCareerData()}, options = list(pageLength = 10))
 
   
  u = reactiveValues(doCareerPlot = FALSE)
  
  observeEvent(input$go,{
    u$doCareerPlot = input$go
  })
  
  output$finalBlowsCareerPlot = renderPlot({
    if (u$doCareerPlot == FALSE) return()
    
    head(finalBlowsCareerData(),5) %>% 
      ggplot(mapping=aes(x=reorder(player,-final_blows_career), y=final_blows_career)) +
      geom_bar(stat='identity')+
      xlab("")+
      ggtitle('Final Blows Career')+
      theme_wsj()+
      theme(
        plot.title = element_text(hjust = 0.5)
      )
  })
  
  output$eliminationsCareerPlot = renderPlot({
    if (u$doCareerPlot == FALSE) return()
    
    head(EliminationsCareerData(),5) %>% 
      ggplot(mapping=aes(x=reorder(player,-elim_career), y=elim_career)) +
      geom_bar(stat='identity')+
      xlab("")+
      ggtitle('Eliminations Career')+
      theme_wsj()+
      theme(
        plot.title = element_text(hjust = 0.5)
      )
  })
  
  output$heroDamageCareerPlot = renderPlot({
    if (u$doCareerPlot == FALSE) return()
    
    head(heroDamageCareerData(),5) %>% 
      ggplot(mapping=aes(x=reorder(player,-hero_damage_career), y=hero_damage_career)) +
      geom_bar(stat='identity')+
      xlab("")+
      ggtitle('Hero Damage Career')+
      theme_wsj()+
      theme(
        plot.title = element_text(hjust = 0.5)
      )
  })
  
  output$healingCareerPlot = renderPlot({
    if (u$doCareerPlot == FALSE) return()
    
    head(healingCareerData(),5) %>% 
      ggplot(mapping=aes(x=reorder(player,-healing_career), y=healing_career)) +
      geom_bar(stat='identity')+
      xlab("")+
      ggtitle('Healing Career')+
      theme_wsj()+
      theme(
        plot.title = element_text(hjust = 0.5)
      )
  }) 
  
  output$deathsCareerPlot = renderPlot({
    if (u$doCareerPlot == FALSE) return()
    
    head(deathsCareerData(),5) %>% 
      ggplot(mapping=aes(x=reorder(player,-death_career), y=death_career)) +
      geom_bar(stat='identity')+
      xlab("")+
      ggtitle('Deaths Career')+
      theme_wsj()+
      theme(
        plot.title = element_text(hjust = 0.5)
      )
  }) 
  
  output$deathsCareerPlot = renderPlot({
    if (u$doCareerPlot == FALSE) return()
    
    head(deathsCareerData(),5) %>% 
      ggplot(mapping=aes(x=reorder(player,-death_career), y=death_career)) +
      geom_bar(stat='identity')+
      xlab("")+
      ggtitle('Deaths Career')+
      theme_wsj()+
      theme(
        plot.title = element_text(hjust = 0.5)
      )
  }) 
  
  output$objkillsCareerPlot = renderPlot({
    if (u$doCareerPlot == FALSE) return()
    
    head(objKillsCareerData(),5) %>% 
      ggplot(mapping=aes(x=reorder(player,-obj_career), y=obj_career)) +
      geom_bar(stat='identity')+
      xlab("")+
      ggtitle('Obj Kills Career')+
      theme_wsj()+
      theme(
        plot.title = element_text(hjust = 0.5)
      )
  }) 

   
#--------------End of Server Part   
}








# Create Shiny app ----
shinyApp(ui, server)
