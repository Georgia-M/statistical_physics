n_steps = 20; n_exp = 200

#it can 'walk' in 4 directions, north, south, east and west
disp = matrix(c(1,0,-1,0,0,1,0,-1), 2, 4)
print(disp)

walks = c()

for(i in 1:n_exp) {
  
  m = disp[,sample(4,n_steps,replace=TRUE)]
# m = the random direction the walk can take
  m = cbind(c(0,0),m)
# we set as the first point the (0,0)
  x = apply(m,1, cumsum)
  
  if(i==1)
    plot(x, type='l', main = "RandomWalk 2D", xlab = "x-position", ylab = "y-position",
         xlim = c(-10,10), ylim=c(-10,10))
  else
    points(x, type="l", col=palette()[i%%8+1]) #every walk has a different color
}

#other way to put colors:
#else
  #lines(x, col=rgb(runif(255),runif(255),runif(255)))
  #lines(x,col=palette()[i%%8+1])
