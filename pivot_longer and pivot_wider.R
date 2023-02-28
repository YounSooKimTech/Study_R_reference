# getwd()
setwd("C:/Users/younskim/Documents/R_dplyr")
list.files()

# install.packages(c("tideverse", "readxl"))

library(tidyverse)
library(readxl)
library(dplyr)

?pivot_longer()


######################################
## Exampl 
#####################################

table1 = tibble(
  country = c("A", "B","C"),
  "1999" = c("0.7K", "37K", "212K"),
  "2000" = c("2K", "80K", "213K")
)
table1

table1 %>% pivot_longer(cols = c('1999', '2000'))

table1 %>% pivot_longer(cols = -'country')

# how to use pivot_longer()
table1 %>% pivot_longer(cols = c("1999", "2000"), 
                        names_to = "year", 
                        values_to = "n_cases")

# similar function, gather()
table1 %>% gather(-country, key = "year", value="n_cases")



##################################
# pivot_wider()
#####################################

library(dplyr)
library(tidyverse)
list.files()

planet_df = read.csv("planet-data.csv")
head(planet_df, 3)
View(planet_df)
planet_df %>% pivot_wider(id_cols = planet,
                          names_from = "metric",
                          values_from = "value")

