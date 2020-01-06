% ***Please run the gInterface.m file not this file***
% This function takes 7 parameters to run a 1D random walk simulation and
% plot the results as a Histogram representation. 
% The parameters are: Number of runs(trials), starting point (bias), two
% thresholds, normal distribition mean, number of bin in Histogram, and
% the amount of time it takes to take one step
function randomwalkFinal(trialsNum, Bias, Tup, Tdown, stepM, hBins, timePerStep) %define the main() function
    times = zeros([1 trialsNum]); %this is where all the reaction times will be kept
    stepSizeDist = makedist('Normal','mu',stepM,'sigma', 1); %making a normal distibution according to input
    for i=1:trialsNum %set up a loop for the number of times we are running the trial
        position = Bias;    %set the starting point as the bias (input)
        counter = 0; % this will count the number of steps taken till threshold
        while position <= Tup && position >= Tdown % a loop for walking until threshold is reached
            stepSize = random(stepSizeDist); %getting a random number (step size) from the normal distribution
            stepSize = round(stepSize, 0);
            q = rand();     %generate a random number between 0 and 1
            if q <= 0.5     
                stepSize = -stepSize; %if q<0.5 the direction will be backwards
            elseif q > 0.5
                stepSize = stepSize;  %if q>0.5 the direction will be forward
            end
            
            position = position + stepSize; %add step to the position
            counter = counter + 1;  %record # of steps
            
            if position >= Tup
                times(i) = counter;    %add the reaction time to array times
            end
            if position <= Tdown
                times(i) = counter;  %add the reaction time to array times
            end
        end
    end
    times = timePerStep.*times; %multiply the array by time per step
    histogram(times,hBins) %plot the Histogram
end
    