## We create a special matrix which can cache its inverse 
##


## this function makes the special matrix for us with setter and getter for the matrix and its inverse
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


## returns the inverse of matrix from cache if exists else compute the inverse and set the cached inverse
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInverse()
  if(is.null(inverse)){
    invt <- solve(x$get())
    x$setInverse(invt)
  }
  x$getInverse()
}
