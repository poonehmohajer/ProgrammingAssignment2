## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
library(matlib)

makeCacheMatrix <- function(x = matrix()) {
    m_inv <- NULL
    get <- function() x
    set <- function(y){
      x <<- y
      m_inv <<- NULL
    }
    getInverse <- function() m_inv
    setInverse <- function(inverse) m_inv <<- inverse
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInverse()
  if(is.null(inverse)){
    invt <- inv(x$get())
    x$setInverse(invt)
  }
  x$getInverse()
}
