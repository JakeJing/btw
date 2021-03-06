plotdiscrete = function (model, estimates=TRUE, main=NULL) {

# CREATE TRANSITION RATE MATRIX
mat = matrix(0, 4, 4, dimnames=list(c("00", "01", "10", "11"), c("00", "01", "10", "11")))
for (i in 1:4) {
	for (j in 1:4) {
		if (i != j  && sum(i,j) != 5) {
			mat[i,j] = mean(model[,grep(tail(paste("q", i, j, sep=""), 1), names(model))])
		} else mat[i,j] = NaN
	}
}

# PLOT
rates <- labs <- round(c(mat[1,2],mat[2,1],mat[2,4],mat[4,2],mat[4,3],mat[3,4],mat[3,1],mat[1,3]),2) 
if (estimates == F) {labs=rep("",8)}
if (is.null(main)) {main = ""}
plot(c(0,100), c(0,100), type = "n", xaxt = "n", yaxt = "n", xlab = "", ylab = "", main=main)
text(x=c(20, 80, 20, 80), y=c(80, 80, 20, 20), labels=c("00", "01", "10", "11"), cex=4)
text(x=c(50, 50, 93, 67, 50, 50, 7, 33), y=c(93, 67, 50, 50, 7,33, 50, 50), labels=labs, cex=0.75)
arrows(x0=c(35, 65, 85, 75, 65, 35, 15, 25), y0=c(85, 75, 65, 35, 15, 25, 35, 65), x1=c(65, 35, 85, 75, 35, 65, 15, 25), y1=c(85, 75, 35, 65, 15, 25, 65, 35), lwd=rates/max(rates, na.rm=T)*15)

}



