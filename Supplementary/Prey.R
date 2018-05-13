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

a = 1
b = 2
d = 0.5
r = 1 # Model parameters
x = c(0.1)
y = c(0.1)
dt =.01 # step size for numerical integration
t = seq(0,40,dt) # integration period

for (i in 1:length(t)){
  x1 = x[length(x)]
  y1 = y[length(y)]   # the last element
  x2=x1+dt*(a*x1-b*x1*y1) # Euler integration
  y2=y1+dt*(d*x1*y1-r*y1) # Euler integration
  x = append(x,x2)
  y = append(y,y2)
  if (i %in% seq(1,4001,20)){
    name <- rename(i)
    png(name)
    par(mar = c(0,0,0,0))
    plot(x,ylim=c(0, 20),xlim = c(0,4001))
    points(y,col = "red")
    dev.off()
  }
}
my_command <- 'convert *.png prey40.gif'
system(my_command)

#legend(['Rabbits','Foxes']);