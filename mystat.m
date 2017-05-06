% By submitting this assignment, I agree to the following:
%  “Aggies do not lie, cheat, or steal, or tolerate those who do”
%  “I have not given or received any unauthorized aid on this assignment”
% 
% Name: CHRISTOPHER PADILLA
% Section: 530
% Team:	13
% Assignment: MATLAB 1: HOMEWORK
% Date:	10 NOV. 2016

function[Mean, Median, Mode, Var, Std, Min, Max, Count] = mystat(data)
% This function computes the basic values needed for the user's data
% statistical analysis
Mean = mean(data);
Median = median(data);
Mode = mode(data);
Var = var(data);
Std = std(data);
Min = min(data);
Max = max(data);
Count = length(data);

end