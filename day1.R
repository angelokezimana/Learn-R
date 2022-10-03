data() # pre-loaded data-sets
data(sleep) # Student's Sleep Data
ls()
head(sleep)
length(sleep)
summary(sleep)

##########################################################
# data types of R:                                       #
# integers, numerics, characters, logicals, and factors. #
##########################################################

# Integers
# Long-storage integers are written with L
10L          # 10
class(10L)   # "integer"
?class # for more information on the class() function.
# In R, every single value, like 5L, is considered a vector of length 1
length(5L)  # 1
# You can have an integer vector with length > 1 too:
c(4L, 5L, 8L, 3L)          # 4 5 8 3
length(c(4L, 5L, 8L, 3L))  # 4
class(c(4L, 5L, 8L, 3L))   # "integer"

# NUMERICS
# A "numeric" is a double-precision floating-point number
5           # 5
class(5)    # "numeric"
# Everything in R is a vector;
# you can make a numeric vector with more than one element
c(3, 3, 3, 2, 2, 1) # 3 3 3 2 2 1
# You can use scientific notation too
5e4         # 50000
6.0221408e23     # Avogadro's number
1.6e-35     # Planck length
# You can also have infinitely large or small numbers
class(Inf)  # "numeric"
class(-Inf) # "numeric"
# You might use "Inf", for example, in integrate(dnorm, 3, Inf);
# this obviates Z-score tables.

# BASIC ARITHMETIC
# You can do arithmetic with numbers
# Doing arithmetic on a mix of integers and numerics gives you another numeric
10L + 66L   # 76    # integer plus integer gives integer
class(10L + 66L)
53.2 - 4    # 49.2  # numeric minus numeric gives numeric
class(53.2 - 4)
2.0 * 2L    # 4     # numeric times integer gives numeric
class(2.0 * 2L)
3L / 4      # 0.75  # integer over numeric gives numeric
3 %% 2      # 1     # the remainder of two numerics is another numeric
# Illegal arithmetic yields you a "not-a-number":
0 / 0       # NaN
class(NaN)  # "numeric"
# You can do arithmetic on two vectors with length greater than 1,
# so long as the larger vector's length is an integer multiple of the smaller
c(1, 2, 3) + c(1, 2, 3)     # 2 4 6
# Since a single number is a vector of length one, scalars are applied 
# elementwise to vectors
(4 * c(1, 2, 3) - 2) / 2    # 1 3 5
# Except for scalars, use caution when performing arithmetic on vectors with 
# different lengths. Although it can be done, 
c(1, 2, 3, 1, 2, 3) * c(1, 2)               # 1 4 3 2 2 6
# Matching lengths is better practice and easier to read most times
c(1, 2, 3, 1, 2, 3) * c(1, 2, 1, 2, 1, 2)   # 1 4 3 2 2 6

# CHARACTERS
# There's no difference between strings and characters in R
"Kezimana"           # "Kezimana"
class("Kezimana")    # "character"
class("K")          # "character"
# Those were both character vectors of length 1

# Here is a longer one:
c("alef", "bet", "gimmel", "dalet", "he")
# => "alef"   "bet"    "gimmel" "dalet"  "he"
length(c("Call","me","Ishmael")) # 3
# You can do regex operations on character vectors:
substr("Fortuna multis dat nimis, nulli satis.", 9, 15)  # "multis "
gsub('u', 'ø', "Fortuna multis dat nimis, nulli satis.") # "Fortøna møltis dat nimis, nølli satis."
# R has several built-in character vectors:
letters
# =>
#  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s"
# [20] "t" "u" "v" "w" "x" "y" "z"
month.abb # "Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec"

# LOGICALS
# In R, a "logical" is a boolean

