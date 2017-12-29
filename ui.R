#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

## Next Word Prediction Application: Data Science Capstone Project.
## ui.R file for the Shiny app execution.

suppressWarnings(library(shiny))
suppressWarnings(library(markdown))
shinyUI(navbarPage(inverse = TRUE,
      
                   title = "Next Word Prediction Application: Data Science Capstone Project",
                   tabPanel("N-gram Prediction Alogrithm",
                            style = "background-color: cornsilk;",
                            style = "width:100%",
                            style = "height:100%",
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                style = "background-color: #80ffff;",
                                img(src = "./wordcloud.png",height=250,width=250),
                                width=4,
                                style = "width:100%",
                                style = "height:100%",
                                h2("Input Text Below"),
                                br(),
                                textInput("inputString", "Enter a word/phrase here",value = ""),
                                br(),
                                br(),
                                br()
                                
                              ),
                              mainPanel(
                                h2("The word/phrase you entered:"),
                                tags$style(type='text/css', '#text1 {background-color: rgba(0, 0, 255, 0.3); color: black;font-size: 20px}'), 
                                verbatimTextOutput('text1'),
                                br(),
                              
        
                                h2("Predicted Word"),
                                tags$style('#prediction {color: blue; font-size: 20px;font-style: italic;font-size: 20px }'),
                                verbatimTextOutput('prediction'),
                                br()
                                )
         )
                            
        )
)
)