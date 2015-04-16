#Rewriting the info from r-tutor.com in a condensed space for my own learning
#as well as a class presentation on R.
#brupoon

x = 3 #defaults to numeric
y = 3.14 #also numeric
z = as.integer(3) #is now an integer
z = as.integer(3.14) #becomes 3, rounding.

#Note, cannot parse a non-decimal string. "coercion"
as.integer("Bob")

#booleans as numerics
as.integer(TRUE) #1
as.integer(FALSE) #0

#logical values
u = TRUE; v = FALSE
u & v
u | v
!u

#characters
first = "Brunston"; last = "Poon"
paste(first, last)
sub("little", "big", "Mary has a little lamb.")

#vector is a sequence of data elements of the same type
ourvector <- c(2,3,4)
length(ourvector)
#vector arithmetic
#1-based indices UGH

#matrices
a = matrix(
	c(2,4,3,1,5,7)
	nrow = 2, #number of rows
	ncol = 3, #number of columns
	byrow = TRUE #fill by row
)

#list is a generic vector (can have elements of different classes)

#data frame is used for storing data tables. It is a list of vectors of equal length.
n = c(2,3,5)
s = c("a", "b", "c")
b = c(TRUE, FALSE, TRUE)
df = data.frame(n,s,b) #df is a data frame

#http://www.r-tutor.com/gpu-computing/clustering/distance-matrix
#Distance Matrix work

random.vectors <- function(dim, num, seed = 17) {
	set.seed(seed) #sets the seed for the random number generator
	matrix(rnorm(dim * num), nrow = num) #creates a matrix with random values
}

m <- random.vectors(256, 4096) #4096 random vectors in 256 dimensions

system.time(dist(m)) #euclidean
system.time(rpuDist(m)) #uses euclidian distances by default
system.time(rpuDist(random.vectors(256, 8192))) #no problem
system.time(rpuDist(random.vectors(1024,16384))) #still no problem

#optional
#Hierarchical cluster analysis
d <- rpuDist(as.matrix(mtcars))   # find distance matrix 
hc <- hclust(d)                # apply hirarchical clustering 
plot(hc)                       # plot the dendrogram 

m <- random.vectors(63, 2047)
d <- rpuDist(m)
#my hclust crashes, use fastcluster
library('fastcluster')
system.time(hclust(d))
system.time(rpuHclust(d))

#OPTIONAL
#Fun with correlation coefficients
#kendall rank: (number of concordant pairs - number of discordant pairs / (n(n-1)/2))

library(MASS) #where survey is located
head(survey) #first few entries of survey.
smoke <- as.numeric(factor(survey$Smoke, 
    levels=c("Never","Occas","Regul","Heavy")))
exer <- as.numeric(factor(survey$Pulse,
	levels=c("None", "Some", "Freq")))
m <- cbind(exer, smoke)
cor(m, method="kendall", use="pairwise")
