# Exercise 5: DPLYR Grouped Operations

# Install the nycflights13 package and read it in. Require the dplyr package.
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# In which month was the average departure delay the greatest?
# Hint: you'll have to perform a grouping operation before summarizing your data
month.ave <- group_by(flights, month) %>%
             summarise(mean = mean(dep_delay, na.rm = TRUE))
delay.month <- month.ave %>% filter(mean == min(mean)) %>% select(month)
## here is another way to solve the problem:
# month.ave <- group_by(flights, month) %>%
#     summarise(mean = mean(dep_delay, na.rm = TRUE)) %>% 
#     filter(mean == min(mean)) %>%
#     select(month)

# If you create a data.frame with the columns "month", and "delay" above, you should be able to create 
# a scatterplot by passing it to the 'plot' function
plot(month.ave, type = 'b', lwd = 2, col = 6)

# In which airport were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
arr.delay <- flights %>%
             group_by(dest) %>%
             summarise(ave = mean(arr_delay, na.rm = TRUE))
arr.delay$ave[!complete.cases(arr.delay$ave)] <- 0
highest.arr.delay <- arr.delay %>% filter(ave == max(ave)) %>% select(dest)
### Bonus ###
# Which city was flown to with the highest average speed?
highest.speed.city <- flights %>%
           mutate(flight_speed = distance / air_time) %>%
           group_by(dest) %>% 
           summarise(ave_speed = mean(flight_speed, na.rm = TRUE)) %>% 
           filter(ave_speed == max(ave_speed, na.rm = TRUE)) %>% 
           select(dest)
