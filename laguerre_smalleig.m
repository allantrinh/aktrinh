function laguerre_smalleig(N,a,sample,edge,loop)
% Smallest eigenvalue of X^\dagger*X
% Dimensions of X
format long

% Experiment sample size
data=zeros(1,sample);

for j=1:sample
    X=(randn(N+a,N)+i*randn(N+a,N));
    L=(X'*X)/2;
    DEig=eigs(L,1,'smallestabs'); 
%   SmallEig=(4*N)*(1-a/(2*N))^(-1)*min(DEig);
%     SmallEig=(4*N+2*a)*min(DEig);
%     data(j)=SmallEig;
    SmallEig=(4*N+2*a)*min(DEig);
     data(j)=SmallEig;
end

% [EigHist,Edges]=histcounts(data,nbins,'Normalization','pdf');
[EigHist,Edges]=histcounts(data,edge);
x=movsum(Edges,2)./2;
x=x(2:end);
plot(x,EigHist);

dataset=[x; EigHist]';
csvFileName=strcat('LaguerreSmallEig_N',int2str(N),'_a',int2str(a),'Trials',int2str(sample),'Loop',int2str(loop),'.csv');
dlmwrite(csvFileName,dataset,'precision', 15);
end

