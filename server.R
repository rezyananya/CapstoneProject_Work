#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
## Next Word Prediction Application: Data Science Capstone Project.
## server.R file for the Shiny app execution.

# Calling required library and suppressing for warning messages

suppressWarnings(library(tm))
suppressWarnings(library(stringr))
suppressWarnings(library(shiny))

# Loading all the required files (quadgram,trigram and bigram files)

quadgram <- readRDS("quadgram.RData");
trigram <- readRDS("trigram.RData");
bigram <- readRDS("bigram.RData");
mesg <<- ""

# Cleaning up the user input before predicting the next word

Predict <- function(x) {
  xclean <- removeNumbers(removePunctuation(tolower(x)))
  xs <- strsplit(xclean, " ")[[1]]
  
  if (length(xs)>= 3) {
    xs <- tail(xs,3)
    if (identical(character(0),head(quadgram[quadgram$unigram == xs[1] & quadgram$bigram == xs[2] & quadgram$trigram == xs[3], 4],1))){
      Predict(paste(xs[2],xs[3],sep=" "))
    }
    else {head(quadgram[quadgram$unigram == xs[1] & quadgram$bigram == xs[2] & quadgram$trigram == xs[3], 4],1)}
  }
  else if (length(xs) == 2){
    xs <- tail(xs,2)
    if (identical(character(0),head(trigram[trigram$unigram == xs[1] & trigram$bigram == xs[2], 3],1))) {
      Predict(xs[2])
    }
    else { head(trigram[trigram$unigram == xs[1] & trigram$bigram == xs[2], 3],1)}
  }
  else if (length(xs) == 1){
    xs <- tail(xs,1)
    if (identical(character(0),head(bigram[bigram$unigram == xs[1], 2],1))) { head("the",1)}
    else {head(bigram[bigram$unigram == xs[1],2],1)}
  }
}


shinyServer(function(input, output) {
  output$prediction <- renderPrint({
    result <- Predict(input$inputString)
    output$text2 <- renderText({mesg})
    result
  });
  
  output$text1 <- renderText({
    input$inputString});
  })