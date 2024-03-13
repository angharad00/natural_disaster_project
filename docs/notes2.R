# Load your dataset containing ISO codes (replace 'your_dataset.csv' with your actual dataset)
your_data <- read.csv("your_dataset.csv")

# Extract unique ISO codes from your dataset
unique_iso_codes <- unique(your_data$ISO_code)

# Load country boundaries data
library(rnaturalearth)
world <- ne_countries(scale = "medium", returnclass = "sf")

# Check for matching ISO codes
matching_codes <- unique_iso_codes %in% world$iso_a3

# Print out the results
print(matching_codes)

# Extract the indices where matching_codes is FALSE
mismatch_indices <- which(!matching_codes)

# Extract the specific ISO codes that do not match
mismatched_iso_codes <- unique_iso_codes[!matching_codes]

# Print out the mismatched ISO codes
print(mismatched_iso_codes)


---------------------------------------


# Extract unique countries  from your dataset
unique_disaster <- unique(full_data$country)

# extract unique country from world data
unique_world <- unique(world1$region)

# Check for matching ISO codes
matching_codes <- unique_disaster %in% unique_world

# Print out the results
print(matching_codes)

# Extract the indices where matching_codes is FALSE
mismatch_indices <- which(!matching_codes)

# Extract the specific countries  that do not match
mismatched_disaster_spelling <- unique_disaster [!matching_codes]

# Print out the mismatched
print(mismatched_disaster_spelling)


#list of old and new name to match 
#"Iran (Islamic Republic of)"     = Iran                      
# "United States of America"      = USA                       
# "Réunion"                       = Reunion                        
# "Russian Federation"            = Russia                       
# "Congo"                         = Republic of Congo                       
# "United Republic of Tanzania"   = Tanzania                      
# "Eswatini"                      = Swaziland                     
# "Bolivia (Plurinational State of)"   = Bolivia                  
# "Czechia"                       = Czech Republic                       
# "Türkiye"                       =  Turkey                     
# "Republic of Korea"             = South Korea                      
# "Serbia Montenegro"             = Serbia   or Montenegro - need to look                     
# "Micronesia (Federated States of)" Micronesia                     
# "United Kingdom of Great Britain and Northern Ireland" = UK
# "Viet Nam"                    = Vietnam                        
# "Lao People's Democratic Republic"   = Laos                 
# "Taiwan (Province of China)"       = Taiwan                   
# "Democratic People's Republic of Korea" = North Korea              
# "Venezuela (Bolivarian Republic of)"    = Venezuela              
# "Republic of Moldova"              = Moldova                   
# "Syrian Arab Republic"            = Syria                     
# "Côte d’Ivoire"                       =   Ivory Coast                
# "Saint Vincent and the Grenadines"     = saint vincent                
# "Netherlands (Kingdom of the)"     = Netherlands                   
# "China, Hong Kong Special Administrative Region"   = china   
# "China, Macao Special Administrative Region"      = china     
# "Cabo Verde"                           = cape verde                
# "Trinidad and Tobago"   = Trinidad or Tobago    - need to look                            
#"United States Virgin Islands"        = Virgin Islands                 
# "Tokelau"                           = 	Tokelau          
#"State of Palestine"                 = Palestine                 
# "Antigua and Barbuda"               = either antigua or barbuda - need to look                   
# "Saint Kitts and Nevis"             = either saint kitts or nevis - need to look                   
# "Tuvalu"                            = 	Tuvalu
#"Wallis and Futuna Islands"          = Wallis and Futuna                 
# "Saint Barthélemy"                 = Saint Martin               
# "Saint Martin (French Part)"       = Saint Martin                   
# "Sint Maarten (Dutch part)"        = Saint Martin                
# "British Virgin Islands"            = Virgin Islands 

