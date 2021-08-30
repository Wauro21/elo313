%% Identificacion de vocales
clc, clear, close all;
plotPath="../plots/";
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
vowels = load("../rsrc/vowels.mat");
a = vowels.vowel_a;
e = vowels.vowel_e;
i = vowels.vowel_i;
o = vowels.vowel_o;
u = vowels.vowel_u;
fs = vowels.fs;
A = fftshift(fft(a));
E = fftshift(fft(e));
I = fftshift(fft(i));
O = fftshift(fft(o));
U = fftshift(fft(u));

%% A 
close all;
name = "a_fft";
w = 2*pi*([0:1:length(A)-1] - length(A)/2)/length(A);
figure
	subplot(2,1,1)
		plot(w, db(A),"color",Colors(1,:),"linewidth",1)
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud dB")
		title("Espectro para vocal a, utilizando todas las muestras")
		grid on 
		xlim([0,pi])		
	subplot(2,1,2)
		A_p = fftshift(fft(a(5000:10000)));
		w = 2*pi*([0:1:length(A_p)-1] - length(A_p)/2)/length(A_p);
		plot(w, db(A_p),"color",Colors(2,:),"linewidth",1)
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud dB")
		title("Espectro para vocal a, usando solo muestras relevantes")
		grid on 
		xlim([0,pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');
		
%% E 
close all;
name = "e_fft";
w = 2*pi*([0:1:length(E)-1] - length(E)/2)/length(E);
figure
	subplot(2,1,1)
		plot(w, db(E),"color",Colors(1,:),"linewidth",1)
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud dB")
		title("Espectro para vocal e, utilizando todas las muestras")
		grid on 
		xlim([0,pi])		
	subplot(2,1,2)
		E_p = fftshift(fft(e(5000:10000)));
		w = 2*pi*([0:1:length(E_p)-1] - length(E_p)/2)/length(E_p);
		plot(w, db(E_p),"color",Colors(2,:),"linewidth",1)
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud dB")
		title("Espectro para vocal e, usando solo muestras relevantes")
		grid on 
		xlim([0,pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% I 
close all;
name = "i_fft";
w = 2*pi*([0:1:length(I)-1] - length(I)/2)/length(I);
figure
	subplot(2,1,1)
		plot(w, db(I),"color",Colors(1,:),"linewidth",1)
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud dB")
		title("Espectro para vocal i, utilizando todas las muestras")
		grid on 
		xlim([0,pi])		
	subplot(2,1,2)
		I_p = fftshift(fft(i(5000:10000)));
		w = 2*pi*([0:1:length(I_p)-1] - length(I_p)/2)/length(I_p);
		plot(w, db(I_p),"color",Colors(2,:),"linewidth",1)
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud dB")
		title("Espectro para vocal i, usando solo muestras relevantes")
		grid on 
		xlim([0,pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% O 
close all;
name = "o_fft";
w = 2*pi*([0:1:length(O)-1] - length(O)/2)/length(O);
figure
	subplot(2,1,1)
		plot(w, db(O),"color",Colors(1,:),"linewidth",1)
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud dB")
		title("Espectro para vocal o, utilizando todas las muestras")
		grid on 
		xlim([0,pi])		
	subplot(2,1,2)
		O_p = fftshift(fft(o(5000:10000)));
		w = 2*pi*([0:1:length(O_p)-1] - length(O_p)/2)/length(O_p);
		plot(w, db(O_p),"color",Colors(2,:),"linewidth",1)
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud dB")
		title("Espectro para vocal o, usando solo muestras relevantes")
		grid on 
		xlim([0,pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% U 
close all;
name = "u_fft";
w = 2*pi*([0:1:length(U)-1] - length(U)/2)/length(U);
figure
	subplot(2,1,1)
		plot(w, db(U),"color",Colors(1,:),"linewidth",1)
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud dB")
		title("Espectro para vocal u, utilizando todas las muestras")
		grid on 
		xlim([0,pi])	
	subplot(2,1,2)
		U_p = fftshift(fft(u(5000:10000)));
		w = 2*pi*([0:1:length(U_p)-1] - length(U_p)/2)/length(U_p);
		plot(w, db(U_p),"color",Colors(2,:),"linewidth",1)
		xlabel("Frecuencia normalizada")
		ylabel("Magnitud dB")
		title("Espectro para vocal u, usando solo muestras relevantes")
		grid on 
		xlim([0,pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% Ident.Vocales - B
clc, clear, close all;
plotPath="../plots/";
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
vowels = load("../rsrc/vowels.mat");
a = vowels.vowel_a;
e = vowels.vowel_e;
i = vowels.vowel_i;
o = vowels.vowel_o;
u = vowels.vowel_u;
fs = vowels.fs;
A = fftshift(fft(a(5000:10000)));
E = fftshift(fft(e(5000:10000)));
I = fftshift(fft(i(5000:10000)));
O = fftshift(fft(o(5000:10000)));
U = fftshift(fft(u(5000:10000)));
name = "vocalic_triang";
figure
	labels = ["A","E","I","O","U"];
	scatter(1239, 796,"filled", "red")
	hold on
	scatter(2037,444,"filled", "blue")
	scatter(2468,175,"filled","green")
	scatter(886,444,"filled","magenta")
	scatter(719,267,"filled","cyan")
	grid on
	axis tight
	title("Triangulo vocalico")
	xlabel("F2 Hz")
	ylabel("F1 Hz")
	legend(labels,"location","southeast")
    set ( gca, 'ydir', 'reverse' )
	set ( gca, 'xdir', 'reverse' )
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');
%% Ident.Vocales - C
clc, clear, close all;
plotPath="../plots/";
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
vowels = load("../rsrc/vowels.mat");
a = vowels.vowel_a;
e = vowels.vowel_e;
i = vowels.vowel_i;
o = vowels.vowel_o;
u = vowels.vowel_u;
fs = vowels.fs;
A = fftshift(fft(a(5000:10000)));
E = fftshift(fft(e(5000:10000)));
I = fftshift(fft(i(5000:10000)));
O = fftshift(fft(o(5000:10000)));
U = fftshift(fft(u(5000:10000)));


y_a = lpc(a,15);
y_e = lpc(e,15);
y_i = lpc(i,15);
y_o = lpc(o,15);
y_u = lpc(u,15);


%% A 
close all;
[h,w] = freqz(1,y_a);
w_a = 2*pi*([0:1:length(A)-1] - length(A)/2)/length(A);
name = "A_lpc";
figure
	plot(w_a,db(A),"color",Colors(1,:))
	hold on
	plot(w,db(h),"color",Colors(2,:),"linewidth",1.15)
	xlim([0,pi])
	grid on
	xlabel("Frecuencia normalizada");
	ylabel("Magnitud dB")
	title("Comparacion magnitud espectro vocal A y filtro LPC")
	legend(["Espectro original","Respuesta filtro"]);
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% E 
close all;
[h,w] = freqz(1,y_e);
w_e = 2*pi*([0:1:length(E)-1] - length(E)/2)/length(E);
name = "E_lpc";
figure
	plot(w_e,db(E),"color",Colors(1,:))
	hold on
	plot(w,db(h),"color",Colors(2,:),"linewidth",1.15)
	xlim([0,pi])
	grid on
	xlabel("Frecuencia normalizada");
	ylabel("Magnitud dB")
	title("Comparacion magnitud espectro vocal E y filtro LPC")
	legend(["Espectro original","Respuesta filtro"]);
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% I
close all;
[h,w] = freqz(1,y_i);
w_i = 2*pi*([0:1:length(I)-1] - length(I)/2)/length(I);
name = "I_lpc";
figure
	plot(w_i,db(I),"color",Colors(1,:))
	hold on
	plot(w,db(h),"color",Colors(2,:),"linewidth",1.15)
	xlim([0,pi])
	grid on
	xlabel("Frecuencia normalizada");
	ylabel("Magnitud dB")
	title("Comparacion magnitud espectro vocal I y filtro LPC")
	legend(["Espectro original","Respuesta filtro"]);
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% O
close all;
[h,w] = freqz(1,y_o);
w_o = 2*pi*([0:1:length(O)-1] - length(O)/2)/length(O);
name = "O_lpc";
figure
	plot(w_o,db(O),"color",Colors(1,:))
	hold on
	plot(w,db(h),"color",Colors(2,:),"linewidth",1.15)
	xlim([0,pi])
	grid on
	xlabel("Frecuencia normalizada");
	ylabel("Magnitud dB")
	title("Comparacion magnitud espectro vocal O y filtro LPC")
	legend(["Espectro original","Respuesta filtro"]);
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% U
close all;
[h,w] = freqz(1,y_u);
w_u = 2*pi*([0:1:length(U)-1] - length(U)/2)/length(U);
name = "U_lpc";
figure
	plot(w_u,db(U),"color",Colors(1,:))
	hold on
	plot(w,db(h),"color",Colors(2,:),"linewidth",1.15)
	xlim([0,pi])
	grid on
	xlabel("Frecuencia normalizada");
	ylabel("Magnitud dB")
	title("Comparacion magnitud espectro vocal U y filtro LPC")
	legend(["Espectro original","Respuesta filtro"]);
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%% Triangulo vocalico 2
clc, clear, close all;
plotPath="../plots/";
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
vowels = load("../rsrc/vowels.mat");
a = vowels.vowel_a;
e = vowels.vowel_e;
i = vowels.vowel_i;
o = vowels.vowel_o;
u = vowels.vowel_u;
fs = vowels.fs;
A = fftshift(fft(a(5000:10000)));
E = fftshift(fft(e(5000:10000)));
I = fftshift(fft(i(5000:10000)));
O = fftshift(fft(o(5000:10000)));
U = fftshift(fft(u(5000:10000)));
name = "vocalic_triang_2";
figure
	labels = ["A","E","I","O","U"];
	scatter(1273, 772,"filled", "red")
	hold on
	scatter(2050,420,"filled", "blue")
	scatter(2444,225,"filled","green")
	scatter(898,468,"filled","magenta")
	scatter(718,304,"filled","cyan")
	grid on
	axis tight
	title("Triangulo vocalico")
	xlabel("F2 Hz")
	ylabel("F1 Hz")
	legend(labels,"location","southeast")
    set ( gca, 'ydir', 'reverse' )
	set ( gca, 'xdir', 'reverse' )
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

% Comparacion
name ="vocalico_comp";
figure
	labels = ["A","E","I","O","U"];
	scatter(1273, 772,"filled", "red")
	hold on
	scatter(2050,420,"filled", "blue")
	scatter(2444,225,"filled","green")
	scatter(898,468,"filled","magenta")
	scatter(718,304,"filled","cyan")
	
	scatter(1239, 796,"filled", "black")
	scatter(2037,444,"filled", "black")
	scatter(2468,175,"filled","black")
	scatter(886,444,"filled","black")
	scatter(719,267,"filled","black")
	
	grid on
	axis tight
	title("Triangulo vocalico")
	xlabel("F2 Hz")
	ylabel("F1 Hz")
	%legend(labels,"location","southeast")
    set ( gca, 'ydir', 'reverse' )
	set ( gca, 'xdir', 'reverse' )
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');