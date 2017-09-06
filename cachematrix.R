## Put comments here that give an overall description of what your functions do
# The function makeCacheMatrix creates a  "matrix" object that caches its inverse; 
#the cacheSolve function calculate the Inverse of that Matrix if the Inverse has not yet been calculated 
#First, two objects are created ("x" and "inv"), which are placeholders for the Matrix and its Inverse.
#In the "set" function values for the above mentioned objects are assigned to the parent environment, "get" takes "x" from the parent environment.
#"setinv" & "getinv" assign/get the data of "inv" to/from the parent environment;
#at the end, all functions are assigned to a list, which can be called in cacheSolve
makeCacheMatrix <- function(x = matrix()) { 
        inv <- NULL
        set <- function (y) {      
                x <<- y      
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(solve) inv <<- solve
        getinv <- function() inv
        list(set = set, get = get,
             setinv= setinv, getinv = getinv)
}
##The function cacheSolve uses the argument "x" like the function before. First, the Inverse is retrieved from the list
#and given out if not zero.
#If "inv" is NULL, the Matrix "x" is assigned to "data" and "inv" calculates the Inverse of the data, which is passed to "setinv"
#of "makeCacheMatrix". Finally, the Inverse "inv" is printed.

cacheSolve <- function(x, ...) {
inv <- x$getinv()
if(!is.null(inv)){
message("getting cached data")
return(inv)
}
data <- x$get()
     inv <- solve(data)  
        x$setinv (inv)  
        inv
}        
