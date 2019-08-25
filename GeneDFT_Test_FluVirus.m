% Computate the UPGMA phylogenetic tree of bacterial genomes using 2D
% representations
%
% Citation
% Yin, C., & Yau, S. S. T. (2015). An improved model for whole genome phylogenetic analysis by Fourier transform. Journal of Theoretical Biology, 382, 99-110.
%
% Changchuan Yin
% University of Illinois at Chicago
% Email: cyin1@uic.edu
% Last update 12/21/2017
clear

%------------------------------------------------------------------------
% 1. Get DNA sequences
NCBISeqs = fastaread('FluVirus.fasta');
m=length(NCBISeqs);
L=zeros(1,m);

for k = 1:length(NCBISeqs)
    header=NCBISeqs(k).Header;
    C=textscan(header, '%s', 'delimiter', '|');    
    X=C{1}; 
    id=X(1);          %Genbank access number of the DNA sequence
    name=char(X(2))   %Short name that will be on phylogenetic tree
    seq=NCBISeqs(k).Sequence;
    L(k)=length(seq);
    Genes(k).Header   = name;
    Genes(k).Sequence = seq;
end

%-------------------------------------------------------------------------
% 2.  Compute the distance matrix of the sequences
tic
maxL=max(L)
N=length(Genes);
distM=zeros(N,N);

for i=1:N
    seq1=Genes(i).Sequence;
    for j=i:N
        seq2=Genes(j).Sequence;
        option=get2DMappingOption(seq1,seq2);
        distM(i,j)= getDistanceFFTSpace_ES2D(seq1,seq2,maxL,option);
    end
end
maxDist=max(max(distM));
dM=distM/maxDist;
   
dz=[];
for k=2:N
  dm=dM(k-1,k:N)';
  dz=[dz;dm];
end

%-------------------------------------------------------------------------
%3.  Plot UPGMA tree using the distance matrix 
UPGMAtree = seqlinkage(dz,'UPGMA',Genes);
hTree = plot(UPGMAtree,'orient','left');
xlabel('Disimilarity distance', 'FontName', 'AvantGarde','FontSize', 10,'FontWeight','bold')
%title('UPGMA phylogenetic tree of bacterial genomes', 'FontName', 'AvantGarde','FontSize', 10,'FontWeight','bold')

% Set PaperPositionMode to auto so that the exported figure looks like it does on the screen.
set(gcf, 'PaperPositionMode', 'auto');
%print -depsc2 DFTS_ES2DTree_Bacteria_12212017_fig1.eps

wtime = toc

      

