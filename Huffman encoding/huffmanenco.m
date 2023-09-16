function [ encodedoutput ] = huffmanenco(inputcharacters, alphabet, encodedsymbols, length)
 
[~, inputsize] = size(inputcharacters);
 
encodedoutput ='';
 
for i=1:slength:inputsize
pos = [];
 
if (length == 1)
token = inputcharacters(1, i); %lamvanoume ton i-sto xaraktira tis akolouthias eisodou
 
pos = find(alphabet == token);
end
 
if (length==2)
token = strcat(inputcharacters(1, i), inputcharacters(1, i+1));
pos2 = strfind(alphabet, token);
pos = (pos2(1, find(mod(pos2, 2) , 1))+1)/2;
end
 
if (isempty(pos)==0)
 
%synenonoume to trexon symvolo me ta proigoumena
encodedoutput = strcat(encodedoutput, encodedsymbols(1, pos)); 
 
end
end
