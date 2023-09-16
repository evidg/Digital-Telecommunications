%Κωδικοποίηση στον πομπό
CODING = zeros(N,1);
for i=1:3:N-2
    if ((akolouthia_eisodou(i)==0)&&(akolouthia_eisodou(i+1)==0)&&(akolouthia_eisodou(i+2)==0))
        CODING(i)=1; % symbolo 1 (000)
        CODING(fix(i/3) + mod(i,3)) = 1;
    elseif ((akolouthia_eisodou(i)==0)&&(akolouthia_eisodou(i+1)==0)&&(akolouthia_eisodou(i+2)==1))
        CODING(fix(i/3) + mod(i,3))=2; % symbolo 2 (001)
    elseif ((akolouthia_eisodou(i)==0)&&(akolouthia_eisodou(i+1)==1)&&(akolouthia_eisodou(i+2)==0))
        CODING(fix(i/3) + mod(i,3))=4; % symbolo 3 (010)
    elseif ((akolouthia_eisodou(i)==0)&&(akolouthia_eisodou(i+1)==1)&&(akolouthia_eisodou(i+2)==1))
        CODING(fix(i/3) + mod(i,3))=3; % symbolo 4 (011)
    elseif ((akolouthia_eisodou(i)==1)&&(akolouthia_eisodou(i+1)==0)&&(akolouthia_eisodou(i+2)==0))
        CODING(fix(i/3) + mod(i,3))=8; % symbolo 5 (100)
    elseif ((akolouthia_eisodou(i)==1)&&(akolouthia_eisodou(i+1)==0)&&(akolouthia_eisodou(i+2)==1))
        CODING(fix(i/3) + mod(i,3))=7; % symbolo 6 (101)
    elseif ((akolouthia_eisodou(i)==1)&&(akolouthia_eisodou(i+1)==1)&&(akolouthia_eisodou(i+2)==0))
        CODING(fix(i/3) + mod(i,3))=5; % symbolo 7 (110)
    elseif ((akolouthia_eisodou(i)==1)&&(akolouthia_eisodou(i+1)==1)&&(akolouthia_eisodou(i+2)==1))
        CODING(fix(i/3) + mod(i,3))=6; % symbolo 8 (111)
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
    elseif (out(p)==4)
        DECODING(p*3-2)=0;
        DECODING(p*3-1)=1; 
        DECODING(p*3)=0; 
    elseif (out(p)==3)
        DECODING(p*3-2)=0;
        DECODING(p*3-1)=1; 
        DECODING(p*3)=1;
    elseif (out(p)==8)
        DECODING(p*3-2)=1;
        DECODING(p*3-1)=0;
        DECODING(p*3)=0;
    elseif (out(p)==7)
        DECODING(p*3-2)=1;
        DECODING(p*3-1)=0;
        DECODING(p*3)=1;
    elseif (out(p)==5)
        DECODING(p*3-2)=1;
        DECODING(p*3-1)=1;
        DECODING(p*3)=0;
    elseif (out(p)==6)
        DECODING(p*3-2)=1;
        DECODING(p*3-1)=1;
        DECODING(p*3)=1;
    end
end

%Γραφική παράσταση BER και SER
counter = 1;
myseq = 10000;

for i = 0:5:40
[pam2nogray(counter),pam2sernogray(counter)] = functions_merosb(myseq,0,2,i);
[pam8nogray(counter),pam8nograyser(counter)] = functions_merosb(myseq,0,8,i);
[pam8gray(counter),~] = functions_merosb(myseq,1,8,i);
counter = counter+1;
end

figure;
xlabel('SNR');
ylabel('BER');
semilogy([0:5:40], pam2nogray, 'k-v');
hold on;
semilogy([0:5:40], pam8nogray, 'g-v');
hold on;
semilogy([0:5:40], pam8gray, 'r-v');
axis([-3 20 10^-5 1])
legend('M=2 - WITHOUT Gray Code', 'M=8 - WITHOUT Gray Code)','M=8 WITH Gray Code)');
hold off;

figure
xlabel('SNR');
ylabel('SER');
semilogy([0:5:40], pam2sernogray, 'g--v');
hold on;
semilogy([0:5:40], pam8nograyser, 'k-v');
axis([-3 20 10^-5 1])
legend('M=2 WITHOUT Gray Code)', 'M=8 WITH Gray Code)');
hold off;

