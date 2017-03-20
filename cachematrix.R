## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { #initilizes objects with x as an empty matrix
    i <- NULL #creates placeholder in the environment so it can be called later in the function
    set <- function(y) { #setting function 'y' 
      x <<- y #assigns the value 'y' to our previously defined value 'x'
      i <<- NULL #assigns 'NULL' to 'i'. Clears any previously cached value assigned to 'i'
    }
    get <- function() x #retrieves function x from parent environment
    setinverse <- function(inverse) i <<- inverse #assigns the function and value to 'i' in the parent environment
    getinverse <- function() i #sets the value for 'i'
    list (set = set, #assigns each fucnction as element and returns to parent environment
          get = get,
          setinverse = setinverse,
          getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse() #calls getinverse function on imput object
  if (!is.null(i))  { #checks to see if result is 'NULL'
    message ("getting cached data")
    return(i)
  }
  data <- x$get()#gets object from imput data
  i <- solve(data, ...)
  x$setinverse(i) #uses setinverse function on imput object then returns the value on the inverse to parent environment by printing 'i'
  i
}
