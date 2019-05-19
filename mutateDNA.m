function [AM] = mutateDNA(A, pos )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Mutation at position
%  A='CTAGGATGCGTTAACGTAATCC';
%  pos=10;
% mutantAt=pos
%r = randi(4,1,10) %Generate 10 integers between 1 and 4
r = randi(4,1,5);
%r1=r(1);
if (r(1) == 1) 
      X = 'A';
elseif (r(1) == 2)  
      X =  'T';  
elseif (r(1) == 3)  
      X =  'C';
elseif (r(1) == 4) 
      X =  'G';
end     
A(mutantAt)=X;
AM=A;
end

