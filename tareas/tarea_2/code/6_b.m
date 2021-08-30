%% 5-a
clc, clear, close all;
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
rsrc_path = "../rsrc/";
plotPath = "../plot_out/";
[x,fs] = audioread(rsrc_path+"music.wav");
% Obtencion respuesta a impulso de filtro h[n]
N = 16;
h = zeros(1,N);
for i=1:1:N
	h(i) = (1/16)*(-1)^(i-1); % Dados los indices de matlab correcion i-1
end
% Se debe considerar, el tamaño de la convolucion obtenida en el tiempo al
% obtener la fft.
N_res = 1000;
H = fftshift(fft(h, N_res));