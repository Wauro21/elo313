%% Derivada e Integrales en tiempo discreto
clc, clear, close all

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
        
        
fs = 10000; 
time = 0:1/fs:1;
test_signal = sin(2*pi*100*time);

figure("name", "probando")
    subplot(3,1,1)
        stem(time, test_signal, "color",Colors(2,:));
        xlim([0,50/1000])
        xlabel("Tiempo s")
        ylabel("Amplitud")
        title("Señal de entrada: sin(2*pi*100*t)")
    subplot(3,1,2)
        stem(time,S1(test_signal,fs),"color",Colors(3,:));
        xlim([0,50/1000])
        xlabel("Tiempo s")
        ylabel("Amplitud")
        title("Derivador: Y = S1(X)")
    subplot(3,1,3)
        stem(time,S2(test_signal,fs),"color",Colors(4,:));
        xlim([0,50/1000])
        xlabel("Tiempo s")
        ylabel("Amplitud")
        title("Integrador: Y = S2(X)")
%save
cfg.PaperPositionMode = 'auto';
print("imgs/3_b",'-dpdf','-bestfit')
%% Entrada X[n] = delta(n) - delta(n-5)
clc, clear, close all

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
fs = 100;
samples = -10:1/fs:20;
signal = double(kroneckerDelta(sym(samples))) - double(kroneckerDelta(sym(samples - 5)));
figure("name", "Entrada : Deltas de Kronecker");
    subplot(3,1,1)
        stem(samples, signal, "color", Colors(1,:))
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
        title("Señal de entrada a los sistemas")
    subplot(3,1,2)
        stem(samples, S1(signal,fs), "color", Colors(2,:))
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
        title("Derivador")
    subplot(3,1,3)
        stem(samples, S2(signal,fs), "color", Colors(3,:))
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
        title("Integrador")
%save
cfg.PaperPositionMode = 'auto';
print("imgs/3_c",'-dpdf','-bestfit')
%% Entrada X[n] = heaviside(n) - heaviside(n-5)
clc, clear, close all

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
fs = 100;
samples = -10:1/fs:20;
N = 10
signal = heaviside(samples) - heaviside(samples -(N+1));
figure("name", "Entrada : Escalones unitarios");
    subplot(3,1,1)
        stem(samples, signal, "color", Colors(1,:))
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
        title("Señal de entrada a los sistemas")
    subplot(3,1,2)
        stem(samples, S1(signal,fs), "color", Colors(2,:))
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
        title("Derivador")
    subplot(3,1,3)
        stem(samples, S2(signal,fs), "color", Colors(3,:))
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
        title("Integrador")

%save
cfg.PaperPositionMode = 'auto';
print("imgs/3_d",'-dpdf','-bestfit')

%% Archivos de audio: music.wav
[music, fs_music] = audioread("rsrc/music.wav");
soundsc(music,fs_music)
% Derivada
d_music = S1(music, fs_music);
pause(5);
soundsc(d_music,fs_music);
% Integral
i_music = S2(music,fs_music);
pause(5)
soundsc(i_music, fs_music);
%% Archivos de audio: speech.wav
[speech, fs_speech] = audioread("rsrc/speech.wav");
soundsc(speech, fs_speech);
%derivada
d_speech = S1(speech, fs_speech);
pause(5);
soundsc(d_speech, fs_speech);
%integral
i_speech = S2(speech, fs_speech);
pause(5);
soundsc(i_speech, fs_speech);

%% Prueba segunda derivada e integral
clc, clear, close all

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
        
        
fs = 10000; 
time = 0:1/fs:1;
test_signal = sin(2*pi*100*time);

figure("name", "probando")
    subplot(3,1,1)
        stem(time, test_signal, "color",Colors(2,:));
        xlim([0,50/1000])
        xlabel("Tiempo s")
        ylabel("Amplitud")
        title("Señal de entrada: sin(2*pi*100*t)")
    subplot(3,1,2)
        stem(time,S11(test_signal,fs),"color",Colors(3,:));
        xlim([0,50/1000])
        xlabel("Tiempo s")
        ylabel("Amplitud")
        title("Derivador: Y = S1(X)")
    subplot(3,1,3)
        stem(time,S2(test_signal,fs),"color",Colors(4,:));
        xlim([0,50/1000])
        xlabel("Tiempo s")
        ylabel("Amplitud")
        title("Integrador: Y = S2(X)")
%% Sistemas
% Derivada:
function y = S1(x,fs)
num = [1 -1];
den = [1 0];
y = (fs)*filter(num, den, x);
end

%Integral: 
function y =S2(x,fs)
num = [1 0];
den = [1 -1];
y = (1/fs)*filter(num, den, x);
end

%% Segunda deriva e integral
function y = S11(x,fs)
num = [1 -2 1];
den = [1 0 0];
y = (fs*fs)*filter(num, den, x);
end