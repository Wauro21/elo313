clc, clear,close all;
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
plotPath = "../plot_out/";

n = 0:1:99;
x = cos(pi*n/20);
X_100 = fftshift(fft(x,100));
X_400 = fftshift(fft(x,400));
k_100 = ((0:1:99)-50)*2*pi/100; 
k_400 = ((0:1:400-1)-200)*2*pi/400;
name="3_1";
figure
	plot(k_100,abs(X_100)/100, "color",Colors(2,:),"linewidth",1.15)
	hold on
	plot(k_400,abs(X_400)/100, "color",Colors(1,:),"linewidth",1.15)
	grid on
	xlabel("Frecuencia Normalizada \textit{rad/muestra}","Interpreter","latex")
	ylabel("Amplitud -")
	title("Comparacion señales de amplitud FFT normalizadas para N= 100 y N= 400")
	xlim([-pi, pi])
	legend(["N = 100", "N = 400"], "location","northeast")
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');


%% 
clc, clear, close all;
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
plotPath = "../plot_out/";

n = 0:1:99;
x = cos(pi*n/20);
N = [1000, 5000, 10000, 20000];
name = "3_2"
figure
	for i= 1:1:4
		k = ((0:1:N(i)-1)-N(i)/2)*2*pi/N(i);
		X_temp = fftshift(fft([x zeros(1, N(i)-100)],N(i)));
		subplot(2,2,i)
			plot(k,abs(X_temp), "color",Colors(i,:),"linewidth",1.15)
			grid on
			xlim([-pi,pi])
			xlabel("Frecuencia normalizada \textit{rad/s}", "Interpreter","latex")
			ylabel("Magnitud")
			title("Magnitud FFT con N="+int2str(N(i)))
	end
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');