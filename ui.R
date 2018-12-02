#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  pageWithSidebar(
    
    headerPanel("Capstone Project - Predict next word"),
    
    sidebarPanel(
      
      h3("User Input"),
      
      br(),
      
      strong(""),
      textInput("txtInput", "Please input your words:", value = "Enter Text Here"),
      br(),
      
      selectInput("wordslimit", "Maximum predicted words:",
                  
                  choices = list("1" = 1, "2" = 2,
                                 
                                 "3" = 3, "4" = 4,
                                 
                                 "5" = 5, "6" = 6, 
                                 
                                 "7" = 7, "8" = 8, 
                                 
                                 "9" = 9, "10" = 10,
                                 
                                 "11" = 11, "12" = 12,
                                 
                                 "13" = 13, "14" = 14,
                                 
                                 "15" = 15), selected = 3),
      
      br(),
      
      
      
      strong("Click the below button to get predicted words."),
      
      actionButton("buttonPredict", "Predict Words")
      
      
      
      
      
    ),
    
    mainPanel(
      
      tabsetPanel(
        
        
        
        tabPanel("Prediction Analysis",
                 
                 h4('Input words:'),
                 
                 verbatimTextOutput("txtOutput"),
                 
                
                
                 h4('The predicted words:'),
                 
                 tableOutput("predictedwords")
                 
              )
  
  )))))
