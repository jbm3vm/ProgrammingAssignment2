## The following functions work together to cache and retrieve the inverse of a matrix object.


## This function allows the user to create a list of functions which set and get the value of a matrix 
## and set and get the value of the matrix's inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



## This function utilizes the list of functions generated by the function makeCacheMatrix to retrieve the inverse of the set matrix 
## and print it to the console.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
