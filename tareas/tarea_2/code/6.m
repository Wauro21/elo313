%% 6 -a
clc, clear, close all;
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
rsrc_path = "../rsrc/";
plotPath = "../plot_out/";
audioPath = "../audio_out/";
[x,fs] = audioread(rsrc_path+"acc.wav");
% Obtencion respuesta a impulso de filtro h[n]
%t_I = 26; % Voz en t = 26 s
%t_F = t_I + 100e-3;
N = 16%length(x);
M = 16;
h = zeros(1,N);
for i=1:1:M
	h(i) = (1/16)*(-1)^(i-1); % Dados los indices de matlab correcion i-1
end
H = fft(h,length(x));
clear h;
% Filtrado señal
% -> Por FFT
X = fft(x);
Y = X.*H';
lX = length(X);
clear X;
lH = length(H);
clear H;
tic
y = ifft(Y,lH+lX-1);
toc % 3.351257 seconds.
clear Y;
%%
name = "6_a_freq_filt"
figure
	subplot(2,1,1)
		plot(x,"color",Colors(1,:),"linewidth",1.15)
		xlabel("Samples")
		ylabel("Amplitud")
		title("Señal original")
		grid on
	subplot(2,1,2)
		plot(real(y),"color",Colors(2,:), "linewidth",1.15)
		xlabel("Samples")
		ylabel("Amplitud")
		title("Señal filtrada")
		grid on
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');
%% -> Ec.Diferencia
% -> Ecuacion de diferencias
tic
x_length = length(x);
x_out = zeros(1,x_length);
x_int = [zeros(1,16-1) x'];
for i=1:1:x_length
	index = i + 15;
	temp = 0;
	for k = 1:1:16
		temp = temp + x_int(index-(k-1))*(-1)^(k-1);
	end
	x_out(i) = (1/16)*temp;
end
toc %6.683992
name = "6_a_diff_filt"
figure
	subplot(2,1,1)
		plot(x,"color",Colors(1,:),"linewidth",1.15)
		xlabel("Samples")
		ylabel("Amplitud")
		title("Señal original")
		grid on
	subplot(2,1,2)
		plot(x_out,"color",Colors(2,:), "linewidth",1.15)
		xlabel("Samples")
		ylabel("Amplitud")
		title("Señal filtrada")
		grid on
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% -> convolucion
N = 16;
M = 16;
h = zeros(1,N);
for i=1:1:M
	h(i) = (1/16)*(-1)^(i-1); % Dados los indices de matlab correcion i-1
end
H = fft(h);
tic
x_conv = conv(x,h);
toc % 0.171606
name = "6_a_conv_filt"
figure
	subplot(2,1,1)
		plot(x,"color",Colors(1,:),"linewidth",1.15)
		xlabel("Samples")
		ylabel("Amplitud")
		title("Señal original")
		grid on
	subplot(2,1,2)
		plot(x_conv,"color",Colors(2,:), "linewidth",1.15)
		xlabel("Samples")
		ylabel("Amplitud")
		title("Señal filtrada")
		grid on
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% Grafico error 100ms
t_i = 26; %s
n_i = t_i*fs;
t_f = 26 + 100e-3;
n_f = round(t_f*fs);
y_100 = y(n_i:n_f);
x_100 = x_conv(n_i:n_f);
name = "6_a_error";

figure
	plot(abs(y_100-x_100), "color",Colors(4,:),"linewidth",1.15)
	xlabel("Samples")
	ylabel("Diferencia")
	title("Diferencia entre señal filtrada en freq y por conv.")
	grid on
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');
clc, clear, close all;