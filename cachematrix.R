These functions are used to create a special object that stores a matrix and caches its inverse.
Here,makeCacheMAtrix is the special matrix which sets the value of the matrix and gets 
the value of the matrix(likewise for the matrix inverse.)

makeCacheMatrix <- function(x = matrix()) {
 i <- NULL
  set <- function(y) {
          x <<- y
          i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

This function calculates the inverse of the special matrix.If the inverse has already been calculated,then cacheSolve retrieves that inverse.

cacheSolve <- function(x, ...) {
         i <- x$getinverse()
  if (!is.null(i)) {
          message("getting cached data")
          return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
