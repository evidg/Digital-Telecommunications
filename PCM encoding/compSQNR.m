function SQNR_peir=compSQNR(x,xq,D)
%ypologismos tis peiramatikis timis tou SQNR
Px_peir=mean(x.^2);
if nargin>2
    Pnoise_peir=D;
else
    Pnoise_peir=mean((x-xq).^2);
end
SQNR_peir=10*log10(Px_peir./Pnoise_peir);
