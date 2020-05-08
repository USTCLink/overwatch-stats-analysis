# overwatch-stats-analysis

This repository is Chenhao Fang's Final Project for STAT479 Data Science in R course. It's a Shiny app that can analyze the Overwatch League data by Blizzard.

## What is Overwatch

Overwatch is a team-based multiplayer first-person shooter developed and published by Blizzard Entertainment. Described as a "hero shooter", Overwatch assigns players into two teams of six, with each player selecting from a roster of over 30 characters, known as "heroes", each with a unique style of play that is divided into three general roles that fit their purpose. Players on a team work together to secure and defend control points on a map or escort a payload across the map in a limited amount of time. Players gain cosmetic rewards that do not affect gameplay, such as character skins and victory poses, as they play the game. The game was initially launched with only casual play, but a competitive ranked mode, various 'arcade' game modes, and a player-customizable server browser were added after release. Additionally, Blizzard has added new characters, maps, and game modes post-release, all free of charge, with the only additional cost to players being optional loot boxes to earn cosmetic items. It was released for PlayStation 4, Xbox One, and Windows in May 2016, and Nintendo Switch in October 2019.

![](https://github.com/USTCLink/overwatch-stats-analysis/blob/master/img/overwatch.jpg)

## What is Overwatch League

The Overwatch League (OWL) is a professional esports league for the video game Overwatch, produced by its developer Blizzard Entertainment. The Overwatch League follows the model of other traditional North American professional sporting leagues by using a set of permanent, city-based teams backed by separate ownership groups

![](https://i.redd.it/4iknmozkew121.jpg)

## Why this Project

Now Blizzard open the dataset about the Overwatch League. Fans are welcome to play with the data. The dataset has many small datasets in it, which contains the player data and the map data. They are also providing a list of approved player/hero statistics aggregated at the map level, as well as basic match/map/score statistics across attack/defense splits, for the league to date. These files and dashboards will be updated regularly throughout the 2020 season.

As far as I know, there is always demands for professional coaches to analyze the player data. Usually, a professional e-sport team will hire two or three data analyist to help the head coach analyze the played data. However, in e-sport, the most important thing is that you do understand the game and the logic behind it. Therefore, some of the data analyists are pre-proplayers and does not know how to program. Thus, they will spend a lot of time to use simple methods to analyze the data, like Microsoft Excels.

The goal for my project is to write a Shiny app that can analyze the data in many different ways. Using the software is much more convienient than use the traditional EXCEL way. Also, the visualization is much more clear. This project will help the professional team and coaches prepare their strategy and tactic for the match. 

## About this software

```
- Load_Data.R
- Fetch_New_Data.R
- app.R
- raw_data - phs_2018
           - phs_2019
           - phs_2020
           - match_map_stats
- data - phs
       - mapstat
```


The _raw_data_ folder is used for maintain raw data from blizzard offcial website. If you want to analyze the data with other tools, you can use the data in this folder.

The _data_ folder contains the rData file, that can be easily shared and load into R.

The _R_ folder contains the source code of this software. The _Fetch_New_Data.R_ file is used to check the updates The _Load_Data.R_ file is used to clean the data and combine the raw data together, and load into R.

The _app.R_ file is the core of this software, which is the Shiny app. It contains the UI and server parts. 

In total, it's approximately 1k lines of R code.

## Library Used

Basically, I used almost all the library learnt in the STAT 479: Data Science in R class. Since the raw data is not tidy at all, their usage is quite frequent to make the data tidy and become the format that the software needs.

```
library(shiny)
library(tidyverse)
library(DT)
library(ggplot2)
library(ggthemes)
library(shinythemes)
```

## How to use this software

Type the follwing command in your terminal:

`git clone https://github.com/USTCLink/overwatch-stats-analysis.git`

Then:

`cd overwatch-stas-analysis/R`

Finally:

`source('app.R')`






