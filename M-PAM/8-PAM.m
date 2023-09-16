%Κωδικοποίηση στον πομπό
CODING = zeros(N,1);
for i=1:3:N-2
    if ((akolouthia_eisodou(i)==0)&&(akolouthia_eisodou(i+1)==0)&&(akolouthia_eisodou(i+2)==0))
        CODING(fix(i/3) + mod(i,3)) = 1;
    elseif ((akolouthia_eisodou(i)==0)&&(akolouthia_eisodou(i+1)==0)&&(akolouthia_eisodou(i+2)==1))
        CODING(fix(i/3) + mod(i,3))=2;
    elseif ((akolouthia_eisodou(i)==0)&&(akolouthia_eisodou(i+1)==1)&&(akolouthia_eisodou(i+2)==0))
        CODING(fix(i/3) + mod(i,3))=3;
    elseif ((akolouthia_eisodou(i)==0)&&(akolouthia_eisodou(i+1)==1)&&(akolouthia_eisodou(i+2)==1))
        CODING(fix(i/3) + mod(i,3))=4;
    elseif ((akolouthia_eisodou(i)==1)&&(akolouthia_eisodou(i+1)==0)&&(akolouthia_eisodou(i+2)==0))
        CODING(fix(i/3) + mod(i,3))=5;
    elseif ((akolouthia_eisodou(i)==1)&&(akolouthia_eisodou(i+1)==0)&&(akolouthia_eisodou(i+2)==1))
        CODING(fix(i/3) + mod(i,3))=6;
    elseif ((akolouthia_eisodou(i)==1)&&(akolouthia_eisodou(i+1)==1)&&(akolouthia_eisodou(i+2)==0))
        CODING(fix(i/3) + mod(i,3))=7;
    elseif ((akolouthia_eisodou(i)==1)&&(akolouthia_eisodou(i+1)==1)&&(akolouthia_eisodou(i+2)==1))
        CODING(fix(i/3) + mod(i,3))=8;
    end
end


%Κωδικοποίηση στο δέκτη
for p=1:N
   if (out(I)==1)
        DECODING(p*3-2)=0;
        DECODING(p*3-1)=0;
        DECODING(p*3)=0;
   elseif (out(p)==2)
        DECODING(p*3-2)=0;
        DECODING(p*3-1)=0;
        DECODING(p*3)=1;
   elseif (out(p)==3)
        DECODING(p*3-2)=0;
        DECODING(p*3-1)=1;
        DECODING(p*3)=0; 
   elseif (out(p)==4)
        DECODING(p*3-2)=0;
        DECODING(p*3-1)=1;
        DECODING(p*3)=1;
   elseif (out(p)==5)
        DECODING(p*3-2)=1;
        DECODING(p*3-1)=0;
        DECODING(p*3)=0;
   elseif (out(p)==6)
        DECODING(p*3-2)=1;
        DECODING(p*3-1)=0; 
        DECODING(p*3)=1;
   elseif (out(p)==7)
        DECODING(p*3-2)=1;
        DECODING(p*3-1)=1;
        DECODING(p*3)=0;
   elseif (out(p)==8)
        DECODING(p*3-2)=1;
        DECODING(p*3-1)=1; 
        DECODING(p*3)=1;
   end
end
