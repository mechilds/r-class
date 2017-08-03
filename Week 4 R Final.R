original_url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.data"
mushroom_data_set <- read.table(original_url, header = FALSE, sep =",")
write.table(mushroom_data_set, file = "mushroom_data_set.csv", sep = ",") 
mushroom_data_set <- read.table(original_url, header = FALSE, sep =",")
mushroom_table_1 <- mushroom_data_set[ , 1:4]
colnames(mushroom_table_1) <- c("edible_or_poisonous", "cap_shape", "cap_surface", "cap_color")
head(mushroom_table_1)
switch_edible_or_poisonous <- function(val){
  switch (as.character(val),
          'p' = 'poisonous',
          'e' = 'edible'
  )
}
switch_cap_shape <- function(val){
  switch (as.character(val),
          'b' = 'bell',
          'c' = 'conical',
          'x' = 'convex',
          'f' = 'flat',
          'k' = 'knobbed',
          's' = 'sunken'
  )
}
switch_cap_surface <- function(val){
  switch (as.character(val),
          'f' = 'fibrous',
          'g' = 'grooves',
          'y' = 'scaly',
          's' = 'smooth'
  )
}
switch_cap_color <- function(val){
  switch (as.character(val),
          'n' = 'brown',
          'b' = 'buff',
          'c' = 'cinnamon',
          'g' = 'gray',
          'r' = 'green',
          'p' = 'pink',
          'u' = 'purple',
          'e' = 'red',
          'w' = 'white',
          'y' = 'yellow'
  )
}


mushroom_table_1$edible_or_poisonous <- sapply(mushroom_table_1$edible_or_poisonous, switch_edible_or_poisonous)
mushroom_table_1$cap_shape <- sapply(mushroom_table_1$cap_shape, switch_cap_shape)
mushroom_table_1$cap_surface <- sapply(mushroom_table_1$cap_surface, switch_cap_surface)
mushroom_table_1$cap_color <- sapply(mushroom_table_1$cap_color, switch_cap_color)
head(mushroom_table_1)