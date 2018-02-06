## Put comments here that give an overall description of what your
## functions do
#These functions cache the inverse of a provided matrix.
## Write a short comment describing this function

#This function  creates a special object that is the inverse of the matrix
#supplied. It sets the matrix, gets it, and sets functions to solve
makeCacheMatrix <- function(x = matrix()) {
  # Scrub the solved matrix
  solved <- NULL
  # Function to change the target matrix
  set <- function(newSet) {
    x <<- newSet
    solved <<- NULL
  }

  # Function to retrieve the stored matrix
  get <- function() x
  # Function to invert supplied matrix
  setSolve <- function() solved <<- solve(x)

  # Function get inverted matrix
  getSolve <- function() solved
  # Retun list of functions
  list(set = set, get = get, setSolve = setSolve, getSolve = getSolve)
}

cacheSolve <- function(x) {
  # Grab the cached inverted matrix
  solved <- x$getSolve()
  # If cached, returns that inverted matrix and exits
  if (!is.null(solved)) {
    return(solved)
  }

  # Does inversion instead
  solve(x$get())
}

# Example
inputMatrix <- matrix(seq(1,4),nrow = 2, ncol = 2)
cachedMatrix <- makeCacheMatrix(inputMatrix)
cacheSolve(cachedMatrix)
