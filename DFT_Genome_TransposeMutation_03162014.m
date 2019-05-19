%==============================================================
% First intron of myeloid cell leukemia protein 1 [Homo sapiens]
%>AAG00896.1 (gid=9857700 : nExons=3 : pLen=350 : intronLen=351,512 pIntronPos=230,313 
clear
seq='GTaagggggttcattaatcgccaaggcctcactcccttttttccatctctccccggactcacccgccaagggtgggttggaaaccgaaacgagtcagtgttgaaacgtgtctcatcctattcctgaagccagaatattctggccatgagtcattgtttccgcccatcttgattcttttggaaatggcagctcttgttcaaagaccggaaagggtgggatgtcaatttcaagtggggtcaacctgagttcgtaaatcccagtagcgattttcccgccgcgggtgggcaggcgaatcttgcgccggtttagacaaaggaggccgtgaggacctgcatgcttttctttctcAG';
N=length(seq);

% seq='AAAAAAAAAATTTTTTTTTTCCCCCCCCCCGGGGGGGGGGG'
TL=10;
posFrom1=11,
posFrom2=55;
posTo1=95;
posTo2=155;


% We need to make d mutants in this sequence
randN = randperm(N);
d=round(0.1*N)
pos=randN(1:d);

A=mutateDNAMultiple(seq,pos); 
A1=mutateDNATranspose(A,TL,posFrom1,posTo1); 
A2=mutateDNATranspose(A,TL,posFrom1,posTo2); 

B=mutateDNAMultiple(seq,pos);  
B1=mutateDNATranspose(B,TL,posFrom2,posTo1); 
B2=mutateDNATranspose(B,TL,posFrom2,posTo2); 

Genes(1).Header   = 'A';
Genes(1).Sequence = A; 

Genes(2).Header   = 'A1';
Genes(2).Sequence = A1; 

Genes(3).Header   = 'A2';
Genes(3).Sequence = A2; 

Genes(4).Header   = 'B';
Genes(4).Sequence = B;

Genes(5).Header   = 'B1';
Genes(5).Sequence = B1;

Genes(6).Header   = 'B2';
Genes(6).Sequence = B2;

N=length(Genes);
distM=zeros(N,N);
for i=1:N
    seq1=Genes(i).Sequence;
    for j=i:N
       seq2=Genes(j).Sequence;
       distM(i,j) =getDistFFTGeneScale(seq1,seq2)%Changchuan Yin new method
     end
end
distM
 
dz=[];
for k=2:N
  dm=distM(k-1,k:N)';
  
  dz=[dz;dm];
end

UPGMAtree = seqlinkage(dz,'UPGMA',Genes);
hTree = plot(UPGMAtree,'orient','left');

xlabel('Similarity distance', 'FontName', 'AvantGarde','FontSize', 10,'FontWeight','bold')

% 4.Set PaperPositionMode to auto so that the exported figure looks like it does on the screen.
set(gcf, 'PaperPositionMode', 'auto');
print -depsc2 DFT_Genome_TreeMutation_09102013.eps
 
distances = seqpdist(Genes,'Method','Jukes-Cantor','Alpha','DNA');
UPGMAtree2 = seqlinkage(distances,'UPGMA',Genes);
h2 = plot(UPGMAtree2,'orient','left');
title('Phylogenetic tree of influenza A virus by Jukes-Cantor method', 'FontSize', 10,'FontWeight','bold');
xlabel('Similarity distance', 'FontSize', 10,'FontWeight','bold')









    

    
