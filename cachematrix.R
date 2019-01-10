## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL       ##Using inv as NULL to hold the matrix inverse value
set <- function(y) {
x <<- y           ## Matrix value setting in parent environment
inv <<- NULL	## If there is a new matrix the inv would reset to NULL
}
get <- function() x 
setinverse <- function(inverse) inv <<- inverse		##inv value is assigned in parent environment
getinverse <- function() inv
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)		## For reference to the functions with $ operator
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
inv <- x$getinverse()
     if(!is.null(inv)) {
         message("getting cached data")
         return(inv)
     }
     data <- x$get()
     inv <- solve(data, ...)
     x$setinverse(inv)
     inv
}
