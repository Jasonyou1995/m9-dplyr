# Exercise 6: DPLYR join introduction

# Install the nycflights13 package and read it in. Require the dplyr package.
# install.packages("nycflights13")
library(nycflights13)
suppressPackageStartupMessages(library(dplyr))


# Create a dataframe of the average arrival delay for each destination, then use left_join
# to join on the "airports" dataframe, which has the airport info
average.delay <- flights %>%
                 group_by(dest) %>% 
                 summarise(ave_delay = mean(arr_delay, na.rm = TRUE)) %>% 
                 rename(faa = dest)

merge.data1 <- left_join(average.delay, airports, by = 'faa') %>% 
               arrange(-ave_delay)

# Create a dataframe of the average arrival delay for each airline, then use left_join
# to join on the "airlines" dataframe, which has the airline info
airline.delay <- flights %>% 
                 group_by(carrier) %>% 
                 summarise(ave_delay = mean(arr_delay, na.rm = TRUE)) %>% 
                 left_join(airlines) %>% 
                 arrange(-ave_delay)


### Bonus ###
# Calculate the average delay by city AND airline, then merge on the city and airline information
city.airline.delay <- flights %>% 
                      group_by(dest, carrier) %>% 
                      summarise(ave_delay = mean(arr_delay, na.rm = TRUE)) %>%
                      rename(faa = dest) %>% 
                      left_join(airports, by = "faa") %>% 
                      left_join(airlines, by = "carrier") %>% 
                      arrange(-ave_delay)
                      

# If you're running into sorting issues:
# http://stackoverflow.com/questions/26555297/dplyr-arrange-a-grouped-df-by-group-variable-not-working
