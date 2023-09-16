function [ originalcharacters ] = huffmandeco(encodedoutput , alphabet, encodedsymbols, length)
 
searchfor = encodedoutput{1,1};
 
[~, inputsize] = size(encodedsymbols);
 
innercounter =1;
length(searchfor)
 
start=1;
end=1;
 
while (end<=length(searchfor))
token = searchfor(start:end);
 
for i=1:inputsize
if (strcmp(token, encodedsymbols{1, i})==1);
 
if (length == 1)
originalcharacters(1, innercounter)=alphabet(1, i);
end
 
if (length == 2)
originalcharacters(1, innercounter)=alphabet(1, 2*i -1);
originalcharacters(1, innercounter+1) = alphabet(1, 2*i);
innercounter=innercounter+1;
end
 
innercounter = innercounter +1;
start=end+1;
break;
end
end
 
end=end+1;
end
