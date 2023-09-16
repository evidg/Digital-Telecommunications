words=importdata('kwords.txt'); %ypologismos pithanotiton gia kathe gramma
words=upper( [words{:}]);
line = regexprep( words, '-','');
inputcharacters = strrep(line , '.','');
 
alphabet ='A':'Z';
 
total=sum(ismember(words, alphabet));
 
for k=1:numel(alphabet)
probabilitymatrix(1, k)=sum(ismember(words, alphabet(k)))/total;
end
 
encodedsymbols = huffmandict(alphabet, probabilitymatrix);
 
encodedoutput = huffmanenco(inputcharacters, alphabet, encodedsymbols, 1);
 
originalcharacters = huffmandeco (encodedoutput, alphabet, encodedsymbols, 1);
