PersonOne = c("Tom","Jerry","Kathleen","John","SMith","Douglas")
PersonTwo = c("Jerry","Kathleen","SMith","Douglas","John","Tom")
Label = unique(c(PersonOne,PersonTwo))
PersonOne = match(PersonOne,Label)
PersonTwo = match(PersonTwo,Label)
g = graph(as.vector(rbind(PersonOne,PersonTwo)),directed = T)
E(g)$arrow.mode = 0
V(g)$label = Label
V(g)$size = 200
plot(g,layout = layout.circle,main="network")
