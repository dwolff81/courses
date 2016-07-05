library(shiny)

shinyUI(pageWithSidebar(
    
    headerPanel("MPGs by Number of Cylinders"),
    
    sidebarPanel(
        selectInput("selectedType", "Please Select Number of Cylinders:",
                    list("4 Cyl",
                         "6 Cyl",
                         "8 Cyl"
                         ))
        
    ),
    
    mainPanel(
        
        h3(textOutput("caption")),
        
        tableOutput("MPGs")
        
    )
    
))    