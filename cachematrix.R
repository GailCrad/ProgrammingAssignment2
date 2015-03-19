## code source:  desktop>coursera>ProgrammingAssignment2>cachematrix.R
## programmer:   SGC, Raleigh,NC

## Function creates a sepcial matrix which
## * Sets the value of the matrix
##   Gets the value of the matrix
##   Sets the value of the matrix inverse
##   Gets the value of the matrix inverse
makeCasheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  matrix(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


##The following function calculates the inverse of the special "matrix" 
##created with the above function. However, it first checks to see 
##if the inverse has already been calculated. If so, it gets the inverse
##from the cache and skips the computation. Otherwise, it calculates 
##the inverse of the data matrix and 
##sets the value of the inverse in the cache via the setsolve function.


cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}