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
                        person1 = "First Persons (separated by space or comma)",
                        person2 = "Second Persons (separated by space or comma)",
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
  person1 = "令计划 令计划 令计划 谷丽萍 谷丽萍 于丽芳 令完成 毛晓峰 毛晓峰",
  person2 = "令完成 谷丽萍 毛晓峰 于丽芳 毛晓峰 毛晓峰 毛晓峰 段青山 董文标",
  relation = "兄弟 夫妻 校友及昔日上下级 夫人俱乐部成员 同事 同事 校友 同事 同事"
)
colorSet <- c("grey","skyblue","turquoise","tomato","tan","slateblue",
              "wheat","sienna","black")

shinyUI(pageWithSidebar(
  
  headerPanel(UIcharSet$headTitle),
  
  sidebarPanel(
    checkboxInput("OK",UIcharSet$ok,F),
    textInput("person1",UIcharSet$person1,value=dataset$person1),
    textInput("person2",UIcharSet$person2,value=dataset$person2),
    textInput("RelationLabel",UIcharSet$RelationLabel,value=dataset$relation),
    textInput("mainTitle",UIcharSet$mainTitle,value=UIcharSet$headTitle),
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
                value=1.8, step=0.2, round=0),
    sliderInput('eLabelFontSize', UIcharSet$eLabelFontSize, min=1, max=10,
                value=1.2, step=0.2, round=0)
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