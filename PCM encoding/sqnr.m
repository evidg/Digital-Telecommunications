function [sqnr_exper, sqnr_theor] = sqnr(x, xq, N, min_value, max_value, centers)
 
%Σε αυτό το σημείο θα υπολογίσουμε την πειραματική τιμή του SQNR 
ex = 0;
exq = 0;
 
for i = 1:length(xq)
    ex = ex + power(x(i),2); 
    exq = exq + power(x(i)-centers(xq(i)),2);
end
 
%Διαιρούμε με το 10000 για να κάνουμε πειραματικό υπολογισμό
sqnr_exper = (ex/length(x)) / (exq/length(x));
sqnr_exper = 10*log10(sqnr_exper);
 
%Σε αυτό το σημείο θα υπολογίσουμε τη θεωρητική τιμή του SQNR δηλαδή το
%λόγο της ισχύς του σήματος προς την ισχύ του θορύβου.
n = 2^N;
step = (max_value - min_value) / n;
D = 0;
R = 0;
syms x; %ορίζω την x ώς μεταβλητή - σύμβολο
    %Υπολογισμός της ισχύς του σήματος  
    F1 = (x^2)*exp(-x);
    K = int(F1, min_value, max_value);
    R = R + K;
    %Υπολογισμός της ισχύς του θορύβου 
for i = 1:n
    F2 = ((x - centers(i))^2)*exp(-x);
    S = int(F2, (i-1) * step, i * step);
    D = D + S;
end
 
R = eval(R);
D = eval(D);
 
%θεωρητική τιμή του SQNR
sqnr_theor = R / D; 
 
%Έκφραση της θεωρητικής τιμής του SQNR σε (db) σύμφωνα με την εκφώνηση της
%άσκησης.
sqnr_theor = 10*log10(sqnr_theor);
