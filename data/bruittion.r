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


anim <- ggplot(data = Noncauminicate_in_luxembourg,aes(x= Age_Group , y=Death_rate_per_100_000_population)) + 
    geom_segment( aes(x=Age_Group, xend=Age_Group, y=0, yend=Death_rate_per_100_000_population, fill=Sex, color=Sex)) +
  
    geom_point(size=4) + 
  
geom_label(aes(Age_Group, Death_rate_per_100_000_population , label = signif(Death_rate_per_100_000_population)), 
           colour = "darkred", nudge_x = 0.35, size = 4)+
  
  
  labs(title="Mortality due to non-communicating diseases in the elderly population advances from 1960 to 2021",
       subtitle="En {closest_state}",
       x="Age_Group",
       y="Death rate per 100 000 population",
       caption="")+
  
  
  transition_states(states=Year,
                    transition_length = 1,
                    state_length = 2)
anim
