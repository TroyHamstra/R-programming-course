## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## There are two functions: makeCacheMatrix & cacheSolve
## makeCacheMatrix consists of set, get, setInverse, getInverse

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL                  #initializes inverse as NULL object
        set <- function(y){          #set value of matrix
                x <<- y              #<<- works on parent function
                inv <<- NULL 
        }
        get <- function() {x}           #function to form matrix x
        setInverse <- function(inverse) {inv <<- inverse}
        getInverse <- function() {inv}
        list(set = set, get = get,
             setInverse = setInverse, 
             getInverse = getInverse)
}


## this function computes the inverse of the matrix using the previous function
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()
        if (!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        mat <- x$get()
        inv <- solve(mat, ...)       #use solve to compute inverse of matrix
        x$setInverse(inv)           #set the value in the cache
        inv
}
