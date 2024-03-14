```{r echo=FALSE, message=FALSE, warning=FALSE}
#want a graph that show the number of disasters on the y axis and the subgroup of disasters on the x axis split by region

graph_example <- updated_data %>% group_by(subgroup, subtype, region) %>% summarise(count = n())
view(graph_example)

#disaster by subgroup - simple
ggplot(graph_example, aes(x = subgroup, y = count)) +
  geom_bar(stat = "identity", position = "dodge", fill = "dark green") +
  labs(title = "Number of natural disasters between 2000 - 2022",
       y = "Number of Disasters",
       x = "Types of Disasters") +
  ylim(0,1000) +
  theme_classic() 

#by type
ggplot(graph_example, aes(x = subgroup, y = count)) +
  geom_bar(stat = "identity", position = "dodge", fill = "dark green") +
  labs(title = "Number of natural disasters between 2000 - 2022",
       y = "Number of Disasters",
       x = "Types of Disasters") +
  ylim(0,1000) +
  theme_classic() 

#build up graph - split by region 
ggplot(graph_example, aes(x = subgroup, y = count, fill = region)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Number of natural disasters between 2000-2022",
       y = "Number of Disasters",
       x = "Types of Disasters") +
  ylim(0,1000) +
  theme_classic() 

#total natural disasters
year_totals <- updated_data %>% group_by(year, region) %>% summarise(count = n())
ggplot(year_totals, aes(x = year, y =count, fill = region)) +
  geom_bar(stat = "identity") +
  labs(title = "total number of natural disasters which have occured since 2000 split by region") +
  theme_classic()

```