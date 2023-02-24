## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
makeCacheMatrix <- function(m = matrix()){
	##This function create "invers_matrix" object
	##and return list of getter and setter functions

	invers_matrix <- NULL

	set_matrix <- function(x){
		m <<- x
		invers_matrix <<- NULL
	}
	set_invers <- function(x) invers_matrix <<- x
	get_matrix <- function() m
	get_invers <- function() invers_matrix

	list(set_matrix = set_matrix, 
		get_matrix = get_matrix, 
		set_invers = set_invers,
		get_invers = get_invers)
}



## Write a short comment describing this function
cacheSolve <- function(cache){
	##This function take cache from makeCacheMatrix
	##and solve the invers matrix
	##If the inverse has already been calculated, 
	##then retrieve the inverse from the cache.

	invers <- cache$get_invers()

	if ( !is.null(invers)){
		message('getting cache data')
		return (invers)		
	}

	matrix <- cache$get_matrix()
	invers <- solve(matrix)
	cache$set_invers(invers)

	invers
}

