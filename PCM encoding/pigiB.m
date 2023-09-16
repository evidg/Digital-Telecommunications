close all; clear; clc;
%kwdikopoisi pigis Β
%fortwsi simatos
[x_A,fs,N]=wavread('speech.wav');
%kbantismos twn simatwn gia diaforetiko arithmo bits
%PCM N=2
[xqA_lloyd_2,centersA_lloyd_2,D_2]=Lloyd_Max(x_A,2,-1,1);
%PCM N=4
[xqA_lloyd_4,centersA_lloyd_4,D_4]=Lloyd_Max(x_A,4,-1,1);
 
%ypologismos SQNR
%N=2
SQNR_A_2_lloyd=compSQNR(x_A,[],D_2);
figure;
plot(1:length(D_2),SQNR_A_2_lloyd,'b.-');
title('SQNR_{lloyd}(k) N=2');
xlabel('Arithmos epanalipsis k');
ylabel('SQNR (db)');
%N=4
SQNR_A_4_lloyd=compSQNR(x_A,[],D_4);
figure;
plot(1:length(D_4),SQNR_A_4_lloyd,'b.-');
title('SQNR_{lloyd}(k) N=4');
xlabel('Arithmos epanalipsis k');
ylabel('SQNR (db)');
 
%akoustiko apotelesma kai kymatomorfes
%arxiko sima
wavplay(x_A,fs);
figure;
plot(1:length(x_A),x_A);
title('Arxiko sima');
xlabel('samples n');
pause;
%N=2
wavplay(centersA_lloyd_2(xqA_lloyd_2),fs);
figure;
plot(1:length(x_A),centersA_lloyd_2(xqA_lloyd_2));
title('Mi Omoiomorfi Kbantisi N=2');
xlabel('samples n');
pause;
%N=4
wavplay(centersA_lloyd_4(xqA_lloyd_4),fs);
figure;
plot(1:length(x_A),centersA_lloyd_4(xqA_lloyd_4));
title('Mi Omoiomorfi Kbantisi N=4');
xlabel('samples n');
pause;