class(TRUE)     # "logical"
class(FALSE)    # "logical"
# Their behavior is normal
TRUE == TRUE    # TRUE
TRUE == FALSE   # FALSE
FALSE != FALSE  # FALSE
FALSE != TRUE   # TRUE
# Missing data (NA) is logical, too
class(NA)       # "logical"
# Use | and & for logic operations.
# OR
TRUE | FALSE    # TRUE
# AND
TRUE & FALSE    # FALSE
# Applying | and & to vectors returns elementwise logic operations
c(TRUE, FALSE, FALSE, TRUE) | c(FALSE, TRUE, FALSE, TRUE)   # TRUE TRUE FALSE TRUE
c(TRUE, FALSE, TRUE) & c(FALSE, TRUE, TRUE)     # FALSE FALSE TRUE
# You can test if x is TRUE
isTRUE(TRUE)    # TRUE
# Here we get a logical vector with many elements:
c("Z", "o", "r", "r", "o") == "Zorro"   # FALSE FALSE FALSE FALSE FALSE
c("Z", "o", "r", "r", "o") == "Z"       # TRUE FALSE FALSE FALSE FALSE

# FACTORS
# The factor class is for categorical data
# Factors can be ordered (like grade levels) or unordered (like colors)
factor(c("blue", "blue", "green", NA, "blue"))
#  blue blue green   <NA>   blue
# Levels: blue green
# The "levels" are the values the categorical data can take
# Note that missing data does not enter the levels
levels(factor(c("green", "green", "blue", NA, "blue"))) # "blue" "green"
# If a factor vector has length 1, its levels will have length 1, too
length(factor("green"))         # 1
length(levels(factor("green"))) # 1

data(infert)             # "Infertility after Spontaneous and Induced Abortion"
levels(infert$education) # "0-5yrs"  "6-11yrs" "12+ yrs"

# NULL
# "NULL" is a weird one; use it to "blank out" a vector
class(NULL) # NULL
parakeet = c("beak", "feathers", "wings", "eyes")
parakeet # "beak"     "feathers" "wings"    "eyes"
parakeet <- NULL
parakeet # NULL

# TYPE COERCION
# Type-coercion is when you force a value to take on a different type
as.character(c(6, 8))   # "6" "8"
as.logical(c(1,0,1,1))  # TRUE FALSE  TRUE  TRUE
# If you put elements of different types into a vector, weird coercions happen:
c(TRUE, 4)          # 1 4
c("dog", TRUE, 4)   # "dog"  "TRUE" "4"
as.numeric("Bilbo")
# =>
# [1] NA
# Warning message:
# NAs introduced by coercion

# Also note: those were just the basic data types
# There are many more data types, such as for dates, time series, etc.



##################################################
# Variables, loops, if/else
##################################################

# VARIABLES
# Lots of way to assign stuff:
x = 5       # this is possible
y <- "1"    # this is preferred traditionally
TRUE -> z   # this works but is weird
# Refer to the Internet for the behaviors and preferences about them.

# LOOPS
# We've got for loops
for (i in 1:4) {
  print(i)
}
# We've got while loops
a <- 10
while (a > 4) {
  cat(a, "...", sep = "")
  a <- a - 1
}
# Keep in mind that for and while loops run slowly in R
# Operations on entire vectors (i.e. a whole row, a whole column)
# or apply()-type functions are preferred

# IF/ELSE
# Again, pretty standard
if (4 > 3) {
  print("4 is greater than 3")
} else {
  print("4 is not greater than 3")
}
# =>
# [1] "4 is greater than 3"

# FUNCTIONS
# Defined like so:
jiggle <- function(x) {
  x = x + rnorm(1, sd=.1) # add in a bit of (controlled) noise
  return(x)
}
# Called like any other R function:
jiggle(5)   # 5±ε. After set.seed(2716057), jiggle(5)==5.005043

##################################################
# The apply() family of functions
##################################################
mat <- matrix(nrow = 3, ncol = 2, c(1, 2, 3, 4, 5, 6))
mat
# =>
#      [,1] [,2]
# [1,]    1    4
# [2,]    2    5
# [3,]    3    6
# Use apply(X, MARGIN, FUN) to apply function FUN to a matrix X
# over rows (MAR = 1) or columns (MAR = 2)
# That is, R does FUN to each row (or column) of X, much faster than a
# for or while loop would do
apply(mat, MAR = 2, jiggle)

# Other functions: ?lapply, ?sapply


##########################################################
name <- c("Alice", "Bob", "Angelo") #chr [1:3]
age <- c(23,56,70) #num [1:3] means "numeric vector with length 3"
length(age)
gender <- c("F", "M", "M")

friends <- data.frame(name, age, gender)
