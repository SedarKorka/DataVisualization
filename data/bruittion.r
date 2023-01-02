ggplot()+
          geom_polygon(aes(x = long, y = lat,fill=Death_rate_per_100_000_population, group=group),color="black")+ 
          theme(panel.background = element_rect(fill = "#101045"))+
      
    
      
    scale_fill_gradient(low = "white", high = "red", name = "Fraction", limits = c(0, max(Luxembourg_map_join$Death_rate_per_100_000_population))) +
     
      #expand_limits(x = world_map$long, y = world_map$lat) + 
    labs(title = paste("Death rate per 100_000  Population in ", y))



    ```{r echo=FALSE}

world_map <- map_data("world")

Luxembourg_map<-world_map %>% filter(region == "Luxembourg")

Noncauminicate_in_luxembourg<-Noncauminicate_in_luxembourg %>% select("region",
                     
                     "Year",
                     "Death_rate_per_100_000_population")

Luxembourg_map_join<-left_join(Luxembourg_map,Noncauminicate_in_luxembourg, by="region")

#Luxembourg_map_join

for (y in unique(Noncauminicate_in_luxembourg$Year)) {
  
   print(Noncauminicate_in_luxembourg %>%
    filter(Year == y) %>% 
    select(Year,region,Death_rate_per_100_000_population) %>% 
      
    
    ggplot() +
    geom_map(
      dat = Luxembourg_map, map = Luxembourg_map, aes(map_id = region),
      fill = "white", color = "#7f7f7f"
    ) +
    geom_map(map = Luxembourg_map, aes(map_id = region, fill = Death_rate_per_100_000_population)) +
    scale_fill_gradient(low = "white", high = "#cc4c02", name = "Fraction", limits = c(0, max(Noncauminicate_in_luxembourg$Death_rate_per_100_000_population))) +
    expand_limits(x = Luxembourg_map$long, y = Luxembourg_map$lat) + 
    labs(title = paste("Fraction of 50+ Population in ", y)))#+
    #transition_manual(frames = Year)
    
  
  
  
}