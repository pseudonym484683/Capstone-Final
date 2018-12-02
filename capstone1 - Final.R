
library(data.table)
library(tm)
library(stylo)
library(RWeka)
library(dplyr)
library(stringr)

rm(list = ls())

#load("dataNgramsFreqTable.RData")

load("index.RData")

dataALL <- fread("Ngrm.txt", sep = "\t", header=TRUE, data.table = FALSE)

data1gram <- dataALL[g1index[1]:g1index[2], ]
data2gram <- dataALL[g2index[1]:g2index[2], ]
data3gram <- dataALL[g3index[1]:g3index[2], ]
data4gram <- dataALL[g4index[1]:g4index[2], ]


getfinal <- function(userInput) {
  
  finalword <- NA
  cPhrase <- paste("^", paste(userInput, collapse = " "), "\\b", sep = "")
  
  # Use appropriate NGram table to find matches to user input
  if (length(userInput)==3) {
    rawMatch <- grep(cPhrase, data4gram$word)
    finalword <- word(data4gram$word[rawMatch], -1)
  }
  
  if (length(userInput)==2) {
    rawMatch <- grep(cPhrase, data3gram$word)
    finalword <- word(data3gram$word[rawMatch], -1)
  }
  
  if (length(userInput)==1) {
    rawMatch <- grep(cPhrase, data2gram$word)
    finalword <- word(data2gram$word[rawMatch], -1)
  }
  
  return(finalword)
  
}

predictWord <- function(txtInput, wordslimit = 5, flag = TRUE) {
  
  
  userInput <- txt.to.words(txtInput)
  wordnum <- length(userInput)
  
  # If input is blank
  if (wordnum==0){
    finalword <- as.data.frame(as.character(data1gram$word[1:wordslimit]))
    colnames(finalword) <- c("Next words")
    return(finalword)
  }
  
  # last 3 words
  if (wordnum > 3) {
    wordnum <- 3
    userInput <- tail(userInput, wordnum)
  }
  # Removes same results
  matchwordlength <- NULL
  matchwordlist <- NULL
  for (i in wordnum:1) {
    temp <- NULL
    temp <- getfinal(tail(userInput, i))
    
    if (is.na(temp[1])) {
      matchwordlength <- c(matchwordlength, 0)
    } else {
      
      logicRemove <- temp %in% matchwordlist
      matchwordlist <- c(matchwordlist, temp[!logicRemove])
      matchwordlength <- c(matchwordlength, length(temp[!logicRemove]))
      rm(logicRemove, temp)
    }
    if (sum(matchwordlength) > wordslimit) {break}
    
  }
  
  # If no found
  if (sum(matchwordlength)==0) {
    finalword <- as.data.frame(as.character(data1gram$word[1:wordslimit]))
    colnames(finalword) <- c("Next words")
    return(finalword)
  }
  
  #colnames(matchwordlist) <- c("Next words")
  finalword <- as.data.frame(as.character(matchwordlist[1:wordslimit]))
  colnames(finalword) <- c("Next words")
  return(finalword)
  
}

