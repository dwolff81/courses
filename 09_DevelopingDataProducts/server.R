library(shiny)
library(datasets)
library(ggplot2)

carData <- mtcars
carData$cyl <- factor(carData$cyl, labels = c("4 Cyl", "6 Cyl", "8 Cyl"))

shinyServer(function(input, output) {
    
    captionText <- reactive({
        toString(input$selectedType)
    })
    
    output$caption <- renderText({
        captionText()
    })
    
    carData2 <- reactive({
        a <- subset(carData, carData$cyl %in% captionText())
        a <- droplevels(a)
        return(a)
    })
    
    output$MPGs <- renderTable({
        head(carData2,10)
    })
    
})