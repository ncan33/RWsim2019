IMPORTANT: TO RECEIVE THE RESULTS, RUN THE gInterface.m FILE, NOT randomwalkFinal.m

The purpose of this program is to run a random walk simulation. 7 input parameters are involved, and the output is a histogram of the results of the RW.

The parameters are: Number of trials ("trialsNum"), starting point ("Bias"), the lower threshold ("Tdown"), the upper threshold ("Tup"), the normal distribution mean ("StepM"), and the number of bins in the histogram ("hBins"), and the amount of time it takes for one step ("timePerStep").

The program consists of two files, gInterface.m and randomwalkFinal.m

randomwalkFinal.m is the .m file where the function is defined. The simulation takes place, and the function simulates the number of steps it would take to reach either one of the thresholds. A histogram of the number of steps is generated. The input for the parameters will be provided by a GUI program.

gInterface.m defines the GUI program, and refers to randomwalkFinal.m to run the simulation. The result of the RW is displayed on the GUI program as a histogram.
To call the main function without using the GUI, use the following structure:
	randomwalkFinal(trialsNum, Bias, Tup, Tdown, stepM, hBins, timePerStep)