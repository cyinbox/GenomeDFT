%==============================================================
% First intron of myeloid cell leukemia protein 1 [Homo sapiens]
%>AAG00896.1 (gid=9857700 : nExons=3 : pLen=350 : intronLen=351,512 pIntronPos=230,313 
clear
seq1='GTaagggggttcattaatcgccaaggcctcactcccttttttccatctctccccggactcacccgccaagggtgggttggaaaccgaaacgagtcagtgttgaaacgtgtctcatcctattcctgaagccagaatattctggccatgagtcattgtttccgcccatcttgattcttttggaaatggcagctcttgttcaaagaccggaaagggtgggatgtcaatttcaagtggggtcaacctgagttcgtaaatcccagtagcgattttcccgccgcgggtgggcaggcgaatcttgcgccggtttagacaaaggaggccgtgaggacctgcatgcttttctttctcAG';
N= length(seq1);

distV=zeros(1,150);
len=zeros(1,150);

for(d=1:150)
    m=N-d;
    len(d)=d;
    seq=seq1(1:m);
    dist=getDistFFTGeneScale(seq1,seq);
    distV(d)=dist;
end
titleText='Distance vs Deletion Length';

figure
plot(len,distV)
xlabel('Deletion length','FontSize',8,'FontWeight','bold');
ylabel('Distance','FontSize',8,'FontWeight','bold');
title(titleText,'FontSize',8,'FontWeight','bold');
hold on 

temp = polyfit(len,distV,1)
a1 = temp(2) % y-intercept of the fitted line
a2 = temp(1) % slope of fitted lines
fit = a1+a2*len;
plot(len,fit,'g') % keep the first graph up while we plot the fitted line
legend('Distance','Regression')




 

    
