%% Funcion de transferencia
clc, clear, close all;
plotPath = "../plots/";
name = "1_zp_diag";
figure 
	poles = [0.9];
	zeros = [1];
	zplane(zeros,poles)
	title("Diagrama de polos y ceros para filtro H(z)")
	grid on
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% Diagrama de magnitud y fase
clc, clear, close all;
plotPath = "../plots/";
name = "1_mag_phase";
num = [1 -1];
den = [1 -0.9];
[h,w] = freqz(num, den);
figure
	subplot(2,1,1)
		plot(w,abs(h))
		title("Magnitud del filtro")
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud -")
		grid on
		xlim([0,pi])
	subplot(2,1,2)
		plot(w,unwrap(angle(h)))
		title("Fase del filtro")
		xlabel("Frecuencia normalizada")
		ylabel("Fase rad")
		grid on
		xlim([0,pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% Filtro evaluado en pi/6
clc, clear, close all;
e_term = exp(j*pi/6);
Gn = 0.95;
num = e_term - 1;
den = e_term - 0.9;
H_e = Gn*num/den;

%% Filtraje electrocardiograma
clc, clear, close all;
plotPath = "../plots/";
ecg = load("../rsrc/ecg2x60.dat");
fs = 200; 
fr = 60;
X = fftshift(fft(ecg));
w = 2*pi*([0:1:length(ecg)-1] - length(ecg)/2)/length(ecg);
name = "ecg_time_freq";
figure
	subplot(3,1,1)
		plot([0:1:length(ecg)-1], ecg)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("ECG muestreado")
		axis tight
		grid on
	subplot(3,1,2)
		plot(w,db(X))
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud dB")
		title("Magnitud del espectro de la señal")
		grid on
		axis tight
	subplot(3,1,3)
		plot(w,unwrap(angle(X)))
		xlabel("Frecuencia normalizada")
		ylabel("Fase rad")
		title("Fase del espectro de la señal")
		grid on
		axis tight
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');
%% Filtro 2 ceros, 2 polos en cero
close all;
num  = [1 -2*cos(0.6*pi) 1];
den  = [1 0 0];
x_0 = filter(num,den,ecg);
% Analisis filtro
[h,w] = freqz(num, den);
name = "ecg_poles_0";
figure
	subplot(2,1,1)
		plot(w,db(h))
		title("Magnitud del filtro")
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud -")
		grid on
		xlim([0,pi])
	subplot(2,1,2)
		plot(w,unwrap(angle(h)))
		title("Fase del filtro")
		xlabel("Frecuencia normalizada")
		ylabel("Fase rad")
		grid on
		xlim([0,pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

% Resultado de filtraje
ecg_f_0 = filter(num, den, ecg);
X_f_0 = fftshift(fft(ecg_f_0));
w = 2*pi*([0:1:length(ecg_f_0)-1] - length(ecg_f_0)/2)/length(ecg_f_0);
name = "ecg_poles_0_filtered";
figure
	subplot(3,1,1)
		plot([0:1:length(ecg_f_0)-1], ecg_f_0)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("ECG muestreado - F1")
		axis tight
		grid on
	subplot(3,1,2)
		plot(w,db(X_f_0))
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud dB")
		title("Magnitud del espectro de la señal")
		grid on
		axis tight
	subplot(3,1,3)
		plot(w,unwrap(angle(X_f_0)))
		xlabel("Frecuencia normalizada")
		ylabel("Fase rad")
		title("Fase del espectro de la señal")
		grid on
		axis tight
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

name = "egc_f_0_comparative";
figure
	plot([0:1:length(ecg)-1], ecg)
	xlabel("Muestras")
	ylabel("Amplitud")
	title("Comparacion resultados")
	axis tight
	grid on
	hold on
	plot([0:1:length(ecg_f_0)-1], ecg_f_0)
	hold off
	legend(["Señal original", "Señal filtrada"]);
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% Filtro 2 ceros, 2 polos
close all;
num  = [1 -2*cos(0.6*pi) 1];
den  = [1 0.5562 0.8100];
x_1 = filter(num,den,ecg);
% Analisis filtro
[h,w] = freqz(num, den);
name = "ecg_poles_2";
figure
	subplot(2,1,1)
		plot(w,db(h))
		title("Magnitud del filtro")
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud -")
		grid on
		xlim([0,pi])
	subplot(2,1,2)
		plot(w,unwrap(angle(h)))
		title("Fase del filtro")
		xlabel("Frecuencia normalizada")
		ylabel("Fase rad")
		grid on
		xlim([0,pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

% Resultado de filtraje
ecg_f_2 = filter(num, den, ecg);
X_f_2 = fftshift(fft(ecg_f_2));
w = 2*pi*([0:1:length(ecg_f_2)-1] - length(ecg_f_2)/2)/length(ecg_f_2);
name = "ecg_poles_2_filtered";
figure
	subplot(3,1,1)
		plot([0:1:length(ecg_f_2)-1], ecg_f_2)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("ECG muestreado - F2")
		axis tight
		grid on
	subplot(3,1,2)
		plot(w,db(X_f_2))
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud dB")
		title("Magnitud del espectro de la señal")
		grid on
		axis tight
	subplot(3,1,3)
		plot(w,unwrap(angle(X_f_2)))
		xlabel("Frecuencia normalizada")
		ylabel("Fase rad")
		title("Fase del espectro de la señal")
		grid on
		axis tight
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

