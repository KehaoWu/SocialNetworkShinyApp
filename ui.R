library(shiny)
library(igraph)

UIcharSetChinese = list(headTitle = "人物关系图",
                        ok = "准备就绪？",
                        person1 = "第一关系人（逗号(英文状态下半角)或者空格隔开）",
                        person2 = "第二关系人（逗号(英文状态下半角)或者空格隔开）",
                        RelationLabel = "关系标签（逗号(英文状态下半角)或者空格隔开）",
                        mainTitle = "主标题",
                        vcolor = "人物图形颜色",
                        ecolor = "关系线颜色",
                        mainFontSize = "主标题字体大小",
                        vSize = "人物图形大小",
                        eLWD = "关系线粗细",
                        vfcolor = "人物标签字体颜色",
                        efcolor = "关系标签字体颜色",
                        vLabelFontSize = "人物标签字体大小",
                        eLabelFontSize = "关系标签字体大小")

UIcharSetEnglish = list(headTitle = "Social Relationship Network Graph",
                        ok = "Are You Ready？",
                        person1 = "First Persons (separed by space or comma)",
                        person2 = "Second Persons (separed by space or comma)",
                        RelationLabel = "Relationship Labels (separed by space or comma)",
                        mainTitle = "Main Title",
                        vcolor = "Color for Persons",
                        ecolor = "Color for Lines",
                        mainFontSize = "Color for Main Title",
                        vSize = "Size for Persons",
                        eLWD = "Size for Lines",
                        vfcolor = "Color for Labels of Persons",
                        efcolor = "Color for Labels of Lines",
                        vLabelFontSize = "Font Size for Labels of Persons",
                        eLabelFontSize = "Font Size for Labels of Lines")

UIcharSet = UIcharSetChinese

dataset <- data.frame(
  person1 = "Tom,Jerry,Smith,Kath,Jerry,Jason,Obama,Jason",
  person2 = "Jerry,Kath,Tom,Tom,Smith,Obama,Kath,Tom",
  relation = "friend,couples,friend,classmate,couples,friend,classmate,friend"
)
colorSet <- c("grey","skyblue","turquoise","tomato","tan","slateblue",
              "wheat","sienna","black")

shinyUI(pageWithSidebar(
  
  #headerPanel("Social Network"),
  headerPanel("人物关系图"),
  
  sidebarPanel(
    checkboxInput("OK",UIcharSet$ok,F),
    textInput("person1",UIcharSet$person1,value=dataset$person1),
    textInput("person2",UIcharSet$person2,value=dataset$person2),
    textInput("RelationLabel",UIcharSet$RelationLabel,value=dataset$relation),
    textInput("mainTitle",UIcharSet$mainTitle,value="Social Network"),
    selectInput('vcolor', UIcharSet$vcolor, colorSet, selected = "turquoise"),
    selectInput('ecolor', UIcharSet$ecolor, colorSet, selected = "grey"),
    sliderInput('mainFontSize', UIcharSet$mainFontSize, min=1, max=10,
                value=3, step=0.2, round=0),
    sliderInput('vSize', UIcharSet$vSize, min=10, max=100,
                value=30, step=1, round=0),
    sliderInput('eLWD', UIcharSet$eLWD, min=1, max=10,
                value=3, step=0.2, round=0),
    selectInput('vfcolor', UIcharSet$vfcolor, colorSet,selected="black"),
    selectInput('efcolor', UIcharSet$efcolor, colorSet,selected="black"),
    sliderInput('vLabelFontSize', UIcharSet$vLabelFontSize, min=1, max=10,
                value=2, step=0.2, round=0),
    sliderInput('eLabelFontSize', UIcharSet$eLabelFontSize, min=1, max=10,
                value=2, step=0.2, round=0)
  ),
  
  mainPanel(
    conditionalPanel(condition = "input.OK = true",
                     plotOutput('plot')
                     ),
    conditionalPanel(condition = "input.OK = false",
                     htmlOutput('help',inline = T)
    )
  )
))