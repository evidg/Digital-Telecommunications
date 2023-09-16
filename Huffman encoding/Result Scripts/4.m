probabilitymatrix = [0.082 0.015 0.028 0.043 0.13 0.022 0.02 0.061 0.07 0.0015 0.0077 0.04 0.024 0.067 0.075 0.019 0.00095 0.06 0.063 0.091 0.028 0.0098 0.024 0.0015 0.02 0.00074];
 
alphabet = 'A':'Z';
 
j=1, i=1;
newalphabet = '';
 
for k=1:676  %dimiourgia neou alfavitou me 676 symvola
newalphabet = strcat(newalphabet, strcat(alphabet(1, j), alphabet(1, i)));
newprobabilitymatrix(1, k) = probabilitymatrix(1, j)*probabilitymatrix(1, i);
 
i=i+1;
 
if (mod(k, 26)==0)
j=j+1;
end
if (i>26)
i=1;
end
end
 
inputcharacters=char(randsrc(1, 10000, [65:90;probabilitymatrix]));
 
encodedsymbols=huffmandict(newalphabet, newprobabilitymatrix);
 
encodedoutput=huffmanenco(inputcharacters, newalphabet, encodedsymbols, 2);
 
originalcharacters=huffmandeco (encodedoutput, newalphabet, encodedsymbols, 2);
