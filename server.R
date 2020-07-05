#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
        
        if (input$n > 0 & is.integer(input$n)) {
            t = seq(0, input$m, length.out = input$n)
            par(mar = c(0, 0, 0, 0), oma = c(0, 0, 0, 0))
            plot(cos(t), sin(t), type = 'l', asp = 1, 
                 xlab = NA, ylab = NA, axes = FALSE)
        } else {
            stop("Please type in a positive integer.")
        }

    })
    
    output$copyright <- renderText({
        print(HTML("<p style='text-align: center;'>&copy; 2020 Yuanting Lu</p>"))
    })

})
