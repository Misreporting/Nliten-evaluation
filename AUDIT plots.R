library(gplots)
library(foreign)
library(mosaic)
#library(nlme)
#library(mice)
#library(zoib)
trellis.par.set(theme = col.mosaic()) 

### Oct 11, 2020
## These are the final plots in figure 2
# Condom use percentage difference, AUDIT score difference, drinking context score difference
## Semiparametric regression results predicting condom use percentage, AUDIT score, and drinking context score with respective baseline measurement as non-linear term 




par(mfrow=c(3, 1))

CU=100*matrix(c(
			 .1217765 , .1394398, 
			.0717711  ,  .1781948 ,
			.0189385,  .1261943 ,
			.0225062 ,  .1140176), byrow=T, ncol=2, nrow=4)

CU.l=100*matrix(c(
				 .033576 ,  .0473391,
			 -.0272657 ,   .0770455,
			  -.085244,  .0232729,
			  -.0843385, .0071813 ), byrow=T, ncol=2, nrow=4)
			
CU.u=100*matrix(c(
			 .209977, .2315405,
			.170808,   .2793441,
			.123121, .2291157,
			 .129351, .2208539), byrow=T, ncol=2, nrow=4)


gplots::plotCI(CU[,1], li=CU.l[,1], ui=CU.u[,1], xlim=c(0.5, 5), ylim=c(-10, 40), pch=1, axes=F, lty=1, sfrac=0, gap=0, ylab="", xlab="", col="grey", barcol="grey")
par(new=T)
gplots::plotCI(CU[,2], li=CU.l[,2], ui=CU.u[,2], xlim=c(0.5, 5), ylim=c(-10, 40), x=c(1.2, 2.2, 3.2, 4.2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Condom use percentage difference", xlab="Followup wave", col="black", barcol="black")
par(new=T)
abline(h=1, lty=3)
axis(side=2)
axis(side=1, at=1:4, labels=c("3 mo.\nn=425", "6 mo.\nn=384", "9 mo.\nn=363", "12 mo.\nn=376"), lwd=0, lwd.ticks=0)
legend(4.3, 40, c("Horizons", "Horizons+GMET"), col=c("grey", "black"), ncol=1, bty="n", cex=0.9, pch=c(1,20))



AUDIT=matrix(c(-1.196929, -1.225789 ,
			 -2.563726,  -1.84358, 
			 -.9937452,  -.7064104 , 
			 -.6493545, -.9912035), byrow=T, ncol=2, nrow=4)

AUDIT.l=matrix(c(-2.439411,   -2.498179,
				 -3.685596,  -2.968861 ,
			     -2.221342 ,  -1.917731 ,
			   -1.770075,   -2.099958), byrow=T, ncol=2, nrow=4)
			
AUDIT.u=matrix(c(.0455528, .0466007,
			-1.441856, -.7182987,
			.2338513, .5049099,
			 .4713664,   .117551), byrow=T, ncol=2, nrow=4)


gplots::plotCI(AUDIT[,1], li=AUDIT.l[,1], ui=AUDIT.u[,1], xlim=c(0.5, 5), ylim=c(-4, 1.5), pch=1, axes=F, lty=1, sfrac=0, gap=0, ylab="", xlab="", col="grey", barcol="grey")
par(new=T)
gplots::plotCI(AUDIT[,2], li=AUDIT.l[,2], ui=AUDIT.u[,2], xlim=c(0.5, 5), ylim=c(-4, 1.5), x=c(1.2, 2.2, 3.2, 4.2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="AUDIT score difference", xlab="Followup wave", col="black", barcol="black")
par(new=T)
abline(h=0, lty=3)
axis(side=2)
axis(side=1, at=1:4, labels=c("3 mo.\nn=482", "6 mo.\nn=458", "9 mo.\nn=452", "12 mo.\nn=463"), lwd=0, lwd.ticks=0)
#legend(3.5, 1.5, c("Horizons", "Horizons+GMET"), col=c("grey", "black"), ncol=1, bty="n", cex=0.9, pch=c(1,20))



## Nov 1, Dec 20:  Plot semi-parametric regression results Alcohol Context and AUDIT score:  Any Horizons, Horizons + GMET

AC=matrix(c(-2.09, -1.75,
			 -1.44, -1.38, 
			 -1.00, -0.57, 
			 -1.68, -2.30), byrow=T, ncol=2, nrow=4)

AC.l=matrix(c(-3.66,  -3.37,
				-3.09, -3.01,
			    -2.657374 ,  -2.203871,
			  -3.208568,  -3.811159), byrow=T, ncol=2, nrow=4)
			
AC.u=matrix(c(-0.51, -0.14,
			-.5148836, -.138596,
			.6514365, 1.056206,
			 -.146981,  -.7836142), byrow=T, ncol=2, nrow=4)


gplots::plotCI(AC[,1], li=AC.l[,1], ui=AC.u[,1], xlim=c(0.5, 5), ylim=c(-4, 1.5), pch=1, axes=F, lty=1, sfrac=0, gap=0, ylab="", xlab="", col="grey", barcol="grey")
par(new=T)
gplots::plotCI(AC[,2], li=AC.l[,2], ui=AC.u[,2], xlim=c(0.5, 5), ylim=c(-4, 1.5), x=c(1.2, 2.2, 3.2, 4.2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Drinking context score difference", xlab="Followup wave", col="black", barcol="black")
par(new=T)
abline(h=0, lty=3)
axis(side=2)
axis(side=1, at=1:4, labels=c("3 mo.\nn=482", "6 mo.\nn=458", "9 mo.\nn=452", "12 mo.\nn=463"), lwd=0, lwd.ticks=0)
#legend(3.5, 1.5, c("Horizons", "Horizons+GMET"), col=c("grey", "black"), ncol=1, bty="n", cex=0.9, pch=c(1,20))




##############












## Plot results for weekly binge drinking, at least 3 drinks at a time, more than once a week.
## Nov 1:  Feb7:  Plot semi-parametric regression results condom use: 
##Horizons, Horizons + GMET
par(mfrow=c(3, 1))

CU=100*matrix(c(
			 .1217765 , .1394398, 
			.0717711  ,  .1781948 ,
			.0189385,  .1261943 ,
			.0225062 ,  .1140176), byrow=T, ncol=2, nrow=4)

CU.l=100*matrix(c(
				 .033576 ,  .0473391,
			 -.0272657 ,   .0770455,
			  -.085244,  .0232729,
			  -.0843385, .0071813 ), byrow=T, ncol=2, nrow=4)
			
CU.u=100*matrix(c(
			 .209977, .2315405,
			.170808,   .2793441,
			.123121, .2291157,
			 .129351, .2208539), byrow=T, ncol=2, nrow=4)


gplots::plotCI(CU[,1], li=CU.l[,1], ui=CU.u[,1], xlim=c(0.5, 5), ylim=c(-10, 40), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="", xlab="", col="green", barcol="green")
par(new=T)
gplots::plotCI(CU[,2], li=CU.l[,2], ui=CU.u[,2], xlim=c(0.5, 5), ylim=c(-10, 40), x=c(1.2, 2.2, 3.2, 4.2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Condom use percentage difference", xlab="Followup wave", col="blue", barcol="blue")
par(new=T)
abline(h=1, lty=3)
axis(side=2)
axis(side=1, at=1:4, labels=c("3 mo.\nn=425", "6 mo.\nn=384", "9 mo.\nn=363", "12 mo.\nn=376"), lwd=0, lwd.ticks=0)
legend(4.3, 40, c("Horizons", "Horizons+GMET"), col=3:4, ncol=1, bty="n", cex=0.9, pch=20)



AUDIT=matrix(c(-1.196929, -1.225789 ,
			 -2.563726,  -1.84358, 
			 -.9937452,  -.7064104 , 
			 -.6493545, -.9912035), byrow=T, ncol=2, nrow=4)

AUDIT.l=matrix(c(-2.439411,   -2.498179,
				 -3.685596,  -2.968861 ,
			     -2.221342 ,  -1.917731 ,
			   -1.770075,   -2.099958), byrow=T, ncol=2, nrow=4)
			
AUDIT.u=matrix(c(.0455528, .0466007,
			-1.441856, -.7182987,
			.2338513, .5049099,
			 .4713664,   .117551), byrow=T, ncol=2, nrow=4)


gplots::plotCI(AUDIT[,1], li=AUDIT.l[,1], ui=AUDIT.u[,1], xlim=c(0.5, 5), ylim=c(-4, 1.5), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="", xlab="", col="green", barcol="green")
par(new=T)
gplots::plotCI(AUDIT[,2], li=AUDIT.l[,2], ui=AUDIT.u[,2], xlim=c(0.5, 5), ylim=c(-4, 1.5), x=c(1.2, 2.2, 3.2, 4.2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="AUDIT score difference", xlab="Followup wave", col="blue", barcol="blue")
par(new=T)
abline(h=0, lty=3)
axis(side=2)
axis(side=1, at=1:4, labels=c("3 mo.\nn=482", "6 mo.\nn=458", "9 mo.\nn=452", "12 mo.\nn=463"), lwd=0, lwd.ticks=0)
#legend(3.5, 1.5, c("Horizons", "Horizons+GMET"), col=3:4, ncol=1, bty="n", cex=0.9, pch=20)



## Nov 1, Dec 20:  Plot semi-parametric regression results Alcohol Context and AUDIT score:  Any Horizons, Horizons + GMET

AC=matrix(c(-2.09, -1.75,
			 -1.44, -1.38, 
			 -1.00, -0.57, 
			 -1.68, -2.30), byrow=T, ncol=2, nrow=4)

AC.l=matrix(c(-3.66,  -3.37,
				-3.09, -3.01,
			    -2.657374 ,  -2.203871,
			  -3.208568,  -3.811159), byrow=T, ncol=2, nrow=4)
			
AC.u=matrix(c(-0.51, -0.14,
			-.5148836, -.138596,
			.6514365, 1.056206,
			 -.146981,  -.7836142), byrow=T, ncol=2, nrow=4)


gplots::plotCI(AC[,1], li=AC.l[,1], ui=AC.u[,1], xlim=c(0.5, 5), ylim=c(-4, 1.5), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="", xlab="", col="green", barcol="green")
par(new=T)
gplots::plotCI(AC[,2], li=AC.l[,2], ui=AC.u[,2], xlim=c(0.5, 5), ylim=c(-4, 1.5), x=c(1.2, 2.2, 3.2, 4.2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Drinking context score difference", xlab="Followup wave", col="blue", barcol="blue")
par(new=T)
abline(h=0, lty=3)
axis(side=2)
axis(side=1, at=1:4, labels=c("3 mo.\nn=482", "6 mo.\nn=458", "9 mo.\nn=452", "12 mo.\nn=463"), lwd=0, lwd.ticks=0)
#legend(3.5, 1.5, c("Horizons", "Horizons+GMET"), col=3:4, ncol=1, bty="n", cex=0.9, pch=20)





## Nov 1:  Feb7:  Plot semi-parametric regression results condom use: 
##Horizons, Horizons + GMET

CU=100*matrix(c(0.083, 0.151,
			 .1123771, .1373755, 
			.0814082 , .1882874 ,
			.0189385, .1261943 ,
			.0225062 ,  .1140176), byrow=T, ncol=2, nrow=5)

CU.l=100*matrix(c(0.012, .0794898,
				.023794, .0451073,
			-.0177919 ,  .0869471,
			  -.085244,  .0232729,
			  -.0843385, .0071813 ), byrow=T, ncol=2, nrow=5)
			
CU.u=100*matrix(c(0.154, .2225702,
			.2009602, .2296438,
			.1806083,  .2896277,
			.123121, .2291157,
			 .129351, .2208539), byrow=T, ncol=2, nrow=5)


gplots::plotCI(CU[,1], li=CU.l[,1], ui=CU.u[,1], xlim=c(0.5, 6), ylim=c(-10, 30), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="", xlab="", col="green", barcol="green")
par(new=T)
gplots::plotCI(CU[,2], li=CU.l[,2], ui=CU.u[,2], xlim=c(0.5, 6), ylim=c(-10, 30), x=c(1.2, 2.2, 3.2, 4.2, 5.2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Condom use percentage difference", xlab="Followup wave", col="blue", barcol="blue")
par(new=T)
abline(h=1, lty=3)
axis(side=2)
axis(side=1, at=1:5, labels=c("Average", "3 mo.\nn=421", "6 mo.\nn=382", "9 mo.\nn=363", "12 mo.\nn=376"), lwd=0, lwd.ticks=0)
legend(4, 32, c("Horizons", "Horizons+GMET"), col=3:4, ncol=1, bty="n", cex=0.9, pch=20)


## Plot semi-parametric regression results:  Any Horizons, Marginal effect of GMET

CU=100*matrix(c(0.114, 0.025, 
			0.082, 0.107,
			0.018, 0.108,
			0.022, 0.092), byrow=T, ncol=2, nrow=4)

CU.l=100*matrix(c(0.025, -0.066,
			-0.018, 0.009,
			 -0.086, 0.008,
			 -0.085, -0.012), byrow=T, ncol=2, nrow=4)
			
CU.u=100*matrix(c(0.202, 0.115,
			0.181, 0.204,
			0.122, 0.207,
			0.129, 0.195), byrow=T, ncol=2, nrow=4)


gplots::plotCI(CU[,1], li=CU.l[,1], ui=CU.u[,1], xlim=c(0.5, 5), ylim=c(-10, 30), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Condom use percentage difference", xlab="Followup wave", col="green", barcol="green")
par(new=T)
gplots::plotCI(CU[,2], li=CU.l[,2], ui=CU.u[,2], xlim=c(0.5, 5), ylim=c(-10, 30), x=c(1.2, 2.2, 3.2, 4.2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Condom use percentage difference", xlab="Followup wave", col="blue", barcol="blue")
par(new=T)
abline(h=1, lty=3)
axis(side=2)
axis(side=1, at=1:4, labels=c("3 mo.", "6 mo.", "9 mo.", "12 mo."), lwd=0, lwd.ticks=0)
legend(3, 32, c("Any Horizons", "Horizons+GMET"), col=3:4, ncol=1, bty="n", cex=0.9, pch=20)

## Plot Poisson regression IRR of safe sex

IRR=matrix(c(1.34, 1.33, 
			1.18, 1.41, 
			1.10, 1.13,
			0.98, 1.09
			), byrow=T, ncol=2, nrow=4)

IRR.l=matrix(c(0.982, 0.960,
				0.885, 1.08,
				0.854, 0.886,
				0.784, 0.884
				), byrow=T, ncol=2, nrow=4)
			
IRR.u=matrix(c(1.84, 1.83,
				1.57, 1.85,
				1.41, 1.45,
				1.22, 1.35
				), byrow=T, ncol=2, nrow=4)


gplots::plotCI(IRR[,1], li=IRR.l[,1], ui=IRR.u[,1], xlim=c(0.5, 5), ylim=c(0.5, 2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Relative risk", xlab="Followup wave", col="green", barcol="green")
par(new=T)
gplots::plotCI(IRR[,2], li=IRR.l[,2], ui=IRR.u[,2], xlim=c(0.5, 5), ylim=c(0.5, 2), x=c(1.2, 2.2, 3.2, 4.2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Relative risk", xlab="Followup wave", col="blue", barcol="blue")
par(new=T)
abline(h=1, lty=3)
axis(side=2)
axis(side=1, at=1:4, labels=c("3 mo.", "6 mo.", "9 mo.", "12 mo."), lwd=0, lwd.ticks=0)
legend(3, 2, c("Horizons", "Horizons+GMET"), col=3:4, ncol=1, bty="n", cex=0.9, pch=20)

## Plot poisson regression reslts for never condoms

IRR=matrix(c(0.723, 0.523,
			0.933, 0.659,
			1.00, 0.72,
			0.91, 0.703 
			), byrow=T, ncol=2, nrow=4)

IRR.l=matrix(c(0.463, 0.311,
				0.651, 0.437,
				0.66, 0.452,
				0.625, 0.467
				), byrow=T, ncol=2, nrow=4)
			
IRR.u=matrix(c(1.13, 0.88,
				1.34, 0.99,
				1.52, 1.15,
				1.32, 1.06
				), byrow=T, ncol=2, nrow=4)


gplots::plotCI(IRR[,1], li=IRR.l[,1], ui=IRR.u[,1], xlim=c(0.5, 5), ylim=c(0, 2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Relative risk", xlab="Followup wave", col="green", barcol="green")
par(new=T)
gplots::plotCI(IRR[,2], li=IRR.l[,2], ui=IRR.u[,2], xlim=c(0.5, 5), ylim=c(0, 2), x=c(1.2, 2.2, 3.2, 4.2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Relative risk", xlab="Followup wave", col="blue", barcol="blue")
par(new=T)
abline(h=1, lty=3)
axis(side=2)
axis(side=1, at=1:4, labels=c("3 mo.", "6 mo.", "9 mo.", "12 mo."), lwd=0, lwd.ticks=0)
legend(3, 2, c("Horizons", "Horizons+GMET"), col=3:4, ncol=1, bty="n", cex=0.9, pch=20)

## Plot poisson regression reslts for alcohol risk

IRR=matrix(c(0.721, 0.747,
			0.556, 0.630,
			0.653, 0.62,
			0.573, 0.608
			), byrow=T, ncol=2, nrow=4)

IRR.l=matrix(c(0.501, 0.515,
				0.357, 0.412,
				0.396, 0.372,
				0.32, 0.34
				), byrow=T, ncol=2, nrow=4)
			
IRR.u=matrix(c(1.04, 1.08,
				0.866, 0.964,
				1.08, 1.03,
				1.02, 1.07
				), byrow=T, ncol=2, nrow=4)


gplots::plotCI(IRR[,1], li=IRR.l[,1], ui=IRR.u[,1], xlim=c(0.5, 5), ylim=c(0, 1.5), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Relative risk", xlab="Followup wave", col="green", barcol="green")
par(new=T)
gplots::plotCI(IRR[,2], li=IRR.l[,2], ui=IRR.u[,2], xlim=c(0.5, 5), ylim=c(0, 1.5), x=c(1.2, 2.2, 3.2, 4.2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Relative risk", xlab="Followup wave", col="blue", barcol="blue")
par(new=T)
abline(h=1, lty=3)
axis(side=2)
axis(side=1, at=1:4, labels=c("3 mo.", "6 mo.", "9 mo.", "12 mo."), lwd=0, lwd.ticks=0)
legend(3, 1.5, c("Horizons", "Horizons+GMET"), col=3:4, ncol=1, bty="n", cex=0.9, pch=20)

## Condom use Plot semi-parametric regression results:   Horizons, Horizons + GMET

CU=100*matrix(c(0.112, 0.137, 
			0.081, 0.188,
			0.019, 0.126,
			0.023, 0.114), byrow=T, ncol=2, nrow=4)

CU.l=100*matrix(c(0.024, 0.045,
			-0.018, 0.087,
			 -0.085, 0.023,
			 -0.084, 0.007), byrow=T, ncol=2, nrow=4)
			
CU.u=100*matrix(c(0.201, 0.23,
			0.181, 0.29,
			0.123, 0.229,
			0.129, 0.221), byrow=T, ncol=2, nrow=4)


gplots::plotCI(CU[,1], li=CU.l[,1], ui=CU.u[,1], xlim=c(0.5, 5), ylim=c(-10, 30), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Condom use percentage difference", xlab="Followup wave", col="green", barcol="green")
par(new=T)
gplots::plotCI(CU[,2], li=CU.l[,2], ui=CU.u[,2], xlim=c(0.5, 5), ylim=c(-10, 30), x=c(1.2, 2.2, 3.2, 4.2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Condom use percentage difference", xlab="Followup wave", col="blue", barcol="blue")
par(new=T)
abline(h=1, lty=3)
axis(side=2)
axis(side=1, at=1:4, labels=c("3 mo.", "6 mo.", "9 mo.", "12 mo."), lwd=0, lwd.ticks=0)
legend(3, 32, c("Horizons", "Horizons+GMET"), col=3:4, ncol=1, bty="n", cex=0.9, pch=20)


## Plotting Poisson regression results for any chlamydia, gonorrhea, or trich

IRR=matrix(c(0.808, 0.939,
			0.774, 0.77,
			0.94, 0.95), byrow=T, ncol=2, nrow=3)

IRR.l=matrix(c(0.643, 0.759, 
			0.596, 0.592, 
			0.76, 0.77), byrow=T, ncol=2, nrow=3)
			
IRR.u=matrix(c(1.02, 1.16, 
				1.01, 1.00,
				1.16, 1.17), byrow=T, ncol=2, nrow=3)

gplots::plotCI(IRR[,1], li=IRR.l[,1], ui=IRR.u[,1], xlim=c(0.5, 4), ylim=c(0, 1.5), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="", xlab="", col="green", barcol="green")
par(new=T)
gplots::plotCI(IRR[,2], li=IRR.l[,2], ui=IRR.u[,2], xlim=c(0.5, 4), ylim=c(0, 1.5), x=c(1.2, 2.2, 3.2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Relative risk", xlab="Outcome", col="blue", barcol="blue")
par(new=T)
abline(h=1, lty=3)
axis(side=2)
axis(side=1, at=1:3, labels=c("Chlamydia", "Gonorrhea", "Trichomonas"), lwd=0, lwd.ticks=0)
legend(2, 1.6, c("Horizons", "Horizons+GMET"), col=3:4, ncol=1, bty="n", cex=0.9, pch=20)

### Plotting zero-inflated Poisson regression results for AUDIT score

IRR=matrix(c(0.828665, 0.8166944, 
			0.65, 0.71, 
			0.765, 0.7997, 
			0.829, 0.716), byrow=T, ncol=2, nrow=4)

IRR.l=matrix(c(0.68, 0.66, 
			0.524, 0.578, 
			0.587, 0.605,
			0.611, 0.531), byrow=T, ncol=2, nrow=4)
			
IRR.u=matrix(c(1.01, 1.004, 
				0.806, 0.879,
				0.996, 1.06, 
				1.13, 0.965), byrow=T, ncol=2, nrow=4)


gplots::plotCI(IRR[,1], li=IRR.l[,1], ui=IRR.u[,1], xlim=c(0.5, 5), ylim=c(0, 1.5), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Relative risk", xlab="Followup wave", col="green", barcol="green")
par(new=T)
gplots::plotCI(IRR[,2], li=IRR.l[,2], ui=IRR.u[,2], xlim=c(0.5, 5), ylim=c(0, 1.5), x=c(1.2, 2.2, 3.2, 4.2), pch=20, axes=F, lty=1, sfrac=0, gap=0, ylab="Relative risk", xlab="Followup wave", col="blue", barcol="blue")
par(new=T)
abline(h=1, lty=3)
axis(side=2)
axis(side=1, at=1:4, labels=c("3 mo.", "6 mo.", "9 mo.", "12 mo."), lwd=0, lwd.ticks=0)
legend(3, 1.6, c("Horizons", "Horizons+GMET"), col=3:4, ncol=1, bty="n", cex=0.9, pch=20)



### Zoib

#N=read.dta("/Users/jerosenbaum/Desktop/projects/Nliten/nliten20181019.dta")
N=read.dta("/Users/jerosenbaum/Desktop/projects/Nliten/nliten20181025.dta")
N0=with(N,data.frame(condomuse0, condomuse3, condomuse6, condomuse9, condomuse12, treat))
N0cc=N0[complete.cases(N0),]
modelz1=zoib(condomuse3  ~ condomuse0 + treat | condomuse0 + treat | condomuse0 + treat | condomuse0 + treat | condomuse0 + treat, n.response=1, data=N0, EUID=ID, zero.inflation=T, one.inflation=T)

modelz2=zoib(condomuse3 | condomuse6  ~ condomuse0 + treat | condomuse0 + treat | condomuse0 + treat | condomuse0 + treat | condomuse0 + treat, n.response=1, data=N0, EUID=ID, zero.inflation=T, one.inflation=T)


modelz2=zoib(condomuse3 | condomuse6 | condomuse9 | condomuse12 ~ condomuse0 + treat | condomuse0 + treat | condomuse0 + treat | condomuse0 + treat | condomuse0 + treat, n.response=1, data=N0, EUID=ID, zero.inflation=T, one.inflation=T)

*** Plot never using condoms as line plot.
** 

never.condom= matrix(c ( 26.5, 31.1, 32.43,
		22.6, 16.4, 11.8,
		29.2, 27.2, 19.2,
		23.0, 23.1, 16.6,
		27.9, 25.3, 19.6), 
		 nrow=3, byrow=F)
for (k in 1:3) {
	plot(never.condom[k,], type="b", col=k+1, ylim=c(0,100), axes=F, ylab="", xlab="")
	par(new=T)
}
axis(side=2, )
axis(side=1, at=1:5, labels=c("Baseline", "3 months", "6 months", "9 months", "12 months"), lwd=0, lwd.ticks=0, cex=1.2)
legend(3.5, 100, c("Control (n=185)", "Horizons (n=190)", "Horizons+GMET (n=185)"), col=2:4, bty="n", pch=1)

*** Plot safe sex as line plot
** :  6 line plots for safe sex, condom use proportion, chlamydia, gonorrhea, AUDIT score, risk zone
safesex= matrix(c ( 0, 0, 0,
		 28.30  ,    38.01    ,  37.50 ,
		  35.42   ,   41.77  ,    50.00 ,
		  43.88    ,  48.08  ,    49.68 ,
		   51.02   ,   50.00   ,   55.70  ), 
		 nrow=3, byrow=F)
for (k in 1:3) {
	plot(safesex[k,], type="b", col=k+1, ylim=c(0,100), axes=F, ylab="", xlab="")
	par(new=T)
}
axis(side=2, )
axis(side=1, at=1:5, labels=c("Baseline", "3 months", "6 months", "9 months", "12 months"), lwd=0, lwd.ticks=0, cex=1.2)
legend(3.5, 100, c("Control (n=185)", "Horizons (n=190)", "Horizons+GMET (n=185)"), col=2:4, bty="n", pch=1)

* Chlamdyia
* Gonorrhea
* Trichomonas

* Alcohol risk = 1 for AUDIT scores of 8 or above.
alcoholrisk= matrix(c (  42.16   ,   46.32    ,  47.03 ,
		 30.82   ,   22.22    ,  23.03 ,
		   28.47  ,    15.82  ,    17.95 ,
		  21.58   ,   14.10   ,   13.38  ,
		    17.69   ,   10.13  ,    10.76   ), 
		 nrow=3, byrow=F)
for (k in 1:3) {
	plot(alcoholrisk[k,], type="b", col=k+1, ylim=c(0,100), axes=F, ylab="", xlab="")
	par(new=T)
}
axis(side=2)
axis(side=1, at=1:5, labels=c("Baseline", "3 months", "6 months", "9 months", "12 months"), lwd=0, lwd.ticks=0, cex=1.2)
legend(3.5, 100, c("Control (n=185)", "Horizons (n=190)", "Horizons+GMET (n=185)"), col=2:4, bty="n", pch=1)

* Reproductive coercion


N=read.dta("/Users/jerosenbaum/Desktop/projects/Nliten/nliten20181015-long.dta")
N=within(N, {
	ID=factor(ID)
	treat=factor(treat)
	months=factor(months)
	auditzone=factor(auditzone)
		})
	
	# reshape long audit auditzone condomuse safesex, i(ID) j(months)

bwplot(condomuse ~ as.factor(months) | treat, data=N)
bwplot(audit ~ as.factor(months) | treat, data=N, ylab="AUDIT score", xlab="Months of follow-up")

# Need to address missing data to use this model.
condom.model1=lme(condomuse ~ treat*months, random=list(ID = pdDiag(~months)), data=N)
summary(condom.model1)


# Describe patterns of missing data
N=read.dta("/Users/jerosenbaum/Desktop/projects/Nliten/nliten20181019.dta")


densityplot(~audit0 + audit3m + audit6m + audit9m + audit12m, 
data=N, xlim=c(0, 40), pch="", auto.key=T, xlab="AUDIT score")

A=with(N, cbind(ID, treat, audit0, audit3m, audit6m, audit9m, audit12m))
A.long=reshape(A, idvar="ID", varying=c("audit0", "audit3m", "audit6m", "audit9m", "audit12m"), v.names="audit", times=c(0,3,6,9,12), direction="long")
A.long=reshape(A, idvar=ID, varying=list(3:7), v.names="audit", times=c(0,3,6,9,12), direction="long")

dp0=densityplot(~audit0, groups=anytreat, 
data=N, xlim=c(0, 40), pch="", auto.key=F, xlab="AUDIT score, baseline")
dp3=densityplot(~audit3m, groups=anytreat, 
data=N, xlim=c(0, 40), pch="", auto.key=F, xlab="AUDIT score, 3 mo")
dp6=densityplot(~audit6m, groups=anytreat, 
data=N, xlim=c(0, 40), pch="", auto.key=F, xlab="AUDIT score, 6 mo")
dp9=densityplot(~audit9m, groups=anytreat, 
data=N, xlim=c(0, 40), pch="", auto.key=F, xlab="AUDIT score, 9 mo")
dp12=densityplot(~audit12m, groups=anytreat, 
data=N, xlim=c(0, 40), pch="", auto.key=F, xlab="AUDIT score, 12 mo")
print(dp0, position=c(0, .5, 0.33, 1), more=TRUE)
print(dp3, position=c(0.33, .5, 0.66, 1), more=TRUE)
print(dp6, position=c(0.66, .5, 1, 1), more=TRUE)
print(dp9, position=c(0, 0, 0.33, 0.5), more=TRUE)
print(dp12, position=c(0.33, 0, 0.66, 0.5))

dp0=densityplot(~audit0, groups=treat, 
data=N, xlim=c(0, 40), pch="", auto.key=F, xlab="AUDIT score, baseline", col=2:4)
dp3=densityplot(~audit3m, groups=treat, 
data=N, xlim=c(0, 40), pch="", auto.key=F, xlab="AUDIT score, 3 mo", col=2:4)
dp6=densityplot(~audit6m, groups=treat, 
data=N, xlim=c(0, 40), pch="", auto.key=F, xlab="AUDIT score, 6 mo", col=2:4)
dp9=densityplot(~audit9m, groups=treat, 
data=N, xlim=c(0, 40), pch="", auto.key=F, xlab="AUDIT score, 9 mo", col=2:4)
dp12=densityplot(~audit12m, groups=treat, 
data=N, xlim=c(0, 40), pch="", auto.key=F, xlab="AUDIT score, 12 mo", col=2:4)
print(dp0, position=c(0, .5, 0.33, 1), more=TRUE)
print(dp3, position=c(0.33, .5, 0.66, 1), more=TRUE)
print(dp6, position=c(0.66, .5, 1, 1), more=TRUE)
print(dp9, position=c(0, 0, 0.33, 0.5), more=TRUE)
print(dp12, position=c(0.33, 0, 0.66, 0.5))


ks.test(subset(N$audit0, N$anytreat==0), subset(N$audit0, N$anytreat==1)) 
ks.test(subset(N$audit3m, N$anytreat==0), subset(N$audit3m, N$anytreat==1)) 
ks.test(subset(N$audit6m, N$anytreat==0), subset(N$audit6m, N$anytreat==1)) 
ks.test(subset(N$audit9m, N$anytreat==0), subset(N$audit9m, N$anytreat==1)) 
ks.test(subset(N$audit12m, N$anytreat==0), subset(N$audit12m, N$anytreat==1)) 

ks.test(subset(N$audit0, as.numeric(N$treat)==2), subset(N$audit0, as.numeric(N$treat)==3)) 
ks.test(subset(N$audit3m, as.numeric(N$treat)==2), subset(N$audit3m, as.numeric(N$treat)==3)) 
ks.test(subset(N$audit6m, as.numeric(N$treat)==2), subset(N$audit6m, as.numeric(N$treat)==3)) 
ks.test(subset(N$audit9m, as.numeric(N$treat)==2), subset(N$audit9m, as.numeric(N$treat)==3)) 
ks.test(subset(N$audit12m, as.numeric(N$treat)==2), subset(N$audit12m, as.numeric(N$treat)==3)) 


dp0=densityplot(~100*condomuse0, groups=anytreat, 
data=N, xlim=c(0, 100), pch="", auto.key=F, xlab="Condom use (%), baseline")
dp3=densityplot(~100*condomuse3, groups=anytreat, 
data=N, xlim=c(0, 100), pch="", auto.key=F, xlab="Condom use (%), 3 mo")
dp6=densityplot(~100*condomuse6, groups=anytreat, 
data=N, xlim=c(0, 100), pch="", auto.key=F, xlab="Condom use (%), 6 mo")
dp9=densityplot(~100*condomuse9, groups=anytreat, 
data=N, xlim=c(0, 100), pch="", auto.key=F, xlab="Condom use (%), 9 mo")
dp12=densityplot(~100*condomuse12, groups=anytreat, 
data=N, xlim=c(0, 100), pch="", auto.key=F, xlab="Condom use (%), 12 mo")
print(dp0, position=c(0, .5, 0.33, 1), more=TRUE)
print(dp3, position=c(0.33, .5, 0.66, 1), more=TRUE)
print(dp6, position=c(0.66, .5, 1, 1), more=TRUE)
print(dp9, position=c(0, 0, 0.33, 0.5), more=TRUE)
print(dp12, position=c(0.33, 0, 0.66, 0.5))


ks.test(subset(N$condomuse0, N$anytreat==0), subset(N$condomuse0, N$anytreat==1)) 
ks.test(subset(N$condomuse3, N$anytreat==0), subset(N$condomuse3, N$anytreat==1)) 
ks.test(subset(N$condomuse6, N$anytreat==0), subset(N$condomuse6, N$anytreat==1)) 
ks.test(subset(N$condomuse9, N$anytreat==0), subset(N$condomuse9, N$anytreat==1)) 
ks.test(subset(N$condomuse12, N$anytreat==0), subset(N$condomuse12, N$anytreat==1)) 


dp0=densityplot(~100*condomuse0, groups=treat, 
data=N, xlim=c(0, 100), pch="", auto.key=F, xlab="Condom use (%), baseline", col=2:4)
dp3=densityplot(~100*condomuse3, groups=treat, 
data=N, xlim=c(0, 100), pch="", auto.key=F, xlab="Condom use (%), 3 mo", col=2:4)
dp6=densityplot(~100*condomuse6, groups=treat, 
data=N, xlim=c(0, 100), pch="", auto.key=F, xlab="Condom use (%), 6 mo", col=2:4)
dp9=densityplot(~100*condomuse9, groups=treat, 
data=N, xlim=c(0, 100), pch="", auto.key=F, xlab="Condom use (%), 9 mo", col=2:4)
dp12=densityplot(~100*condomuse12, groups=treat, 
data=N, xlim=c(0, 100), pch="", auto.key=F, xlab="Condom use (%), 12 mo", col=2:4)
print(dp0, position=c(0, .5, 0.33, 1), more=TRUE)
print(dp3, position=c(0.33, .5, 0.66, 1), more=TRUE)
print(dp6, position=c(0.66, .5, 1, 1), more=TRUE)
print(dp9, position=c(0, 0, 0.33, 0.5), more=TRUE)
print(dp12, position=c(0.33, 0, 0.66, 0.5))


tally(~date_a, data=N)
tally(~date_c, data=N)
missing3=date_c==93
missing6=date_d==999
missing9=date_e==999
missing12=date_f==93

#library(BaylorEdPsych)
# data.frame(audit0 relationshiplength0 condomuse0 CU_SE_a CommSE_a CommFreq_a Sex_RefSE_a CU_Fear_a PropCU_a Depress_a Impulse_a chlamydia0 gonorrhea0 trich0 hsgrad0 job0 everdouche0 douche3m0 reprodcoercion0 reprodcoercion3m0 boyfriend0 perceivedconcurrency0 everemotionalabuse0 everphysicalabuse0 evermarijuana0 auditzone0 age0  sexpartnerage0 GovAid_a c1_a  neighborhoodquality0)
# LittleMCAR(dataframe)

# Use Gelman's secret weapon


