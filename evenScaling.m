function [PSNew] = evenScaling(PS,M)
% Even time series PS from length N to length M
% Input: time series PS of length N
% output: time series PSNew of length M, M>N
% Changchuan Yin
% Last update 9/17/2013
N= length(PS);
PSNew=zeros(1,M);
PSNew(1)=PS(1);

for i=2:M
  s=round((i-1)*N/M);
  e=round(i*N/M);
  PSNew(i)=mean(PS(s:e));
end

end

