library(shiny)
library(tm)
library(stylo)
library(data.table)
library(RWeka)
library(stringr)
library(dplyr)

source("capstone1 - Final.R")

shinyServer(
  function(input,output) {
    
    
    
    # Display text
  
    txtReturn <- eventReactive(input$buttonPredict, {

      paste(input$txtInput)
      
    })
    
    output$txtOutput <- renderText({ txtReturn() })

    # Get list of predicted words
    
    nextWord <- eventReactive(input$buttonPredict, {

      predictWord(input$txtInput, input$wordslimit)
      
    })
    output$predictedwords <- renderTable({ nextWord() })
  } 
  
  
)