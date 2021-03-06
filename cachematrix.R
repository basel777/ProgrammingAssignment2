# "Matrix inversion is usually a costly computation and there may be some benefit to 
# caching the inverse of a matrix rather than compute it repeatedly." 

# makeCacheMatrix creates a list containing a function to:
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(mtrx = matrix()) {
  inverse <- NULL
  set <- function(x) {
    mtrx <<- x;
    inverse <<- NULL;
  }
  get <- function() return(mtrx);
  setinv <- function(inv) inverse <<- inv;
  getinv <- function() return(inverse);
  return(list(set = set, get = get, setinv = setinv, getinv = getinv))
}


# The following function returns the inverse of the matrix. First, it check to see if the inverse
# has already been computer. If true, then it pulls the result and skips the rest of the code.
# If not, it calculates the inverse and uses the setinverse function to establish the value
# in the cache.

cacheSolve <- function(mtrx, ...) {
  inverse <- mtrx$getinv()
  if(!is.null(inverse)) {
    message("Getting cached data...")
    return(inverse)
  }
  data <- mtrx$get()
  invserse <- solve(data, ...)
  mtrx$setinv(inverse)
  return(inverse)
}
