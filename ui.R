library(shiny)
library(igraph)

dataset <- data.frame(
  person1 = "Tom,Jerry,Smith,Kath,Jerry,Jason,Obama,Jason",
  person2 = "Jerry,Kath,Tom,Tom,Smith,Obama,Kath,Tom",
  relation = "friend,couples,friend,classmate,couples,friend,classmate,friend"
)
colorSet <- c("grey","skyblue","turquoise","tomato","tan","slateblue",
              "wheat","sienna","black")

shinyUI(pageWithSidebar(
  
  headerPanel("Social Network"),
  
  sidebarPanel(
    checkboxInput("OK","Are you ready?",F),
    textInput("person1","Former Person",value=dataset$person1),
    textInput("person2","Later Person",value=dataset$person2),
    textInput("RelationLabel","Label",value=dataset$relation),
    textInput("mainTitle","Title",value="Social Network"),
    selectInput('vcolor', 'Circle Color', colorSet, selected = "turquoise"),
    selectInput('ecolor', 'Line Color', colorSet, selected = "grey"),
    sliderInput('mainFontSize', 'Title Font Size', min=1, max=10,
                value=3, step=0.2, round=0),
    sliderInput('vSize', 'Size', min=10, max=100,
                value=30, step=1, round=0),
    sliderInput('eLWD', 'Line Width', min=1, max=10,
                value=3, step=0.2, round=0),
    selectInput('vfcolor', 'Circle Font Color', colorSet,selected="black"),
    selectInput('efcolor', 'Line Font Color', colorSet,selected="black"),
    sliderInput('vLabelFontSize', 'Circle Font Size', min=1, max=10,
                value=2, step=0.2, round=0),
    sliderInput('eLabelFontSize', 'Line Font Size', min=1, max=10,
                value=2, step=0.2, round=0)
  ),
  
  mainPanel(
    plotOutput('plot')
  )
))