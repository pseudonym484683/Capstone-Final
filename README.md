# Capstone-Final

Algorithm : Data Fetch and Cleaning Data
========================================================

1. Read the data from data files (twitter, blogs and news)
2. Take data sample from each file. Join the three sample file and make main corpus.
3. Data cleaning and filtering done on main corpus.
4. Create 1-Gram, 2-Gram, 3-Gram, 4-Gram  Matrix with their frequence in decending order.
5. Save the frequncy matrix in a single text file.(Text file take less size than Rdata, shiny server faced out of memory using Rdata )


Algorithm : Next Word Prediction
========================================================

1. Load N Gram data with their frequencies.
2. Take user input .(a) User input Line.(b)Number of words to be predicted.
3. If User input > 3 . Take input = 3 words. else input = User Input
4. If Input =3 then  Take 4 Gram and get last words and put in final word list. if final word count < Number of word to be predicted then input =2 (take last 2 word from input)
5. If input =2 then Take 3 Gram and get last words and put in final word list. if final word count < Number of word to be predicted then input =1 (take last 1 word from input)
6. If input =1 then Take 2 Gram and get last words and put in final word list. if final word count < Number of word to be predicted then input =0
7. If input =0 the Take 1 Gram most frequency word till full the final word list.

Execution Steps and File Attached.
========================================================

1. Capstone1 - Part1.rmd
2. Capstone1 - Part2.rmd
3. Capstone1 - Part3.rmd - Final O/p - Ngrm.txt and index.RData
4. Capstone1 -Final.R  i/p - Ngrm.txt and index.RData
5  Ui.R and Server.R (Shiny App)
