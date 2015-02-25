library(shiny)
library(igraph)

shinyServer(function(input, output) {
  output$help <- renderPrint({
    cat("<p>help</p>")
  })

  
  output$plot <- reactivePlot(function() {
    PersonOne = unlist(strsplit(x = input$person1,split = ",|\\s+",perl = T))
    PersonTwo = unlist(strsplit(x = input$person2,split = ",|\\s+",perl = T))
    RelationLabel = unlist(strsplit(x = input$RelationLabel,split = ",|\\s+",perl = T))
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
      title(sub = "Developed by Kehao Wu",cex.sub=0.8,col.sub="grey")
    }

    
  }, height=700)
  
})