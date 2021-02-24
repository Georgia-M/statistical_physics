#from 50 to 11 with step -3
seq(50,11, by=-3)
#power of 2, from 0 to 10
2^(0:10)

#matrix with 16 figures, each row has 4 
t(matrix(1:16, 4))
#[row,column]
x=t(matrix(1:16,4))
print(x[3,])
#prints only the 3rd row
x1=x[1,]
print(x1)
#prints the 1st row

matrix(1:16, 4, byrow=TRUE)

matrix(seq(50,4, by=-3),4,byrow=TRUE)
matrix(seq(50,4, by=-3),4)
#the same

matrix(1:0,5,5)
print(matrix(1:0,5,5))
#gives error because the last one is 1, mtrix is too big
#it needs a matrix with even number
print(matrix(1:0,5,6))
matrix(rep(1:0, length.out=25),5,5)

sample(10)
#prints all numbers from 1 to 10 disarranged
sample(1:10)
#same

#experiment with 4 circumstances a,b,c,d
#rep=repetition
ex=rep(1:4, each=5)
print(ex)

sample(ex)
#here: a=1, b=2, c=3, d=4
#we turn it into letters
LETTERS(ex) 
#from letters
LETTERS[ex]

lets=c("A","B","C","D") #c:column
lets[ex]
#we turn 1->A etc

lets[1] #lets: matrix that turns numbers into letters 
lets[1,1,1,2,2,2,3] #error: it needs c for column:
lets[c(1,1,1,2,2,2,3)]

lets[c(1,1,2,5)]
#it turns NA in the position of 5, the matrix lets(from letters) we have made has 4 elements
#NA = not avalaible

#we "sample" for the experiment to have a statistical meaning
LETTERS[sample(ex)] 

names=c("George","Mike","Nick","Arthur")
names[ex] #puts a number in each name according to the order of ex, 1->George etc
names[sample(ex)] #the elements of the matrix ex, in names and in random order

#random walk
D = sample(c(-1,1), 25, replace = TRUE)
print(D)

#all the x we want to compute
cumsum(D) #comulated sum, sum of all the points up to the point we are at the moment 

x = c(0, cumsum(D)) #its position, x, matrix that starts for 0 and the rest elements are the previous sum 
print(x)

plot(x, typy="l") #diagram of the walk

D = sample(c(-1:1),100, replace = TRUE)
x=c(0, cumsum(D))
plot(x, type = "l")
