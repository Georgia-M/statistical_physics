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


#other way to put colors:
  #else
    #lines(x, col=rgb(runif(255),runif(255),runif(255)))
    #lines(x,col=palette()[i%%8+1])

  #total_sum=the mean value from all the walks
  total_sum = total_sum + apply(xy, 2, sum)
  #sum of the square values of all the positions xy
  total_sd2 = total_sd2 + apply(xy^2, 1, sum)
  
} #end of for(i)

plot(matrix(total_sum/n_steps/n_exp, 1, 2), xlim=c(-1,1), ylim=c(-1,1), xlab="mean x", 
     ylab="mean y", main="mean value")
plot(total_sd2/n_exp, ylim=c(0,n_steps), xlab="time", 
     ylab="r^2", main="mean r^2 vs time")
