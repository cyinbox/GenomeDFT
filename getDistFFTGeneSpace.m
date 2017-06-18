function [distance] = getDistFFTGeneSpace(seq1,seq2,N)
% Get Euclidean distance of two DNA sequences
% Input: DNA sequences: seq1 and seq2
% output: Euclidean distance of two DNA sequences after DFT and even
% scaling
% Changchuan Yin
% Last update 9/17/2013

PS1=FFTDNA4D(seq1);
PS2=FFTDNA4D(seq2);

%Remove first DC in DFT power spectrum
PS1(1)=[];
PS2(1)=[];

PS1=evenScaling(PS1,N);
PS2=evenScaling(PS2,N);

distance=getDistanceSpace(PS1,PS2);
end