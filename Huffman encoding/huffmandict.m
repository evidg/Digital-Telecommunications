function [ encodedsymbols ] = huffmandict(alphabet, probabilitymatrix)
 
[~ , alphabetsize] = size(alphabet); %to megethos tou alfavitou
 
symbolmatrix = zeros(alphabetsize, alphabetsize); %edo tha ginoun oi prostheseis ton pithanotiton ton sumbolon
 
symbolmatrix(1, :) = probabilitymatrix; %i proti seira einai to probabilitymatrix
encodedsymbols = repmat({''}, 1, alphabetsize);
 
%se kathe vima vriskoume tis 2 mikroteres pithanotites. Ti mia apo tis duo tin kanoume isi me to athroisma tous kai tin alli tin kanoume monada
for i=2:alphabetsize
[minimum,J1] = min(symbolmatrix(1,:));
symbolmatrix(1, J1) = 1;
symbolmatrix(i, J1) = -1;
[secondminimum, J2] = min(symbolmatrix(1,:));
symbolmatrix(i, J2) = 1;
symbolmatrix(1, J2) = symbolmatrix(1, J2) + minimum;
end
 
%ksekinontas apo to telos, paragoume tin kodikopοiisi huffman
for i=alphabetsize:-1:2
addone = find(symbolmatrix(i, :)== 1);
addzero = find(symbolmatrix(i, :)==-1);
predecessor = encodedsymbols(1, addone);
encodedsymbols(1, addzero ) = strcat(predecessor, num2str(0)); %predecessor+0
encodedsymbols(1, addone ) = strcat(predecessor, num2str(1)); %predecessor + 1
end
