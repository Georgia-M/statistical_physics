binseq <- function(N) {
  expand.grid(replicate(N, c(-1,1), simplify=FALSE))
}

all.configs <- function(N) {
  X <- binseq(N*N)
  data <- list()
  for (i in 1:(2^{N*N})) {
    data[[i]] <- matrix(X[i,], nrow = N, ncol = N)
  }
  data #returns data
}

#save data
all.configs.2 <- all.configs(2) #includes all the 2Χ2 matrixes
all.configs.3 <- all.configs(3)
all.configs.4 <- all.configs(4)

alldown.config <- function(N) { matrix(-1,N,N) }
allup.config <- function(N) { matrix(1,N,N) }

#random spin states
random.config <- function(N) {
  config <- matrix(0, N, N)
  for (i in 1:N) {
    for (j in 1:N) {
      config[i,j] <- 2*sample(0:1,1)-1
    }
  }
  config
}

plot.config <- function(config) {
  image(config, useRaster = TRUE, axes = FALSE, col = grey(seq(0, 1)))
}

#par(mfrow=c(2,2))
plot.all.configs = function(bla) {
  for(i in 1:length(bla)) {
    y=bla[[i]]; mode(y) = "numeric"; image(y,col=grey(seq(0,1)))
  }
}

#magnetization
magnetization <- function(config) { sum(as.vector(config))
}

#each spin has 4 neighbours, black = spin down, 
per.neigh <- function(N, i, j) {
  if (i == 1) im1 <- N else im1 <- i-1
  if (j == 1) jm1 <- N else jm1 <- j-1
  if (i == N) ip1 <- 1 else ip1 <- i+1
  if (j == N) jp1 <- 1 else jp1 <- j+1
  list(c(im1,j), c(i,jm1), c(i,jp1), c(ip1,j))
}
#(im1 = i minus 1)


#energy
energy <- function(config, J) {
  config <- as.matrix(config)
  N <- nrow(config);
  e <- 0;
  for (i in 1:N) {
    for (j in 1:N) {
      coord <- per.neigh(N,i,j)
      for (b in seq_along(coord)) {
        w <- coord[[b]]; 
        e <- e - (J * as.numeric(config[i,j]) * as.numeric(config[w[1],w[2]]))
      }
    }
  }
  e
}
bolz.fact <- function(energy, temp) { exp(- energy/temp)}

prob.config <- function(config, part, J, temp) {
  bolz.fact(energy(config, J), temp)/part
}





#### energy vs configurations  
ene =c()
for (i in 1:length(all.configs.4))
      ene = c(ene, energy(all.configs.4[[i]],1))
as.data.frame(table(ene))
#### plot random
#plot.config(random.config(100))

