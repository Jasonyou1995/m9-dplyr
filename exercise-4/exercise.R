# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns
View(flights)

# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
f.data <- flights
f.data <- mutate(f.data, gained = arr_delay - dep_delay)

# Sort your data.frame desceding by the column you just created
f.data <- arrange(f.data, desc(gained))

# Try doing the last 2 steps in a single operation using the pipe operator
f.data <- mutate(f.data, gained = arr_delay - dep_delay) %>% arrange(desc(gained))

# Make a histogram of the amount of gain using the `hist` command
hist(select(f.data, gained) %>% .$gained)

# On average, did flights gain or lose time?
f.data$GZL <- sign(f.data$gained)   # don't use dplyr functions in here, otherwise you
                                    # will get a table in "GZL"
mean(f.data$gained, na.rm = TRUE)

# Create a data.frame that is of flights headed to seatac ('SEA'), 
to.seatac <- f.data %>% select(gained, dest) %>% filter(dest == 'SEA')

# On average, did flights to seatac gain or loose time?
mean(to.seatac$gained, na.rm = TRUE)    # always remember to remove NAs
### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
## Hint: see slides on standard evaluation
Choose <- function(my_origin, destination, interest_col) {
    df <- flights %>%
        filter(origin == my_origin, dest == destination) %>% 
        select_(interest_col)
    return(df)
}

# Retireve the air_time column for flights from JFK to SEA
col1 <- Choose('JFK', 'SEA', 'air_time')

# What was the average air time of those flights (in hours)?  
f.mean <- mean(col1$air_time, na.rm = TRUE) / 60

# What was the min/max air time for the JFK to SEA flights?
f.min <- min(col1$air_time, na.rm = TRUE) / 60
f.max <- max(col1$air_time, na.rm = TRUE) / 60
