require(dplyr)
mtcars.named <- mutate(mtcars, car.name = row.names(mtcars))
best.car.name <- select(
    filter(
        filter(
            mtcars.named,
            cyl == 4
        ),
        mpg == max(mpg)
    ), car.name
)
#++++++#++++++#
mtcars.named <- mutate(mtcars, car.name = row.names(mtcars))
best.car.name <- filter(mtcars.named, cyl==4) %>% filter(mpg == max(mpg)) 
