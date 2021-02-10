mu = 23.20
sig = 4.5
n = 40
prom = 22
alfa = 0.05
ec = round((prom-mu)/(sig/sqrt(n)), 4)
zt = round(qnorm(alfa, mean = 0, sd = 1, lower.tail = TRUE), 4)

et = qnorm(alfa, mean = 0, sd = 1, lower.tail = TRUE)
regionX=seq(-10,et,0.01)            # Intervalo a sombrear
xP <- c(-10,regionX,et)             # Base de los polígonos que crean el efecto "sombra"
yP <- c(0,dnorm(regionX,0,1),0)

plot(c(-4, 4), c(-0.1, 0.4), type="n", axes=NULL)
curve(dnorm(x,0,1),yaxs="i", lwd=2, add = TRUE,
           xlim=c(-3.5, 3.5),
           ylim=c(0,0.43),
           xlab = NULL,
           ylab=NULL, 
           axes=NULL)  
# cola derecha
polygon(-xP,yP,col="blue")
text(-et+1.0, 0.05, "R.C.")
text(-et, -0.03, round(-et,3))  
# cola izquierda
polygon(xP,yP,col="blue2", lwd= 2)
text(et-1.0, 0.05, "R.C.") 
text(et, -0.03,round(et,3))          
lines(c(ec, ec),c(0, dnorm(ec, 0, 1)), col="yellow", lwd= 3)
abline(h=0, lwd=2)
arrows(0,0,0,0.5, lwd= 2)
text(ec, dnorm(ec,0,1)+0.05, round(ec,3))  
text(0, 0.10,"R.A.")
