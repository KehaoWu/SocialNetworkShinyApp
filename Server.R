library(shiny)
library(ggplot2)

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
      V(g)$label.color = "black"
      V(g)$color = input$color
      V(g)$size = input$vSize
      
      E(g)$arrow.mode = 0
      E(g)$label = RelationLabel
      E(g)$label.cex = input$eLabelFontSize
      E(g)$label.color = "black"
      E(g)$color = input$color
      E(g)$width = input$eLWD
      plot(g,layout = layout.auto)
      title(main = input$mainTitle,cex.main=input$mainFontSize)
    }else{
      cat("<h3>Help</h3>")
      cat("<p>I won't start to write any help documents until I have finished the development.</p>")
    }

    
  }, height=700)
  
})