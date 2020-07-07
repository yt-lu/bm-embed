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
            t = seq(0, input$dt * (input$n - 1), by = input$dt) * pi / 180
            u = input$u * pi /180
            par(mar = c(0, 0, 0, 0), oma = c(0, 0, 0, 0))
            plot(cos(t + u), sin(t + u), type = 'l', asp = 1, 
                 xlab = NA, ylab = NA, axes = FALSE)
        } else {
            stop("Please type in a positive integer.")
        }

    })
    
    output$copyright <- renderText({
        print(HTML("<p style='text-align: center;'>An idea comes from a coding mistake.<br>&copy; 2020 Yuanting Lu</p>"))
    })

})
