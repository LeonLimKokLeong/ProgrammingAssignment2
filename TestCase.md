
source("cachematrix.R")

### Create a special matix a
a <- makeCacheMatrix(matrix(1:4,2))

### Get a
a$get()

### Currently does not have a Inverse
a$getinverse()

### You can set a as a new matrix
a$set(matrix(c(1,1,1,3,4,3,3,3,4),nrow=3))

### Get a
a$get()

### using cacheSolve to inverse the matrix
cacheSolve(a)

### Since the matix was previously inverse, it gets from cache
cacheSolve(a)

### Now you can get the inverse
a$getinverse()

### Set b as the inverse of a and shows the inverse is correct
b = a$getinverse()
a$get() %*% b
