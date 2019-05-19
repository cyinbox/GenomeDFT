function [ seqAfterTNInsert] = mutateDNATranspose(seq,TL,posFrom,posTo)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%seq='AAAAAAAAAATTTTTTTTTTCCCCCCCCCCGGGGGGGGGGG'
%posFrom = 11;
%TL=10 %Transpose length
%posTo = 15

%posTo = posFrom+L-1; %posTo can be posFrom+TL-1 (21), because this is to insert itself to original position
%posTO ~= posFrom+TL-1

TE=seq(posFrom:posFrom+TL-1);
seq(posFrom:posFrom+TL-1)=[];
seqCut=seq;
N2= length(seqCut);
 
posTo = posTo-TL;
seq3=seqCut(1:posTo);
seq4=seqCut(posTo+1:N2-1);
seqAfterTNInsert= strcat(seq3,TE,seq4);
end

