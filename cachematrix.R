## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL       ##Using inv as NULL to hold the matrix inverse value
set <- function(y) {   ## To assign new set function is to be defined
x <<- y           ## Matrix value in parent environment
inv <<- NULL	## If there is a new matrix the inv would reset to NULL
}
get <- function() x 
setinverse <- function(inverse) inv <<- inverse		##inv value is assigned in parent environment
getinverse <- function() inv                          ## gets the value of inv wherever called
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)		## For reference to the functions with $ operator
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {                      
        ## Return a matrix that is the inverse of 'x'
inv <- x$getinverse()				##get the inv value from the makecachematrix function
     if(!is.null(inv)) {			## if inv is not NULL
         message("receiving cached data")	## type message: getting cached data
         return(inv)				## return inv value
     }
## if the inv value is NULL then
     data <- x$get()				## get original matrix
     inv <- solve(data, ...)			## use solve function to inverse the matrix
     x$setinverse(inv)				## set the inverse
     inv						## return the inverse value
}
