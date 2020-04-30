#shiny!
# This file follows Lesson 1
# https://shiny.rstudio.com/tutorial/written-tutorial/lesson1/



# install.packages("shiny")
library(shiny)
runExample("01_hello")

# need a file called app.R.
# app.R has three components:
# 1) a user interface object:  ui
# 2) a server function:  server
# 3) a call to the shinyApp function:  shinyApp(ui = ui, server = server)

# The user interface (ui) object controls 
#     the layout and appearance of your app. 
# The server function contains the instructions 
#     that your computer needs to build your app. 
# Finally the shinyApp function creates Shiny 
#     app objects from an explicit UI/server pair.


# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Hello Shiny!"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
}

shinyApp(ui = ui, server = server)

# the logic flow....
#  when you change the input data, 
#    the server function gets new input.
#    it runs, makes a plot. which ui renders.


# Every Shiny app has the same structure: 
#   an app.R file that contains ui and server. 
#   You can create a Shiny app by making a new 
#   directory and saving an app.R file inside it. 
#   It is recommended that each app will 
#   live in its own unique directory.
# 
# You can run a Shiny app by giving the 
#   name of its directory to the function runApp. 
#   For example if your Shiny app is in a 
#   directory called my_app, run it with the 
#   following code:
# 

library(shiny)
runApp("my_app")


# let's do it!  
# 1) make a folder called App-1.
# 2) make a file in it called app.R.  
# 3) copy and paste the code above.
# 4) Launch your app by running runApp("App-1"). make sure it runs!
# 5) then, click escape and make some changes to your app:
#   - Change the title from â€œHello Shiny!â€ to â€œHello World!â€.
#   - Set the minimum value of the slider bar to 5.
#   - Change the histogram border color from "white" to "orange".





# some more examples:

runExample("01_hello")      # a histogram
runExample("02_text")       # tables and data frames
runExample("03_reactivity") # a reactive expression
runExample("04_mpg")        # global variables
runExample("05_sliders")    # slider bars
runExample("06_tabsets")    # tabbed panels
runExample("07_widgets")    # help text and submit buttons
runExample("08_html")       # Shiny app built from HTML
runExample("09_upload")     # file upload wizard
runExample("10_download")   # file download wizard
runExample("11_timer")      # an automated timer


# Lesson 2
# https://shiny.rstudio.com/tutorial/written-tutorial/lesson2/
# focuses on the text styles and images in the ui.


ui <- fluidPage(
  titlePanel("My Shiny App"),
  sidebarLayout(
    sidebarPanel("sidebar!"),
    mainPanel(
      p("p creates a paragraph of text."),
      p("A new p() command starts a new paragraph. Supply a style attribute to change the format of the entire paragraph.", style = "font-family: 'times'; font-si16pt"),
      strong("strong() makes bold text."),
      em("em() creates italicized (i.e, emphasized) text."),
      br(),
      code("code displays your text similar to computer code"),
      div("div creates segments of text with a similar style. This division of text is all blue because I passed the argument 'style = color:blue' to div", style = "color:blue"),
      br(),
      p("span does the same thing as div, but it works with",
        span("groups of words", style = "color:blue"),
        "that appear inside a paragraph.")
    )
  )
)
server <- function(input, output) {
  
}
shinyApp(ui = ui, server = server)

#  to add an image, use the function
# img(src = "rstudio.png", height = 140, width = 400)
# in mainPanel.  Note:  the image rstudio.png *must* be in folder named www







# Lesson 3
# https://shiny.rstudio.com/tutorial/written-tutorial/lesson3/
# give the user an input!
# widgets 
# To add a widget to your app, place a widget function (demo below)
#    in sidebarPanel or mainPanel in your ui object.


library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("Basic widgets"),
  
  fluidRow(
    
    column(3,
           h3("Buttons"),
           actionButton("action", "Action"),
           br(),
           br(), 
           submitButton("Submit")),
    
    column(3,
           h3("Single checkbox"),
           checkboxInput("checkbox", "Choice A", value = TRUE)),
    
    column(3, 
           checkboxGroupInput("checkGroup", 
                              h3("Checkbox group"), 
                              choices = list("Choice 1" = 1, 
                                             "Choice 2" = 2, 
                                             "Choice 3" = 3),
                              selected = 1)),
    
    column(3, 
           dateInput("date", 
                     h3("Date input"), 
                     value = "2014-01-01"))   
  ),
  
  fluidRow(
    
    column(3,
           dateRangeInput("dates", h3("Date range"))),
    
    column(3,
           fileInput("file", h3("File input"))),
    
    column(3, 
           h3("Help text"),
           helpText("Note: help text isn't a true widget,", 
                    "but it provides an easy way to add text to",
                    "accompany other widgets.")),
    
    column(3, 
           numericInput("num", 
                        h3("Numeric input"), 
                        value = 1))   
  ),
  
  fluidRow(
    
    column(3,
           radioButtons("radio", h3("Radio buttons"),
                        choices = list("Choice 1" = 1, "Choice 2" = 2,
                                       "Choice 3" = 3),selected = 1)),
    
    column(3,
           selectInput("select", h3("Select box"), 
                       choices = list("Choice 1" = 1, "Choice 2" = 2,
                                      "Choice 3" = 3), selected = 1)),
    
    column(3, 
           sliderInput("slider1", h3("Sliders"),
                       min = 0, max = 100, value = 50),
           sliderInput("slider2", "",
                       min = 0, max = 100, value = c(25, 75))
    ),
    
    column(3, 
           textInput("text", h3("Text input"), 
                     value = "Enter text..."))   
  )
  
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)

