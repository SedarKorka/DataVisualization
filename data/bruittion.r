ggplot()+
          geom_polygon(aes(x = long, y = lat,fill=Death_rate_per_100_000_population, group=group),color="black")+ 
          theme(panel.background = element_rect(fill = "#101045"))+
      
    
      
    scale_fill_gradient(low = "white", high = "red", name = "Fraction", limits = c(0, max(Luxembourg_map_join$Death_rate_per_100_000_population))) +
     
      #expand_limits(x = world_map$long, y = world_map$lat) + 
    labs(title = paste("Death rate per 100_000  Population in ", y))