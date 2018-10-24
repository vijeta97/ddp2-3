library(shiny)
library(ggplot2)

# load data
data("mtcars")

# Define UI for the application
shinyUI(fluidPage(titlePanel("mtcars  on mpg,cyl and disp"),
                  
              # Sidebar with a slider input for number of variables
              sidebarLayout(sidebarPanel(h4("Choose mtcars Factors"),
                                         selectInput("mpg", "mpg", (sort(unique(irismpg), decreasing = T))),
                                         selectInput("cyl", "cyl", (sort(unique(diamonds$cyl)))),
                                         selectInput("disp", "disp", (sort(unique(mtcars$disp), decreasing = T))),
                                         sliderInput("lm", "disp",
                                                     min = min(mtcars$disp), max = max(mtcars$disp),
                                                     value = max(mtcars$disp) / 2, step = 0.1),
                                           h4("Predicted Price"), verbatimTextOutput("predict"), width = 4),
                                
                                # Show a plot of the carat/price relationship
                                mainPanel("mpg/cyl Relationship", plotOutput("distPlot"))
                  )))