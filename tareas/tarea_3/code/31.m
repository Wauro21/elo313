%% Uso funcion DFTWin
clc, clear, close all;
plotPath="../plots/";
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
vowels = load("../rsrc/vowels.mat");
a = vowels.vowel_a;
f0 = 87;% Frecuencia obtenida de punto anterior
fs = 8000;
T = 6/f0; % Tiempo en periodos a considerar
S = ceil(fs*T); % Numero de muestras a considerar
% La señal comienza en la muestra 5000;
X = DFTwin(a,S,5000,S);
name = "a_dftwin";
w = fs*([0:1:length(X)-1] - length(X)/2)/length(X)
figure
	plot(w, db(X),"color",Colors(1,:),"linewidth",1.15)
	xlabel("Frecuencia  Hz")
	ylabel("Magnitud dB")
	title("Espectro vocal a, mediante DFTwin")
	xlim([0,4000])
	grid on
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');

%%