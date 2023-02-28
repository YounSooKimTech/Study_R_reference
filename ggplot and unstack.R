#######################
# plot the long data
#######################

library(dplyr)
library(tidyverse)
library(ggplot2)

list.files()

# use nuke dataset
df_nukes = read.csv("nukes.csv")
head(df_nukes, 2 )

# pivot longer
df_nukes_longer = df_nukes %>% 
  pivot_longer(cols = -year, 
                 names_to = "country",
               values_to = "n_bomb") %>% 
  replace_na(list(n_bomb = 0L))
head(df_nukes_longer, 5)

# graph
ggplot(data = df_nukes_longer,
       aes(x=year, y=n_bomb, color=country)) + geom_line()




##############################3
# unstack dataset
############################

library(tidyverse)
library(dplyr)

data("PlantGrowth")
head(PlantGrowth)

PlantGrowth %>% 
  group_by(group) %>% 
  summarize(count = n())

unstack(PlantGrowth)



getwd()
list.files()

df_diet = read.csv("DIETS.csv")
head(df_diet, 2)

unstack(df_diet, WTLOSS ~ DIET)

df_diet %>% pivot_wider(names_from = "DIET", values_from = "WTLOSS")