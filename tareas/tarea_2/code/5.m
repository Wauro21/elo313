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
k = ([0:1:N_res-1] - N_res/2)/N_res;
name = "5_a_pi";
figure
	subplot(2,1,1)
		plot(2*pi*k, abs(H), "color",Colors(2,:), "linewidth",1.15);
		grid on
		xlabel("Frecuencia normalizada \textit{rad/sample}","Interpreter","latex")
		ylabel("Magnitud")
		title("Magnitud de la respuesta en frecuencia de h[n]")
		xlim([-pi,pi])
	subplot(2,1,2)
		plot(2*pi*k, unwrap(angle(H)), "color",Colors(2,:), "linewidth",1.15);
		grid on
		xlabel("Frecuencia normalizada \textit{rad/sample}","Interpreter","latex")
		ylabel("Fase rad")
		title("Fase de la respuesta en frecuencia de h[n]")
		xlim([-pi,pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');
name = "5_a_fs";
figure
	subplot(2,1,1)
		plot(fs*k, abs(H), "color",Colors(2,:), "linewidth",1.15);
		grid on
		xlabel("Frecuencia \textit{Hz}","Interpreter","latex")
		ylabel("Magnitud")
		title("Magnitud de la respuesta en frecuencia de h[n]")
		xlim([-fs/2,fs/2])
	subplot(2,1,2)
		plot(fs*k, unwrap(angle(H)), "color",Colors(2,:), "linewidth",1.15);
		grid on
		xlabel("Frecuencia \textit{Hz}","Interpreter","latex")
		ylabel("Fase rad")
		title("Fase de la respuesta en frecuencia de h[n]")
		xlim([-fs/2,fs/2])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');


name = "5_a_zero_pole";
figure
	zplane(h)
	grid on
	title("Diagrama de polos y ceros de h[n]")
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% 5-b
clc, clear, close all;
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
rsrc_path = "../rsrc/";
plotPath = "../plot_out/";
[x,fs] = audioread(rsrc_path+"music.wav");
N = 16;
h = zeros(1,N);
for i=1:1:N
	i-1
	h(i) = (1/16)*(-1)^(i-1); % Dados los indices de matlab correcion i-1
end
y = filtfilt(h,1,x);

name="5_b_filtfilt";
n = [0:1:length(x)-1];
x_lim = 100e-3*fs;
figure
	subplot(2,2,1)
		plot(n,x(:,1),"color",Colors(1,:),"linewidth",1.15)
		hold on
		plot(n,y(:,1),"color",Colors(2,:),"linewidth",1.15)
		xlabel("Samples")
		ylabel("Amplitud")
		title("Canal L")
		xlim([0,x_lim])
		grid on
		legend(["Señal original", "Señal filtrada"], "location","southeast")
	subplot(2,2,2)
		plot(n,x(:,2),"color",Colors(1,:),"linewidth",1.15)
		hold on
		plot(n,y(:,2),"color",Colors(2,:),"linewidth",1.15)
		xlabel("Samples")
		ylabel("Amplitud")
		title("Canal R")
		xlim([0,x_lim])
		grid on
		legend(["Señal original", "Señal filtrada"], "location","southeast")
	subplot(2,2,3)
		plot(n,y(:,1),"color",Colors(2,:),"linewidth",1.15)
		xlabel("Samples")
		ylabel("Amplitud")
		title("Señal filtrada: Canal L")
		xlim([0,x_lim])
		grid on
	subplot(2,2,4)
		plot(n,y(:,2),"color",Colors(2,:),"linewidth",1.15)
		xlabel("Samples")
		ylabel("Amplitud")
		title("Señal filtrada: Canal R")
		xlim([0,x_lim])
		grid on
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

% Comparacion magnitudes - Se toma el canal izquierdo, para realizar
% analisis
xL = x(:,1);
% ->Convolucion
x_conv = conv(xL,h);
% -> Ecuacion de diferencias
xL_length = length(xL);
x_out = zeros(1,xL_length);
xL_int = [zeros(1,16-1) xL'];
for i=1:1:xL_length
	index = i + 15;
	temp = 0;
	for k = 1:1:16
		temp = temp + xL_int(index-(k-1))*(-1)^(k-1);
	end
	x_out(i) = (1/16)*temp;
end
name = "5_b_time_comp"
figure
	subplot(4,1,1)
		plot(n,x(:,1),"color",Colors(1,:),"linewidth",1.15)
		grid on
		xlabel("samples")
		ylabel("Amplitud")
		title("Señal original, canal L, sin filtrar")
		xlim([0,x_lim])
	subplot(4,1,2)
		plot(n,y(:,1),"color",Colors(1,:),"linewidth",1.15)
		grid on
		xlabel("samples")
		ylabel("Amplitud")
		title("Señal filtrada: filtfilt, canal L")
		xlim([0,x_lim])
	subplot(4,1,3)
		plot([n ones(1,15)],x_conv,"color",Colors(1,:),"linewidth",1.15)
		grid on
		xlabel("samples")
		ylabel("Amplitud")
		title("Señal filtrada: convolucion, canal L")
		xlim([0,x_lim])
	subplot(4,1,4)
		plot(n,x_out,"color",Colors(1,:),"linewidth",1.15)
		grid on
		xlabel("samples")
		ylabel("Amplitud")
		title("Señal filtrada: ecuacion diferencias, canal L")
		xlim([0,x_lim])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

% Magnitud - fase
X = fftshift(fft(xL));
Y = fftshift(fft(y(:,1)));
X_conv = fftshift(fft(x_conv,xL_length));
XL = fftshift(fft(x_out));
k = ([0:1:xL_length-1]-xL_length/2)/xL_length;

name = "5_b_freq_comp";
figure
% Señal original
	subplot(4,2,1)
		plot(2*pi*k, db(X),"color",Colors(1,:), "linewidth", 1.15);
		grid on
		xlabel("Frecuencia normalizada \textit{rad/sample}","Interpreter","latex")
		ylabel("Magnitud dB")
		title("Magnitud señal original")
		xlim([-pi,pi])
	subplot(4,2,2)
		plot(2*pi*k, unwrap(angle(X)),"color",Colors(1,:), "linewidth", 1.15);
		grid on
		xlabel("Frecuencia normalizada \textit{rad/sample}","Interpreter","latex")
		ylabel("Fase rad")
		title("Fase señal original")
		xlim([-pi,pi])
% Señal filtfilt
	subplot(4,2,3)
		plot(2*pi*k, db(Y),"color",Colors(1,:), "linewidth", 1.15);
		grid on
		xlabel("Frecuencia normalizada \textit{rad/sample}","Interpreter","latex")
		ylabel("Magnitud dB")
		title("Magnitud filtro filtfilt")
		xlim([-pi,pi])
	subplot(4,2,4)
		plot(2*pi*k, unwrap(angle(Y)),"color",Colors(1,:), "linewidth", 1.15);
		grid on
		xlabel("Frecuencia normalizada \textit{rad/sample}","Interpreter","latex")
		ylabel("Fase rad")
		title("Fase filtro filtfilt")
		xlim([-pi,pi])
%Señal conv
	subplot(4,2,5)
		plot(2*pi*k, db(X_conv),"color",Colors(1,:), "linewidth", 1.15);
		grid on
		xlabel("Frecuencia normalizada \textit{rad/sample}","Interpreter","latex")
		ylabel("Magnitud dB")
		title("Magnitud filtro convolucion")
		xlim([-pi,pi])
	subplot(4,2,6)
		plot(2*pi*k, unwrap(angle(X_conv)),"color",Colors(1,:), "linewidth", 1.15);
		grid on
		xlabel("Frecuencia normalizada \textit{rad/sample}","Interpreter","latex")
		ylabel("Fase rad")
		title("Fase filtro convolucion")
		xlim([-pi,pi])
% Señal diferencias
	subplot(4,2,7)
		plot(2*pi*k, db(XL),"color",Colors(1,:), "linewidth", 1.15);
		grid on
		xlabel("Frecuencia normalizada \textit{rad/sample}","Interpreter","latex")
		ylabel("Magnitud dB")
		title("Magnitud filtro diferencias")
		xlim([-pi,pi])
	subplot(4,2,8)
		plot(2*pi*k, unwrap(angle(XL)),"color",Colors(1,:), "linewidth", 1.15);
		grid on
		xlabel("Frecuencia normalizada \textit{rad/sample}","Interpreter","latex")
		ylabel("Fase rad")
		title("Fase filtro diferencias")
		xlim([-pi,pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');
%% 5-c
clc, clear, close all;
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
rsrc_path = "../rsrc/";
plotPath = "../plot_out/";
audioPath = "../audio_out/";
[x,fs] = audioread(rsrc_path+"music.wav");

X = fft(x);
magX = abs(X);
phaseX = angle(X);
X_reverse = magX.*exp(-j*phaseX);
x_reverse = real(ifft(X_reverse));
audiowrite(audioPath+"reverse_time_signal.wav",real(x_reverse),fs);
k = ([0:1:length(X)-1]-length(X)/2)/length(X);
n = [0:1:length(X)-1];

name = "5_c_time"
figure
	subplot(2,2,1)
		plot(n,x(:,1), "color",Colors(1,:),"linewidth",1.15)
		xlabel("samples")
		ylabel("Amplitud")
		title("Señal original en el tiempo, canal L")
		grid on
		xlim([0,n(end)])
	subplot(2,2,2)
		plot(n,x(:,2), "color",Colors(1,:),"linewidth",1.15)
		xlabel("samples")
		ylabel("Amplitud")
		title("Señal original en el tiempo, canal R")
		grid on
		xlim([0,n(end)])
	subplot(2,2,3)
		plot(n,x_reverse(:,1), "color",Colors(2,:),"linewidth",1.15)
		xlabel("samples")
		ylabel("Amplitud")
		title("Señal invertida en el tiempo, canal L")
		grid on
		xlim([0,n(end)])
	subplot(2,2,4)
		plot(n,x_reverse(:,2), "color",Colors(2,:),"linewidth",1.15)
		xlabel("samples")
		ylabel("Amplitud")
		title("Señal invertida en el tiempo, canal R")
		grid on
		xlim([0,n(end)])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

% Magnitud y fase : Canal L
name = "5_c_fft_comp";
figure
	subplot(2,2,1)
		plot(2*pi*k,abs(fftshift(X(:,1))), "color",Colors(2,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada rad/samples")
		ylabel("Amplitud")
		title("Magnitud señal original, canal L")
		grid on
 	subplot(2,2,2)
		plot(2*pi*k,unwrap(angle(fftshift(X(:,1)))), "color",Colors(2,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada rad/samples")
		ylabel("Fase rad")
		title("Fase señal original, canal L")
		grid on
	subplot(2,2,3)
		plot(2*pi*k,abs(fftshift(X_reverse(:,1))), "color",Colors(2,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada rad/samples")
		ylabel("Amplitud")
		title("Magnitud señal tiempo inverso, canal L")
		grid on
 	subplot(2,2,4)
		plot(2*pi*k,unwrap(angle(fftshift(X_reverse(:,1)))), "color",Colors(2,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada rad/samples")
		ylabel("Fase rad")
		title("Fase señal tiempo inverso, canal L")
		grid on
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% Fasea aleatoria

clc, clear, close all;
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
rsrc_path = "../rsrc/";
plotPath = "../plot_out/";
audioPath = "../audio_out/";
[x,fs] = audioread(rsrc_path+"music.wav");
X = fft(x);
magX = abs(X);
phaseX = angle(X);
randPhase = rand(length(X),2);
X_reverse = magX.*exp(j*2*pi*length(X)*randPhase);
x_reverse = real(ifft(X_reverse));
audiowrite(audioPath+"random_phase_signal.wav",real(x_reverse),fs);
k = ([0:1:length(X)-1]-length(X)/2)/length(X);
n = [0:1:length(X)-1];

name = "5_d_time"
figure
	subplot(2,2,1)
		plot(n,x(:,1), "color",Colors(1,:),"linewidth",1.15)
		xlabel("samples")
		ylabel("Amplitud")
		title("Señal original en el tiempo, canal L")
		grid on
		xlim([0,n(end)])
	subplot(2,2,2)
		plot(n,x(:,2), "color",Colors(1,:),"linewidth",1.15)
		xlabel("samples")
		ylabel("Amplitud")
		title("Señal original en el tiempo, canal R")
		grid on
		xlim([0,n(end)])
	subplot(2,2,3)
		plot(n,x_reverse(:,1), "color",Colors(2,:),"linewidth",1.15)
		xlabel("samples")
		ylabel("Amplitud")
		title("Señal invertida en el tiempo, canal L")
		grid on
		xlim([0,n(end)])
	subplot(2,2,4)
		plot(n,x_reverse(:,2), "color",Colors(2,:),"linewidth",1.15)
		xlabel("samples")
		ylabel("Amplitud")
		title("Señal invertida en el tiempo, canal R")
		grid on
		xlim([0,n(end)])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

% Magnitud y fase : Canal L
name = "5_d_fft_comp";
figure
	subplot(2,2,1)
		plot(2*pi*k,abs(fftshift(X(:,1))), "color",Colors(2,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada rad/samples")
		ylabel("Amplitud")
		title("Magnitud señal original, canal L")
		grid on
 	subplot(2,2,2)
		plot(2*pi*k,unwrap(angle(fftshift(X(:,1)))), "color",Colors(2,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada rad/samples")
		ylabel("Fase rad")
		title("Fase señal original, canal L")
		grid on
	subplot(2,2,3)
		plot(2*pi*k,abs(fftshift(X_reverse(:,1))), "color",Colors(2,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada rad/samples")
		ylabel("Amplitud")
		title("Magnitud señal tiempo inverso, canal L")
		grid on
 	subplot(2,2,4)
		plot(2*pi*k,unwrap(angle(fftshift(X_reverse(:,1)))), "color",Colors(2,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada rad/samples")
		ylabel("Fase rad")
		title("Fase señal tiempo inverso, canal L")
		grid on
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');
