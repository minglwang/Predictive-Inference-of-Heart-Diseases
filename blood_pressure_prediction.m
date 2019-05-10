%% problem 3
clear all
% import data
data = load('data_bloodpressure_03.csv');

% least square estimate of model parameters
LS_estimate;

% calculate the confidence interval of parameters
CI_calculation;

% calculate predictive confidence interval of the new patients
predictive_CI;
