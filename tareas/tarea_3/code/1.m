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

%% Filtro evaluado en pi/6
clc, clear, close all;
e_term = exp(-j*pi/6);
Gn = 0.95;
num = e_term - 1;
den = e_term - 0.9;
H_e = Gn*num/den;
