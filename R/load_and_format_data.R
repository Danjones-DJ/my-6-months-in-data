load_and_format_data = function(raw_data = read_sheet(url)) {
  
  column_formated = raw_data %>%
    mutate(
      # YES AND NOs
      `Did coaching?` = as.character(`Did coaching?`),
      `Did uni work?` = as.character(`Did uni work?`),
      `Cried?` = as.character(`Cried?`),
      `Ill?` = as.character(`Ill?`),
      `Day felt good?` = as.character(`Day felt good?`),
      `Left the house?` = as.character(`Left the house?`),
      `Went on a walk?` = as.character(`Went on a walk?`),
      `Do I think I got at least 1% better?` = as.character(`Do I think I got at least 1% better?`),
      
      # CHARACTER
      `Main location` = str_to_upper(as.character(`Main location`)),
      `Things I was grateful for` = str_to_upper(as.character(`Things I was grateful for`)),
      `Why / why not` = str_to_upper(as.character(`Why / why not`)),
      `Artist 1` = str_to_upper(as.character(`Artist 1`)),
      `Song 1` = str_to_upper(as.character(`Song 1`)),
      `Artist 2` = str_to_upper(as.character(`Artist 2`)),
      `Song 2` = str_to_upper(as.character(`Song 2`)),
      `Artist 3` = str_to_upper(as.character(`Artist 3`)),
      `Song 3` = str_to_upper(as.character(`Song 3`)),
      
      # NUMERIC
      `Happiness (0-10)` = as.numeric(`Happiness (0-10)`),
      `People spoken to` = as.character(`People spoken to`),
      `Coffees` = as.numeric(`Coffees`)
    ) 
  
  clean_formated_data = column_formated %>% 
    mutate(
      # Turn Yes and No into Binary
      `Did coaching?` = ifelse(`Did coaching?` == "Yes", 1, 0),
      `Did uni work?` = ifelse(`Did uni work?` == "Yes", 1, 0),
      `Cried?` = ifelse(`Cried?` == "Yes", 1, 0),
      `Ill?` = ifelse(`Ill?` == "Yes", 1, 0),
      `Day felt good?` = ifelse(`Day felt good?` == "Yes", 1, 0),
      `Left the house?` = ifelse(`Left the house?` == "Yes", 1, 0),
      `Went on a walk?` = ifelse(`Went on a walk?` == "Yes", 1, 0),
      `Do I think I got at least 1% better?` = ifelse(`Do I think I got at least 1% better?` == "Yes", 1, 0)
    )
  
  output = clean_formated_data
  return(output)
}


