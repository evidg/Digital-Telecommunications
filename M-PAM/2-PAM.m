%Καθορισμός χαρακτηριστικών ακολουθίας εισόδου, διαμορφωτή και Καναλιού
N = 3*10^4;
akolouthia_eisodou = randn(N,1);
M = 2;
SNR = 20;

%Metatropi ths akolouthias eisodou se bits 
for i=1:N     
    if (akolouthia_eisodou(i)<=0) 
        akolouthia_eisodou(i)=0; 
    else
        akolouthia_eisodou(i)=1;
    end
end

%Κατασκευή Κωδικοποιημένης ακολουθίας εισόδου
CODING = zeros(N,1);
for i=1:1:N
    if (akolouthia_eisodou(i)==0)
        CODING(i)=1; % symbolo 1
    elseif (akolouthia_eisodou(i)==1)
        CODING(i)=2; % symbolo 2
    end
end
%Χαρακτηριστικά Συστήματος
T_symbol = 40;
Tc = 4;
T_sample = 1;
fc=1/Tc;
Es = 1;
length_symbols=length(CODING);
symbols=CODING+1; %plithos symbolwn M
 
%Πλάτη συμβόλων για διαμόρφωση 2-PAM και υπολογισμός ενέργειας κάθε συμβόλου
for m=1:M
    Am(m)=(2*m-(M+1));
end
Em=sum(Am.^2)/length(Am);
 
%Κατασκευή ορθογώνιων παλμών
g_T=(2*repmat(symbols,1,T_symbol))-(M+1))/sqrt(Em)*sqrt(2*Es/T_symbol).*ones(length_symbols,T_symbol);
 
%Κατασκευή ζωνοπερατού σήματος για μετάδοση σε ζωνοπερατό κανάλι
s_m=reshape(g_T',1,length_symbols*T_symbol).*cos(2*pi*fc*t);
 
%Δημιουργία AWGN θορύβου και πρόσθεση του στο σήμα εισόδου
N_0 = 1 /log2(M)/(10^(SNR/10)); awgn = sqrt(N_0 / 2) * randn(size(s_m));
s_m_plus_noise = s_m + awgn;
 
%Μετατροπή σήματος στο δέκτη σε διάνυσμα
for i = 1: length_symbols
    t = 1:T_symbol;
    r(i,:) = signal1(i,:) * sqrt(2/T_symbol) .* cos(2*pi*fc*t);
end
 
%Υπολογισμός πλάτους των ληφθέντων συμβόλων
for m=1:M
    LEX(i)= (2*m)-(M+1);
end           
Em= sum(LEX.^2)/length(LEX); 
LEX = LEX./sqrt(Em);
out = zeros(length_symbols,1);
 
%Υπολογισμός Ευκλείδειας Απόστασης ληφθέντων διανυσμάτων από τα αρχικά διανύσματα
for i=1:length(r)
    for m=1:M
        distance(m)=norm(r(i,:)-LEX(m));
    end
[~,out(i)]=min(distance);
end
%Κατασκευή τελικής ακολουθίας στο δέκτη
for i=1:N
    %Κλασσική αποκωδικοποίηση
    if (out(i)==1)
        OUTPUT_SEQ(i)=0;
    elseif (out(i)==2)
        OUTPUT_SEQ(i)=1;
    end
end
 
%Υπολογισμός SER
counter = 0;
for i=1:length_symbols
     if (out(i) ~= CODING(i))
         counter = counter + 1;
     end
end
ser = counter/length_symbols;
 
%Υπολογισμός BER
counter = 0;
for i=1:N
    if (OUTPUT_SEQ(i) ~= akolouthia_eisodou(i))
        counter = counter + 1;
    end
end
ber = counter/length_symbols;
