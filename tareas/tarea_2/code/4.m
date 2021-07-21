%% DFT - iDFT
clc, clear, close all;
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
plotPath = "../plot_out/";

N = [256, 800, 4096];
n = 0:1:800-1;
fs = 8e3;
f1 = 50;
f2 = 100;
omega_1 = 2*pi*f1/fs;
omega_2 = 2*pi*f2/fs;
x1 = sin(omega_1*n);
x2 = cos(omega_2*n);
name = "4_1_a";
figure
	subplot(4,2,1)
		plot(n, x1, "color",Colors(1,:), "linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title('Señal original: sin(\omega_{1} t) ', "Interpreter","tex")
		grid on
	subplot(4,2,2)
		plot(n, x2, "color",Colors(2,:), "linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("Señal original: cos(\omega_{2} t)","Interpreter","tex")
		grid on
	for i = 1:1:3
		X1_temp = fft(x1, N(i));
		x1_temp = ifft(X1_temp);
		X2_temp = fft(x2, N(i));
		x2_temp = ifft(X2_temp);
		subplot(4,2,2*i +1)
			plot((0:1:N(i)-1), x1_temp, "color",Colors(1,:), "linewidth",1.15)
			xlabel("Muestras")
			ylabel("Amplitud")
			title("Señal reconstruida para N="+int2str(N(i)))
			grid on
			xlim([0, N(i)-1])
			
		subplot(4,2,2*i +2)
			plot((0:1:N(i)-1), x2_temp, "color",Colors(2,:), "linewidth",1.15)
			xlabel("Muestras")
			ylabel("Amplitud")
			title("Señal reconstruida para N="+int2str(N(i)))
			grid on
			xlim([0, N(i)-1])
	end
sgtitle('Reconstruccion de señales a partir de FFT, para diversos N') 	
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

X1 = fftshift(fft(x1));
X2 = fftshift(fft(x2));
k = ((0:1:799) - 400)*2*pi/800;
name = "4_1_b";
figure
	subplot(4,2,1)
		plot(k, abs(X1), "color",Colors(1,:), "linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Magnitud")
		title('Magnitud Espectro: sin(\omega_{1} t) ', "Interpreter","tex")
		grid on
		xlim([-0.2, 0.2])
	subplot(4,2,2)
		plot(k, abs(X2), "color",Colors(2,:), "linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Magnitud")
		title('Magnitud Espectro: cos(\omega_{2} t) ', "Interpreter","tex")
		grid on
		xlim([-0.2, 0.2])
	for i = 1:1:3
		X1_temp = fftshift(fft(x1, N(i)));
		X2_temp = fftshift(fft(x2, N(i)));
		k_temp = ((0:1:N(i)-1)-N(i)/2)*2*pi/N(i);
		subplot(4,2,2*i +1)
			plot(k_temp, abs(X1_temp), "color",Colors(1,:), "linewidth",1.15)
			xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
			ylabel("Magnitud")
			title("Magnitud FFT, N="+int2str(N(i)))
			grid on
			xlim([-0.2, 0.2])
			
		subplot(4,2,2*i +2)
			plot(k_temp, abs(X2_temp), "color",Colors(2,:), "linewidth",1.15)
			xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
			ylabel("Magnitud")
			title("Magnitud FFT, N="+int2str(N(i)))
			grid on
			xlim([-0.2, 0.2])
	end
sgtitle('Magnitud espectro de señales a partir de FFT, para diversos N') 	
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%%  Analisis espectral
clc, clear, close all;
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
plotPath = "../plot_out/";

% Blackman N = 800
N = 800;
n = 0:1:800-1;
fs = 8e3;
f1 = 50;
f2 = 100;
omega_1 = 2*pi*f1/fs;
omega_2 = 2*pi*f2/fs;
x1 = sin(omega_1*n);
x2 = cos(omega_2*n);
w = blackman(N);
y1 = x1.*w';
y2 = x2.*w';
Y1 = fftshift(fft(y1,N));
Y2 = fftshift(fft(y2,N));
k = ((0:1:N-1)-N/2)*2*pi/N;
name = "4_2_a"
figure
	subplot(3,2,1)
		plot(n, x1,"color",Colors(1,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title('Señal original: sin(\omega_{1} t) ', "Interpreter","tex")
		grid on
	subplot(3,2,2)
		plot(n, x2,"color",Colors(2,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("Señal original: cos(\omega_{2} t)","Interpreter","tex")
		grid on
	subplot(3,2,3)
		plot(n, y1,"color",Colors(1,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title('Señal enventanada: sin(\omega_{1} t) ', "Interpreter","tex")
		grid on
	subplot(3,2,4)
		plot(n, y2,"color",Colors(2,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("Señal enventanada : cos(\omega_{2} t)","Interpreter","tex")
		grid on
	subplot(3,2,5)
		plot(n, ifft(fft(y1)),"color",Colors(1,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title('Señal enventanada - IFFT: sin(\omega_{1} t) ', "Interpreter","tex")
		grid on
	subplot(3,2,6)
		plot(n, ifft(fft(y2)),"color",Colors(2,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("Señal enventanada - IFFT: cos(\omega_{2} t)","Interpreter","tex")
		grid on
	sgtitle("Señales originales y señales enventandas: Blackman L = 800");
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

name = "4_2_b"
figure
	% sin
	subplot(3,1,1)
		plot(k, abs(Y1), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Magnitud")
		title("Magnitud DFT señal y1[n] = x1[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
	subplot(3,1,2)
		plot(k, real(Y1), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte real DFT señal y1[n] = x1[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
		ylim([-200,200])
	subplot(3,1,3)
		plot(k, imag(Y1), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte imaginaria DFT señal y1[n] = x1[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
		ylim([-200,200])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

name = "4_2_c"
figure
	% cos
	subplot(3,1,1)
		plot(k, abs(Y2), "color",Colors(2,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Magnitud")
		title("DFT señal y2[n] = x2[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
	subplot(3,1,2)
		plot(k, real(Y2), "color",Colors(2,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte real DFT señal y2[n] = x2[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
		ylim([-200,200])
	subplot(3,1,3)
		plot(k, imag(Y2), "color",Colors(2,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte imaginaria DFT señal y2[n] = x2[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
		ylim([-200,200])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%%  Analisis espectral: Blackman N = 256
clc, clear, close all;
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
plotPath = "../plot_out/";

N = 256;
n = 0:1:N-1;
fs = 8e3;
f1 = 50;
f2 = 100;
omega_1 = 2*pi*f1/fs;
omega_2 = 2*pi*f2/fs;
x1 = sin(omega_1*n);
x2 = cos(omega_2*n);
w = blackman(N);
y1 = x1.*w';
y2 = x2.*w';
Y1 = fftshift(fft(y1,N));
Y2 = fftshift(fft(y2,N));
k = ((0:1:N-1)-N/2)*2*pi/N;
name = "4_2_d"
figure
	subplot(3,2,1)
		plot(n, x1,"color",Colors(1,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title('Señal original: sin(\omega_{1} t) ', "Interpreter","tex")
		grid on
		xlim([0, 256])
	subplot(3,2,2)
		plot(n, x2,"color",Colors(2,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("Señal original: cos(\omega_{2} t)","Interpreter","tex")
		grid on
		xlim([0, 256])
	subplot(3,2,3)
		plot(n, y1,"color",Colors(1,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title('Señal enventanada: sin(\omega_{1} t) ', "Interpreter","tex")
		grid on
		xlim([0, 256])
	subplot(3,2,4)
		plot(n, y2,"color",Colors(2,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("Señal enventanada : cos(\omega_{2} t)","Interpreter","tex")
		grid on
		xlim([0, 256])
	subplot(3,2,5)
		plot(n, ifft(fft(y1)),"color",Colors(1,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title('Señal enventanada - IFFT: sin(\omega_{1} t) ', "Interpreter","tex")
		grid on
		xlim([0, 256])
	subplot(3,2,6)
		plot(n, ifft(fft(y2)),"color",Colors(2,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("Señal enventanada - IFFT: cos(\omega_{2} t)","Interpreter","tex")
		grid on
		xlim([0, 256])
	sgtitle("Señales originales y señales enventandas: Blackman L = 256");
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

name = "4_2_e"
figure
	% sin
	subplot(3,1,1)
		plot(k, abs(Y1), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Magnitud")
		title("DFT señal y1[n] = x1[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
	subplot(3,1,2)
		plot(k, real(Y1), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte real DFT señal y1[n] = x1[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
	subplot(3,1,3)
		plot(k, imag(Y1), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte imaginaria DFT señal y1[n] = x1[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

name = "4_2_f"
figure
	% cos
	subplot(3,1,1)
		plot(k, abs(Y2), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Magnitud")
		title("DFT señal y2[n] = x2[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
	subplot(3,1,2)
		plot(k, real(Y2), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte real DFT señal y2[n] = x2[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
	subplot(3,1,3)
		plot(k, imag(Y2), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte imaginaria DFT señal y2[n] = x2[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%%  Analisis espectral
clc, clear, close all;
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
plotPath = "../plot_out/";

% rectwin N = 800
N = 800;
n = 0:1:800-1;
fs = 8e3;
f1 = 50;
f2 = 100;
omega_1 = 2*pi*f1/fs;
omega_2 = 2*pi*f2/fs;
x1 = sin(omega_1*n);
x2 = cos(omega_2*n);
w = rectwin(N);
y1 = x1.*w';
y2 = x2.*w';
Y1 = fftshift(fft(y1,N));
Y2 = fftshift(fft(y2,N));
k = ((0:1:N-1)-N/2)*2*pi/N;
name = "4_2_g"
figure
	subplot(3,2,1)
		plot(n, x1,"color",Colors(1,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title('Señal original: sin(\omega_{1} t) ', "Interpreter","tex")
		grid on
	subplot(3,2,2)
		plot(n, x2,"color",Colors(2,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("Señal original: cos(\omega_{2} t)","Interpreter","tex")
		grid on
	subplot(3,2,3)
		plot(n, y1,"color",Colors(1,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title('Señal enventanada: sin(\omega_{1} t) ', "Interpreter","tex")
		grid on
	subplot(3,2,4)
		plot(n, y2,"color",Colors(2,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("Señal enventanada : cos(\omega_{2} t)","Interpreter","tex")
		grid on
	subplot(3,2,5)
		plot(n, ifft(fft(y1)),"color",Colors(1,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title('Señal enventanada - IFFT: sin(\omega_{1} t) ', "Interpreter","tex")
		grid on
	subplot(3,2,6)
		plot(n, ifft(fft(y2)),"color",Colors(2,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("Señal enventanada - IFFT: cos(\omega_{2} t)","Interpreter","tex")
		grid on
	sgtitle("Señales originales y señales enventandas: RectWin L = 800");
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

name = "4_2_h"
figure
	% sin
	subplot(3,1,1)
		plot(k, abs(Y1), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Magnitud")
		title("Magnitud DFT señal y1[n] = x1[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
	subplot(3,1,2)
		plot(k, real(Y1), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte real DFT señal y1[n] = x1[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
		ylim([-200,200])
	subplot(3,1,3)
		plot(k, imag(Y1), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte imaginaria DFT señal y1[n] = x1[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
		ylim([-200,200])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

name = "4_2_i"
figure
	% cos
	subplot(3,1,1)
		plot(k, abs(Y2), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Magnitud")
		title("DFT señal y2[n] = x2[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
	subplot(3,1,2)
		plot(k, real(Y2), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte real DFT señal y2[n] = x2[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
		ylim([-200,200])
	subplot(3,1,3)
		plot(k, imag(Y2), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte imaginaria DFT señal y2[n] = x2[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
		ylim([-200,200])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%%  Analisis espectral: Blackman N = 256
clc, clear, close all;
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
plotPath = "../plot_out/";

N = 256;
n = 0:1:N-1;
fs = 8e3;
f1 = 50;
f2 = 100;
omega_1 = 2*pi*f1/fs;
omega_2 = 2*pi*f2/fs;
x1 = sin(omega_1*n);
x2 = cos(omega_2*n);
w = rectwin(N);
y1 = x1.*w';
y2 = x2.*w';
Y1 = fftshift(fft(y1,N));
Y2 = fftshift(fft(y2,N));
k = ((0:1:N-1)-N/2)*2*pi/N;
name = "4_2_j"
figure
	subplot(3,2,1)
		plot(n, x1,"color",Colors(1,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title('Señal original: sin(\omega_{1} t) ', "Interpreter","tex")
		grid on
		xlim([0, 256])
	subplot(3,2,2)
		plot(n, x2,"color",Colors(2,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("Señal original: cos(\omega_{2} t)","Interpreter","tex")
		grid on
		xlim([0, 256])
	subplot(3,2,3)
		plot(n, y1,"color",Colors(1,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title('Señal enventanada: sin(\omega_{1} t) ', "Interpreter","tex")
		grid on
		xlim([0, 256])
	subplot(3,2,4)
		plot(n, y2,"color",Colors(2,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("Señal enventanada : cos(\omega_{2} t)","Interpreter","tex")
		grid on
		xlim([0, 256])
	subplot(3,2,5)
		plot(n, ifft(fft(y1)),"color",Colors(1,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title('Señal enventanada - IFFT: sin(\omega_{1} t) ', "Interpreter","tex")
		grid on
		xlim([0, 256])
	subplot(3,2,6)
		plot(n, ifft(fft(y2)),"color",Colors(2,:),"linewidth",1.15)
		xlabel("Muestras")
		ylabel("Amplitud")
		title("Señal enventanada - IFFT: cos(\omega_{2} t)","Interpreter","tex")
		grid on
		xlim([0, 256])
	sgtitle("Señales originales y señales enventandas: RectWin L = 256");
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

name = "4_2_k"
figure
	% sin
	subplot(3,1,1)
		plot(k, abs(Y1), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Magnitud")
		title("DFT señal y1[n] = x1[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
	subplot(3,1,2)
		plot(k, real(Y1), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte real DFT señal y1[n] = x1[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
	subplot(3,1,3)
		plot(k, imag(Y1), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte imaginaria DFT señal y1[n] = x1[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

name = "4_2_l"
figure
	% cos
	subplot(3,1,1)
		plot(k, abs(Y2), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Magnitud")
		title("DFT señal y2[n] = x2[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
	subplot(3,1,2)
		plot(k, real(Y2), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte real DFT señal y2[n] = x2[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
	subplot(3,1,3)
		plot(k, imag(Y2), "color",Colors(1,:),"linewidth",1.15)
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter","latex")
		ylabel("Amplitud")
		title("Parte imaginaria DFT señal y2[n] = x2[n] \cdot w[n]","Interpreter","tex")
		grid on
		xlim([-pi, pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');
