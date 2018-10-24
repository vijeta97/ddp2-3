library(shiny)
library(ggplot2)
library(curl)

# Define server logic
shinyServer(function(input, output) {
  
  # load data
  data("mtcars")
  
  # create the initial output
  output$distPlt <- renderPlot({
    
    # subset the data based on the inputs
    mtcars_sub <- subset(mtcars, mpg == input$mpg &
                             cyl == input$cyl &
                             disp == input$disp)
    
    # plot the mtcars data with sepal length and cyl
    k <- ggplot(data = mtcars_sub, aes(x = mpg, y = cyl)) + geom_point()
    k <- p + geom_smooth(method = "lm") + xlab("Sepal") + ylab("Petal")
    k <- p + xlim(0, 6) + ylim (0, 20000)
    p
  }, height = 700)
  
  # create linear model
  output$predict <- renderPrint({
    mtcars_sub <- subset( mtcars, mpg == input$mpg &
                          cyl == input$cyl &
                          disp == input$disp)
    fit <- lm(mpg~peta_length,data=mtcars_sub)
    unname(predict(fit, data.frame(mpg = input$lm)))})
  
  observeEvent(input$predict, {distPlot <<- NULL
  output$distPlot <- renderPlot({k <- ggplot(data = mtcars, aes(x = mpg, y = cyl)) + geom_point()
  k <- k + geom_smooth(method = "lm") + xlab("mpg") + ylab("cyl")
  k <- k + xlim(0, 6) + ylim (0, 20000)
  k
  }, height = 700)})})