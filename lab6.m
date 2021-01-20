%% lab6 - es2 - Analisi delle tessiture, dove si trova il difetto? 
% Utilizzare in combinazione filtro passa-basso e metodo di otsu per
% ottenere la porzione di tessitura danneggiata. 

clear all
close all
clc

I = rgb2gray(imread('img/test.jpg'));
[M,N] = size(I);

% 1. Analizzare l'output della binarizzazione di Otsu direttamente
% sull'immagine non filtrata

% Troppe alte frequenze! Proviamo a toglierle con un filtro passa-basso!
I = double(I);
imagesc(I);

% 2. Creare il padding

% 3. Calcolare la DFT dell'immagine appena creata

% 4. Generare un filtro passa-basso Gaussiano

% 5. Eseguire la moltiplicazione tra filtro e il risultato della
% DFT 

% 6. Ricostruire l'immagine tramite FFT inversa e ricentratura (immagine
% di dimensione PxQ)

% 7. Rimozione del padding, in modo da tornare ad una immagine di
% dimensioni MxN


% 8. Attraverso il metodo di Otsu, binarizzo l'immagine e cerco il difetto
% nella texture

I_highlight =  cat(3, I, I, I);
[rr,cc] = ind2sub(size(BW),find(BW==0));
for i=1:numel(rr)
    I_highlight(rr(i),cc(i),1:3)=255;
    I_highlight(rr(i),cc(i),3)=0;
end

% Visualizzazione dei risultati
figure;
subplot(2,3,1);imshow(uint8(I));title('Original image');
subplot(2,3,2);imshow(uint8(Ipad));title('Padding');
subplot(2,3,3);imshow(log10(1+abs(him)),[]); title('Fourier Transform');
subplot(2,3,4);imshow(uint8(rim),[]);title('Filtered image');
subplot(2,3,5);imshow(uint8(BW),[]);title('Binarized image');
subplot(2,3,6);imshow(uint8(I_highlight),[]);title('Original Image with defects highlighted');