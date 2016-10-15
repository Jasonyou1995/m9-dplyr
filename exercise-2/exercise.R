# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)
library(dplyr)

# You should have have access to the `vehicles` data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997
vehicles.1997 <- filter(vehicles, year == 1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
one.year <- unique(select(vehicles.1997, year))

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel.20more.cty <- filter(vehicles, drive == '2-Wheel Drive', cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.hwy.id <- filter(vehicles, hwy == min(hwy)) %>% select(id)

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MostHwyVehicle <- function(my_year, my_make) {
    # always use different variable names from the names in tables!!!
    return(filter(vehicles, year == my_year, make == my_make) %>%
               filter(hwy == max(hwy)) %>% 
               select(model))
}

# What was the most efficient honda model of 1995?
Honda.hwy.1995 <- MostHwyVehicle(1995, 'Honda')

