
function [PW] = FFTDNA4D(DNA)
% Compute and plot FFT of a given DNA sequence by 4-D indicator representation method
% Input: DNA sequence
% output: DFT power spectrum of the DNA sequence.
% Changchuan Yin
% 04/25/2012
DNA=upper(DNA);
N = length(DNA);
w = zeros(4,N);
for i=1:N
   if strcmp(DNA(i),'A') 
      w(1,i) = 1;
      w(2,i) = 0;
      w(3,i) = 0;
      w(4,i) = 0;
   elseif strcmp(DNA(i),'C')
      w(1,i) = 0;
      w(2,i) = 0;
      w(3,i) = 1;
      w(4,i) = 0;
   elseif strcmp(DNA(i),'G')
      w(1,i) = 0;
      w(2,i) = 0;
      w(3,i) = 0;
      w(4,i) = 1;
   elseif strcmp(DNA(i),'T')
      w(1,i) = 0;
      w(2,i) = 1;
      w(3,i) = 0;
      w(4,i) = 0;
   end     
end
 w1 = w(1,:);
 w2 = w(2,:);
 w3 = w(3,:);
 w4 = w(4,:);
 rFFTA = fft(w1,N); 
 rPSA = abs(rFFTA).^2;
 
 rFFTT = fft(w2,N); 
 rPST = abs(rFFTT).^2;  
 
 rFFTC = fft(w3,N); 
 rPSC = abs(rFFTC).^2;
 
 rFFTG = fft(w4,N); 
 rPSG = abs(rFFTG).^2;

 PW = rPSA + rPST + rPSC + rPSG;

end
