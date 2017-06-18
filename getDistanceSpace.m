function [ distance ] = getDistanceSpace( PS1,PS2 )
% Get Euclidean distance of two sequences
% Input: series PS1 and PS2
% output: Euclidean distance of the two series
% Changchuan Yin
% Last update 9/17/2013
   distance = sqrt(sum(abs(PS1-PS2).^2));
end

