function [ImageDefects] = main(img)

clc

% imposto il path dell'immagine
image = strcat('img/', img);

% converto l'immagine in scala di grigi e ne prendo le dimensioni
A = rgb2gray(imread(image));
[R,C]=size(A);

% imposto dei pattern
pattern1 = A(1:14,1:14); 
pattern2 = A(2:15,2:15);
pattern3 = A(R-13:R,C-13:C);
pattern4 = A(R-14:R-1,C-14:C-1);
pattern5 = A(1:14,C-13:C);
pattern6 = A(2:15,C-14:C-1);

% calcolo la cross-correlazione 2D normalizzata
c1 = normxcorr2(pattern1,A);
c2 = normxcorr2(pattern2,A);
c3 = normxcorr2(pattern3,A);
c4 = normxcorr2(pattern4,A);
c5 = normxcorr2(pattern5,A);
c6 = normxcorr2(pattern6,A);

% calcolo la media, elimino il padding e calcolo il valore assoluto
c = (c1+c2+c3+c4+c5+c6)/6; 
c = c(13:end-13,13:end-13); 
c=abs(c);

% calcolo il valore in base al quale imposto la maschera
m = mean(c(:));

% creo la maschera
mask = c<m;

% 'pulisco' la maschera iniziale
se = strel('disk',3);
mask2 = imopen(mask,se);

% creo l'immagine risultato
A=A(6:end-7,6:end-7);
A1 = A;
A1(mask2)=255;
Af=cat(3,A1,A,A);

% imposto l'immagine risultato come output mostrato nella GUI
ImageDefects=Af;

end