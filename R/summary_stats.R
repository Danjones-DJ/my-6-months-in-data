summary_stats = function(output_data = NA) {
  summary_stats = output_data %>% 
    drop_na() %>%
    summarise(
      prop_days_coaching = mean(`Did coaching?`),
      prop_days_uni = mean(`Did uni work?`),
      prop_days_cried = mean(`Cried?`),
      prop_days_ill = mean(`Ill?`),
      prop_days_felt_good = mean(`Day felt good?`),
      prop_days_left_house = mean(`Left the house?`),
      prop_days_went_on_walk = mean(`Went on a walk?`),
      prop_days_1pc_better = mean(`Do I think I got at least 1% better?`),
      mean_happiness = mean(`Happiness (0-10)`),
      modal_coffees_a_day = mode(`Coffees`)
    )
  
  # Add days elapsed
  summary_stats$days_elapsed = nrow(summary_stats)
  
  output = summary_stats
  return(output)
}


