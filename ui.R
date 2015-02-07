library(shiny)
library(ggplot2)

dataset <- data.frame(
  person1 = "Tom,Jerry,Smith,Kath",
  person2 = "Jerry,Kath,Tom,Tom",
  relation = "friend,couples,friend,classmate"
)

shinyUI(pageWithSidebar(
  
  headerPanel("Social Network"),
  
  sidebarPanel(
    checkboxInput("OK","Are you ready?",F),
    textInput("person1","Former Person",value=dataset$person1),
    textInput("person2","Later Person",value=dataset$person2),
    textInput("RelationLabel","Label",value=dataset$relation),
    textInput("mainTitle","title",value="Social Network"),
    selectInput('color', 'Color', c("grey","skyblue")),
    sliderInput('vSize', 'Size', min=10, max=100,
                value=30, step=1, round=0),
    sliderInput('eLWD', 'Width', min=1, max=10,
                value=3, step=0.2, round=0),
    sliderInput('mainFontSize', 'title font size', min=1, max=10,
                value=3, step=0.2, round=0),
    sliderInput('vLabelFontSize', 'v font size', min=1, max=10,
                value=2, step=0.2, round=0),
    sliderInput('eLabelFontSize', 'e font size', min=1, max=10,
                value=2, step=0.2, round=0)
  ),
  
  mainPanel(
    plotOutput('plot')
  )
))