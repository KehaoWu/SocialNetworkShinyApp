library(shiny)
library(igraph)

shinyServer(function(input, output) {
  

  
  output$plot <- reactivePlot(function() {
    #PersonOne = c("Tom","Jerry","Kathleen","John","SMith","Douglas")
    PersonOne = unlist(strsplit(x = input$person1,split = ",",perl = T))
    #PersonTwo = c("Jerry","Kathleen","SMith","Douglas","John","Tom")
    PersonTwo = unlist(strsplit(x = input$person2,split = ",",perl = T))
    RelationLabel = unlist(strsplit(x = input$RelationLabel,split = ",",perl = T))
    if(input$OK)
    {
      Label = unique(c(PersonOne,PersonTwo))
      PersonOne = match(PersonOne,Label)
      PersonTwo = match(PersonTwo,Label)
      g = graph(as.vector(rbind(PersonOne,PersonTwo)),directed = T)
      
      V(g)$frame.color = "white"
      V(g)$label = Label
      V(g)$label.cex = input$vLabelFontSize
      V(g)$label.color = input$vfcolor
      V(g)$color = input$vcolor
      V(g)$size = input$vSize
      
      E(g)$arrow.mode = 0
      E(g)$label = RelationLabel
      E(g)$label.cex = input$eLabelFontSize
      E(g)$label.color = input$efcolor
      E(g)$color = input$ecolor
      E(g)$width = input$eLWD
      plot(g,layout = layout.auto)
      title(main = input$mainTitle,cex.main=input$mainFontSize)
      title(sub = "Developed by Kehao Wu",cex.sub=0.8,col.sub="tomato")
    }

    
  }, height=700)
  
})