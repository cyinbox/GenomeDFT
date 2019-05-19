% Last update on 02/28/2014
% Changchuan Yin
% Mutant DNA from start to end at different positions
function [mutSeq] = mutateDNASingle(seq,p)
% Mutate DNA at multiple positions defiend in pos array
%seq='CAAAGATGCGTTAACGTAATCC'
%pos=[2,3,7];
% p=5
 seq=upper(seq)
 
 r = randi(3,1,3);
   
   if seq(p)=='A'
     if (r(1) == 1) 
      x = 'T';
     elseif (r(1) == 2)  
      x =  'C';  
     elseif (r(1) == 3)  
      x =  'G';
     end
   elseif seq(p)=='T'
       if (r(1) == 1) 
        x = 'A';
       elseif (r(1) == 2)  
        x =  'C';  
       elseif (r(1) == 3)  
       x =  'G';
       end
   elseif seq(p)=='C'
       if (r(1) == 1) 
        x = 'A';
       elseif (r(1) == 2)  
         x =  'T';  
       elseif (r(1) == 3)  
         x =  'G';
       end
   elseif seq(p)=='G'
     if (r(1) == 1) 
        x = 'T';
     elseif (r(1) == 2)  
        x =  'C';  
     elseif (r(1) == 3)  
        x =  'A';
     end
   end
   
  seq(p)=x;


mutSeq=seq


end

