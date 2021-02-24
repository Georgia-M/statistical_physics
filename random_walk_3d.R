for(i in 1:n_exp) {
  
  m = disp[,sample(6,n_steps,replace=TRUE)]
  m = cbind(c(0,0,0), m)
  xyz = apply(m,1, cumsum)
  
  if(i==1)
    lines3D(xyz[,1],xyz[,2],xyz[,3], box=TRUE, pch=16, main = "RandomWalk 3D", 
            xlab = "x-position", bty = "b2", axes = TRUE, label = TRUE,
            colkey = FALSE, type = "l", nticks=5, ticktypes = "detailed", 
            ylab = "y-position", zlab = "z-posiiton", xlim = c(-10,10), 
            ylim=c(-10,10), zlim=c(-10,10), theta = 40, phi = 40)
  else
    lines3D(xyz[,1],xyz[,2],xyz[,3] ,box=TRUE, pch=16, main = "RandomWalk 3D", 
            xlab = "x-position", bty = "b2", axes = TRUE, label = TRUE,
            colkey = FALSE, type = "l", nticks=5, ticktypes = "detailed", 
            ylab = "y-position", zlab = "z-posiiton", xlim = c(-10,10), 
            ylim=c(-10,10), zlim=c(-10,10), theta = 40, phi = 40, add=TRUE)
  
  
  total_sum = total_sum + apply(xyz, 2, sum)
  total_sd2 = total_sd2 + apply(xyz^2, 1, sum)
  
} #end of for(i)

plot(total_sd2/n_exp, ylim=c(0,n_steps), xlab="time", 
     ylab="r^2", main="mean r^2 vs time")
     
