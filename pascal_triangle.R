#matrix dimensions
matrix1 <- matrix(0,20,20) #empty matrix

matrix1[1,10]<- 1

for(i in 2:20) for(j in 2:19) 
  if(j-1 !=0){matrix1[i,j]<-(matrix1[i-1,j+1]+matrix1[i-1,j-1])} #else {matrix1[i,j]<-matrix1[i-1,j]}

print.table(matrix1)

#for matrixes with more dimensions
#we set a limit
limit<-10
matrix2<-matrix(0,limit,limit)
matrix2[1,5]<- 1
for(i in 2:limit) for(j in 1:limit) 
  if(j-1 !=0){matrix2[i,j]<-(matrix2[i-1,j]+matrix2[i-1,j-1])} else {matrix2[i,j]<-matrix2[i-1,j]}
print.table(matrix2)
