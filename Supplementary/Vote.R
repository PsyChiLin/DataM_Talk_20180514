# supporting libraries and functions
require(reshape2)
require(ggplot2)
library(reticulate)
py_available(T)
numpy <- import("numpy")
rename <- function(x){
  if (x < 10) {
    return(name <- paste('000',i,'plot.png',sep=''))
  }
  if (x < 100 && i >= 10) {
    return(name <- paste('00',i,'plot.png', sep=''))
  }
  if (x >= 100) {
    return(name <- paste('0', i,'plot.png', sep=''))
  }
}

# Model parameters:
# proportion of green
proportion <- 0.2 
# size of the grid world
sz <- 60 
frames <- 50

# initial world
X=matrix(as.integer(runif((sz*sz))<proportion),nrow=sz)
png(rename(1))
par(mar = c(0,0,0,0))
image(X,col = c("blue","green"),xaxt='n',yaxt='n')
dev.off()

# Modeling
m_1 <- as.integer(-1)
m0 <-  as.integer(0)
m1 <- as.integer(1)
for (i in 1:frames){
  Y=numpy$roll(X,m_1,m0)+numpy$roll(X,m1,m0)+numpy$roll(X,m_1,m1)+
    numpy$roll(X,m1 ,m1 )+numpy$roll(numpy$roll(X,m_1,m0),m_1,m1 )+
    numpy$roll(numpy$roll(X,m_1,m0),m1 ,m1 )+
    numpy$roll(numpy$roll(X,m1 ,m0),m_1,m1 )+
    numpy$roll(numpy$roll(X,m1 ,m0),m1,m1 )
  X[Y>4]=1
  X[Y<4]=0
  # save png
  name <- rename(i)
  png(name)
  par(mar = c(0,0,0,0))
  image(X,col = c("blue","green"),xaxt='n',yaxt='n',main = i)
  dev.off()
  Sys.sleep(0.05)
} 
# convert png to gif
my_command <- 'convert *.png -delay 3 -loop 1 animation.gif'
system(my_command)