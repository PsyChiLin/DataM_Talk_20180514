# supporting functions for GIF
rename <- function(x){
  if (x < 10) {
    return(name <- paste('0000',i,'plot.png',sep=''))
  }
  if (x < 100 && i >= 10) {
    return(name <- paste('000',i,'plot.png', sep=''))
  }
  if (x < 1000 && i >= 100) {
    return(name <- paste('00', i,'plot.png', sep=''))
  }
  if (x > 1000) {
    return(name <- paste('0', i,'plot.png', sep=''))
  }
}

# Model parameters
a = 1
b = 2
d = 0.5
r = 1 
# initial value
x = c(0.1)
y = c(0.1)
# step size for numerical integration
dt =.01 
# integration period
t = seq(0,40,dt) 

# Modeling
for (i in 1:length(t)){
  # the last element
  x1 = x[length(x)]
  y1 = y[length(y)]   
  # Euler integration
  x2=x1+dt*(a*x1-b*x1*y1) 
  y2=y1+dt*(d*x1*y1-r*y1) 
  x = append(x,x2)
  y = append(y,y2)
  # Save png
  if (i %in% seq(1,4001,20)){
    name <- rename(i)
    png(name)
    par(mar = c(0,0,0,0))
    plot(x,ylim=c(0, 20),xlim = c(0,4001))
    points(y,col = "red")
    dev.off()
  }
}
# covert png to gif
my_command <- 'convert *.png prey40.gif'
system(my_command)