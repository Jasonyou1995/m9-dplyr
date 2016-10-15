# Exercise 3: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1


# Install devtools package: allows installations from GitHub
install.packages('devtools')
library(dplyr)

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# Which Accura model has the best hwy MPG in 2015? (without method chaining)
Acura.2015 <- filter(vehicles, make == 'Acura', year == 2015)
Acura.2015.2 <- filter(Acura.2015, hwy == max(hwy))
best.Accura.2015 <- select(Acura.2015.2, model)

# Which Accura model has the best hwy MPG in 2015? (nesting functions)
best.Accura.2015.2 <- select(
                        filter(
                            filter(vehicles, make == 'Acura', year == 2015)
                            , hwy == max(hwy)),  model)

# Which Accura model has the best hwy MPG in 2015? (pipe operator)
best.Accura.2015.3 <- filter(vehicles, make == 'Acura', year == 2015) %>% 
                        filter(hwy == max(hwy)) %>% 
                            select(model)

### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times
FindModel1 <- function(my_make, my_year) {
    a <- filter(vehicles, make == my_make, year == my_year)
    b <- filter(a, hwy == max(hwy))
    result <- select(b, model)
    return(result)
}

FindModel2 <- function(my_make, my_year) {
    result <- select(
        filter(
            filter(vehicles, make == my_make, year == my_year)
            , hwy == max(hwy)),  model)
    return(result)
}

FindModel3 <- function(my_make, my_year) {
    result <- filter(vehicles, make == my_make, year == my_year) %>% 
        filter(hwy == max(hwy)) %>% 
        select(model)
    return(result)
}
