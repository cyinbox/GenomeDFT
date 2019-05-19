%==============================================================
% First intron of myeloid cell leukemia protein 1 [Homo sapiens]
%>AAG00896.1 (gid=9857700 : nExons=3 : pLen=350 : intronLen=351,512 pIntronPos=230,313 
clear
seq1='GTaagggggttcattaatcgccaaggcctcactcccttttttccatctctccccggactcacccgccaagggtgggttggaaaccgaaacgagtcagtgttgaaacgtgtctcatcctattcctgaagccagaatattctggccatgagtcattgtttccgcccatcttgattcttttggaaatggcagctcttgttcaaagaccggaaagggtgggatgtcaatttcaagtggggtcaacctgagttcgtaaatcccagtagcgattttcccgccgcgggtgggcaggcgaatcttgcgccggtttagacaaaggaggccgtgaggacctgcatgcttttctttctcAG';
N= length(seq1);

% We need to make d mutants in this sequence
randN = randperm(N);
distV=zeros(1,100);
len=zeros(1,100);

for(d=1:100)
 len(d)=d;
 pos=randN(1:d);
 seq=mutateDNAMultiple(seq1,pos);
 dist=getDistFFTGeneScale(seq1,seq);
 distV(d)=dist;
 
end

titleText='Distance vs point mutation';
figure
plot(len,distV)
xlabel('Number of point mutations','FontSize',8,'FontWeight','bold');
ylabel('Distance','FontSize',8,'FontWeight','bold');
title(titleText,'FontSize',8,'FontWeight','bold');
hold on 

temp = polyfit(len,distV,1)
a1 = temp(2) % y-intercept of the fitted line
a2 = temp(1) % slope of fitted lines
fit = a1+a2*len;
plot(len,fit,'g') % keep the first graph up while we plot the fitted line
legend('Distance','Regression')


    

    
