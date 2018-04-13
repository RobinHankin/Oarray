## minimal example showing the problems of evaluation within accessor
## methods.  Here we see an extractor method for the "foo" class,
## which uses match.call() in the same way as [.Oarray() of the Oarray
## package does.


rm(list=ls())

`[.foo` <- function(x, ...){
  mc <- match.call()

  cat("mc gives: ")
  print(mc)   # NB: cannot cat(mc) as cat() cannot handle language types.

  for(i in 1:6){
    cat(paste("mc[[",i, "]] gives: |",sep=""))
    cat(mc[[i]])
    cat("|\n")
  }

  cat("In the above, the output of print() is given between the two vertical lines.\n")

  for(i in 0:9){
    cat(noquote(paste("eval(mc[[5]],",i,") evaluates to " , eval(mc[[5]],i),"\n",sep="")))
  }

  print(noquote(paste("mc[[5]]  evaluates to " , eval(mc[[5]],i),sep="")))

  cat("\n\n\n\n\n")
  return(0)
}

a <- 0
class(a) <- "foo"

p <- 1
cat('a[,,p=2,]:\n')
a[,,p=2,]   

cat('a[,,p,]:\n')
a[,,p,]

## Now try some R idiom in which symbol p exists in multiple environments:

p <- 1   # not strictly necessary, this line is here to remind me that p=1 in the global environment
f <- function(a,p){ a[,,p,] }
cat('f(a,p=3):\n')
f(a,p=3)

cat('f(a,p):\n')
f(a,p)


g <- function(p){
  return(f(a,p))
}
cat("g(p):\n")
g(p=4)

h <- function(p){
  p <- 5
  return(f(a,p=6))
}
cat("h(p):\n")
h(p)

## Final example shows that p might not exist in all environments that might be accessed:
rm(p)
h(p=7)
