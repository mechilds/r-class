
library(readr)
athletes_url <- "https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/DAAG/ais.csv"
athletes_data_set <- read_delim(file=athletes_url, delim=',')
athletes_subset <- athletes_data_set[ , c(1, 9, 10, 12:14)]
colnames(athletes_subset) <- c("athlete", "percent_body_fat", "lean_body_mass", "weight", "male_or_female", "sport")
head(athletes_subset)


library(ggplot2)
ggplot(athletes_subset, aes(y = weight, x = sport)) + geom_boxplot()
weight <- ggplot(data=athletes_subset) + geom_histogram(aes(x=weight))
weight_by_sport <- weight + facet_wrap(~sport)
weight_by_sport


mass_by_fat <- ggplot(data=athletes_subset, aes(x = lean_body_mass, y = percent_body_fat)) + geom_point()
mass_by_fat_graph <- mass_by_fat + facet_wrap(~ sport) + labs(x = "Lean Body Mass", y = "Percent Body Fat")
mass_by_fat_graph
