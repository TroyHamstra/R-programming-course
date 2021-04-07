## Q 1: calculate the mean "Sepal.Length" for the species virginica
library(datasets)
data("iris")

library(data.table)
iris_dt <- as.data.table(iris)
iris_dt[Species == "virginica", round(mean(Sepal.Length)) ]

##Q2: What R code returns a vector of the means of the variables
##"Sepal. Length", "Speal.Width", "Petal.Length", "Petal.Width"
apply(iris[, 1:4], 2, mean)

#Q3: How can one calculate the avg mpg by number of cylinders in the car?
library(datasets)
data("mtcars")

with(mtcars, tapply(mpg, cyl, mean))

##Q4: what is the absolute difference between the average horsepower of
## 4-cylinder cars and the average horsepower of 8-cylinder cars?
mtcars_dt <- as.data.table(mtcars)
mtcars_dt <- mtcars_dt[,  .(mean_cols = mean(hp)), by = cyl]
round(abs(mtcars_dt[cyl == 4, mean_cols] - mtcars_dt[cyl == 8, mean_cols]))

##Q5: if you run debug(ls), wht happens when you next call the "ls" function?
debug(ls)

        # execution of "ls" will suspend at the beginning of the function
        # and you will be in the browser