#   What does that widget send to server???
#     you can experiment with your own code, or see this 
#     widget gallery:
# https://shiny.rstudio.com/gallery/widget-gallery.html




# Lessson 4; process some inputs!
# https://shiny.rstudio.com/tutorial/written-tutorial/lesson4/
# Reactive output automatically responds when your user toggles a widget.
#   (unless you have submit widget)

# make a folder census-app
# put an app.R file into it

# we are going to take some values from the ui.  
#   process them on the server.
#   then display them on the ui.
# We need to add something to the ui to diplay...


# Shiny provides a family of functions that turn R objects into 
#   output for your user interface. Each function creates a 
#   specific type of output.
# 
# Output-function	  Creates
# dataTableOutput	  DataTable
# htmlOutput	      raw HTML
# imageOutput	      image
# plotOutput	      plot
# tableOutput	      table
# textOutput	      text
# uiOutput	        raw HTML
# verbatimTextOutput	text


ui <- fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
               information from the 2010 US Census."),
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("Percent White", 
                              "Percent Black",
                              "Percent Hispanic", 
                              "Percent Asian"),
                  selected = "Percent White"),
      
      sliderInput("range", 
                  label = "Range of interest:",
                  min = 0, max = 100, value = c(0, 100))
    ),
    
    mainPanel(
      textOutput("selected_var")   # here is the output!
    )
  )
)

# Notice that textOutput takes an argument, the character string 
#   "selected_var". Each of the *Output functions require a single 
#   argument: a character string that Shiny will use as the name of 
#   your reactive element. Your users will not see this name, but you 
#   will use it later


# In the server function below, output$selected_var matches 
#   textOutput("selected_var") in your ui.

server <- function(input, output) {
  
  output$selected_var <- renderText({  # notice the render function!
    "You have selected this"
  })
  
}

# render functions... super annoying.

# render function	  creates
# renderDataTable	  DataTable
# renderImage	      images (saved as a link to a source file)
# renderPlot	      plots
# renderPrint	      any printed output
# renderTable	      data frame, matrix, other table like structures
# renderText	      character strings
# renderUI	        a Shiny tag object or HTML

# Each render* function takes a single argument: 
#   an R expression surrounded by braces, {}. 

# So far this example is boring.  text output doesn't change!
shinyApp(ui = ui, server = server)

# You can make the text reactive by asking Shiny to call a 
# widget value when it builds the text. Letâ€™s look at how to do this.


# Take a look at the first line of code in the server function. 
#   Do you notice that the server function mentions two arguments, 
#   input and output? You already saw that output is a list-like 
#   object that stores instructions for building the R objects in your app.
# 
# input is a second list-like object. It stores the current values 
#   of all of the widgets in your app. These values will be saved 
#   under the names that you gave the widgets in your ui.

# So for example, our app has two widgets, one named "var" and 
#   one named "range" (you gave the widgets these names in Lesson 3). 
#   The values of "var" and "range" will be saved in input as input$var 
#   and input$range. Since the slider widget has two values 
#   (a min and a max), input$range will contain a vector of length two.
#   

server <- function(input, output) {
  
  output$selected_var <- renderText({ 
    paste("You have selected", input$var)
  })
  
}
shinyApp(ui = ui, server = server)

# After you put these functions into census-app/app.R, then run:
runApp("census-app", display.mode = "showcase")

# Exercise!
# Add a second line of reactive text to the main panel 
#   of your Shiny app. This line should display â€œYou 
#   have chosen a range that goes from something to 
#   somethingâ€, and each something should show the current 
#   minimum (min) or maximum (max) value of the slider widget.



# In this lesson, you created your first reactive Shiny app. Along the way, you learned to
# 
# 1) use an *Output function in the ui to place reactive objects in your Shiny app,
# 2) use a render* function in the server to tell Shiny how to build your objects,
# 3) surround R expressions by curly braces, {}, in each render* function,
# 4) save your render* expressions in the output list, with one entry for each 
#       reactive object in your app, and
# 5) create reactivity by including an input value in a render* expression.
# If you follow these rules, Shiny will automatically make your objects reactive.


