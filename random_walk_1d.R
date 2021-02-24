#n_exp=the numper of experiments, how many walks we have
#n_steps=number of steps

n_steps = 200; n_exp = 2000
plot(rep(0,n_steps+1),type="l", ylim = c(-n_steps,n_steps), xlab = "time", 
     ylab = "X_N", main = "Random Walk")
walks = c()
#we produce n_exp random walks
for(i in 1:n_exp) {
  deigma = sample(c(-1,1), n_steps, replace=TRUE)
  x = cumsum(c(0,deigma))
  walks = c(walks,x)
  #lines(x, col=rgb(runif(255),runif(255),runif(255)))
  lines(x,col=palette()[i%%8+1])
}

#we turn it into a 2d walk
walks_2d = matrix(walks, n_steps + 1, n_exp)

#mean value
plot(apply(walks_2d, 1, mean), ylim=c(-1,1), xlab="time",
     ylab="mean", main="mean value")

#standard diviation
plot(apply(walks_2d, 1, sd)^2, ylim=c(0,n_steps), xlab="time",
     ylab="standard deviation^2", main="standard deviation^2")
