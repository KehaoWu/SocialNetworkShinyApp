library(shiny)
library(igraph)

shinyServer(function(input, output) {

  process = function(v)
  {
    v = unlist(strsplit(x = v,split = ",|\\s+",perl = T))
    l = v[1]
    v = v[-1]
    n = length(v)
    p1 = p2 = label = NULL
    for(i in 1:(n-1))
    {
      for(j in (i+1):n)
      {
        p1 = c(p1, v[i])
        p2 = c(p2, v[j])
        label = c(label, l)
      }
    }
    return(list(p1=p1,p2=p2,l=label))
  }
  
  output$plot <- reactivePlot(function() {
    
    data = input$textArea
    data = unlist(strsplit(x = data,split = "\\n"))
    print(data)
    PersonOne = NULL
    PersonTwo = NULL
    RelationLabel = NULL
    
    for(v in data)
    {
      r = process(v)
      PersonOne = c(PersonOne,r$p1)
      PersonTwo = c(PersonTwo,r$p2)
      RelationLabel = c(RelationLabel,r$l)
    }

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