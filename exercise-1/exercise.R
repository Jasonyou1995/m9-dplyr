# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
require(fueleconomy)

# You should have have access to the `vehicles` data.frame
v.data <- vehicles

# Create a data.frame of vehicles from 1997
v.from1997 <- v.data[v.data$year == 1997,]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(v.from1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel.20cty <- v.data[v.data$drive == '2-Wheel Drive' & v.data$cty > 20,]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.hwy.id <- v.data$id[v.data$hwy == max(v.data$hwy)]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year (return an id?)
MostHwyVehicle <- function(year, make) {
    dat <- v.data[v.data$year == year & v.data$make == make,]
    return(dat$id[dat$hwy == min(dat$hwy)])
}

# What was the most efficient honda model of 1995?
MostHwyVehicle(1995, 'Honda')

