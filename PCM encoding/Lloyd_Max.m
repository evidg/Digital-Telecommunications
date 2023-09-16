function [xq,centers,D,limits]=Lloyd_Max(x,N,min_value,max_value)
 
%x: sima eisodou
%N: arithmos bits
%max_value: megisti apodekti timi simatos eisodou
%min_value: elaxisti apodekti timi simatos eisodou
%xq: kbantismeno sima eksodou
%centers: kentra perioxwn kbantisis
%D: mesi paramorphosi stin i epanalipsi
%limits: akra perioxon kbantisis
 
%periorismos dynamikis perioxis simatos eisodou
x(x<min_value)=min_value;
x(x>max_value)=max_value;
M=2^N;
index=[M:-1:1];
%arxikopoiisi me xrisi omoiomorfou kbantisti
[xq,centers]=my_quantizer(x,N,min_value,max_value);
%algorithmos Lloyd_Max
kmax=200;
k=1;
while (k<kmax) && ((k<3) || (abs(D(k-1)-D(k-2))>1e-10))
    %ypologismos oriwn zwnwn kbantismou
    for i=1:M-1
        T(i)=(centers(i)+centers(i+1))/2;
    end
    %kbantisi tou simatos
    limits=flipud(T');
    [index1,xq]=quantiz(x,limits,index);
    %ypologismos mesi paramorfosis
    D(k)=mean((x-centers(xq)).^2);
    %ypologismos newn kentron kbantisis
    centers_old = centers;
    for i=1:M
        temp=find(xq==index(i));
        if ~isempty(temp)
            centers(i)=mean(x(temp));
        else
            centers(i)=centers_old(index(i));
        end
    end
    centers=flipud(centers);
    k=k+1;
end
limits = [min_value; limits; max_value];
