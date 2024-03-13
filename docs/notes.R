#gives me the location of every country so it can be plotted into a map 

world <- map_data("world") %>% 
  filter(region != "Antarctica")
head(world)

#removed antartica as not needed 

# to merge two dataset you need to have an identical column - names complicated due to different conventions so use iso 

#get iso for each country 

#vector with all countries printed once

country_names <- unique(world_coord$country)

# Convert country names to ISO codes

iso_codes <- countrycode(country_names, origin = "country.name", destination = "iso3c")

# Create a data frame with country names and corresponding ISO codes

iso_df <- data.frame(country = country_names, iso = iso_codes)

# Merge ISO codes with map data
map_data_with_iso <- merge(world_coord, iso_df, by= "country")


#merge my data with the map data 
head(full_data)
head(map_data_with_iso)

# need to create an aggregated dataset where i have total of natural disaster per country 
#  Aggregate the data for all the natural disaster that have occured since 2000
aggregated_total_data <- full_data %>%
  group_by(iso) %>%
  summarize(total_events = n())
head(aggregated_total_data)


#  Merge the aggregated data with the map data = 
total_disaster_map <- inner_join(map_data_with_iso, aggregated_total_data, by = "iso")
head(total_disaster_map)


#Plot the data
ggplot() +
  geom_polygon(data = total_disaster_map, aes(x = long, y = lat, group = group, fill = total_events)) +
  geom_polygon(data = map_data_with_iso, aes(x = long, y = lat, group = group), fill = NA, color = "black")+
  scale_fill_gradient(low = "light yellow", high = "dark red", name = "Total Events") +
  labs(title = "Total Number of Natural Disaster Events by Location")

#not correct 

#need to compare the way countries have been labeled differently on both tibbles 
# Extract country columns
my_country_list <- full_data$country
world_country_list<- world_coord$country

# Step 3: Remove duplicates
my_country_list_unique <- unique(my_country_list)
world_country_list_unique <- unique(world_country_list)
head(world_country_list_unique)

# Step 4: Compare lists
discrepancies <- setdiff(tolower(my_country_list_unique), tolower(world_country_list_unique))
discrepancies <- setdiff(tolower(world_country_list_unique), tolower(my_country_list_unique))
discrepancies
my_country_list_unique
# Check if there are any discrepancies
if (length(discrepancies) > 0) {
  print("Countries with spelling discrepancies:")
  print(discrepancies)
} else {
  print("Country spellings are consistent between the datasets.")
}




#create plots per year?
#create plot and facet wrap so have it by climate change or not 