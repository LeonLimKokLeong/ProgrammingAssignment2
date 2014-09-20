## Put comments here that give an overall description of what your functions do

## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix())
{
            
            m <- NULL
            
            ## set the value of the matrix
            set <- function(y)
            {
                        x <<- y
                        m <<- NULL
            }
            
            ## get the value of the matrix
            get <- function() x
            
            ## set the value of the inverse using solve
            setinverse <- function(mean) m <<- mean
            
            ## get the value of the inverse using solve
            getinverse <- function() m
            list(set = set, get = get,
                 setinverse = setinverse,
                 getinverse = getinverse)
}

## This function computes the inverse of the special "matrix" returned by
## makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...)
{
            ## Return a matrix that is the inverse of 'x'
            
            m <- x$getinverse()
            ## Check if the inverse has already been calculated.
            if(!is.null(m))
            {
                        ## Gets the inverse from the cache and skips the computation.
                        message("getting cached data")
                        
                        ## Return the inverse matrix
                        return(m)
            }
            
            data <- x$get()
            
            ## Calculates the inverse
            m <- solve(data, ...)
            
            ## sets the inverse value in the cache via the setinverse function.
            x$setinverse(m)
            
            ## Return the inverse matrix
            m
}
