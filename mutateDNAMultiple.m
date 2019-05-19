function [AM] = mutateDNAMultiple(A, pos )
% Mutate DNA at multiple positions defiend in pos array
%A='CAAAGATGCGTTAACGTAATCC';
%pos=[2,3,4];
L=length(pos);
for j=1:L
   r = randi(3,1,3);
   %r = randi(4,1,10) %Generate 10 integers between 1 and 4
   p=pos(j);
   if A(j)=='A'
     if (r(1) == 1) 
      x = 'T';
     elseif (r(1) == 2)  
      x =  'C';  
     elseif (r(1) == 3)  
      x =  'G';
     end
   elseif A(j)=='T'
       if (r(1) == 1) 
        x = 'A';
       elseif (r(1) == 2)  
        x =  'C';  
       elseif (r(1) == 3)  
       x =  'G';
       end
   elseif A(j)=='C'
       if (r(1) == 1) 
        x = 'A';
       elseif (r(1) == 2)  
         x =  'T';  
       elseif (r(1) == 3)  
         x =  'G';
       end
   elseif A(j)=='G'
     if (r(1) == 1) 
        x = 'T';
     elseif (r(1) == 2)  
        x =  'C';  
     elseif (r(1) == 3)  
        x =  'A';
     end
   end
   
   A(p)=x;
end

AM=A;

% %Generate 10 unique numbers from 1 to 10
% p = randperm(10)
% %Generate 5 unique numbers from 1 to 10
% p5=p(1:5)
% 
% r=randUnique(5,20)
end

