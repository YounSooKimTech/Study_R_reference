library(dplyr)
library(tidyverse)

# getwd()
list.files()

df_netflix = read.csv("netflix_data.csv")
head(df_netflix, 1)

# seperate cast into multiple 
df_netflix %>% 
  separate_rows(cast, sep=",")

# count the most frequent actors
df_netflix %>% 
  separate_rows(cast, sep = ", ") %>% 
  rename(actor = cast) %>% 
  count(actor, sort=TRUE) %>% 
  head(10)


# seprate
# list.files()
df_movies = read.csv("movies_duration.csv")
head(df_movies, 5)

df_movies %>% 
  separate(duration, into =c("value", "unit"), sep =" ", convert=TRUE) %>% 
  str()

# find the average duration for each type
df_movies %>% 
  separate(duration, into = c("value", "unit"), sep=" ", convert=TRUE) %>% 
  group_by(type, unit) %>%
  summarize(mean_duration = mean(value))
  

# join the tile and type columns using sep = "-
df_movies %>% 
  unite(title_type, title, type, sep="-")
