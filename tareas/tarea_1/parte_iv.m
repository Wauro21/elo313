%% Radar
clc, clear, close all

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
n = 0:1:199;
a = 0.9;
D = 20;
x = [1,1,1,-1,-1,-1,1,-1,-1,1,-1]; %Barker
padding = zeros(1,200 - length(x));
x = [x, padding];
ruido = randn(1,200).*sqrt(0.05);
y = zeros(1,200);

for i=n+1
    if i <= D
        y(i) = ruido(i);
    else
        y(i) = a*x(i-D) + ruido(i);
    end
end

figure()
    subplot(2,1,1)
        stem(n, x, "color", Colors(1,:));
        xlabel("muestras")
        ylabel("Amplitud")
        title("x[n]: secuencia de Barker")
        grid on
    subplot(2,1,2)
        stem(n,y,"color",Colors(2,:))
        xlabel("muestras")
        ylabel("Amplitud")
        title("y[n]: Señal recibida")
        grid on
%save
cfg.PaperPositionMode = 'auto';
print("imgs/4_radar_b",'-dpdf','-bestfit') 

% Correlacion ryy
ryy = xcorr2(y,y);
ryx = xcorr2(y,x);
figure("name","correlaciones")
    subplot(2,1,1)
        stem(-199:1:199, ryy, "color", Colors(1,:))
        xlabel("n")
        title("Correlacion ryy")
        grid on
    subplot(2,1,2)
        stem(-199:1:199, ryx, "color", Colors(2,:))
        xlabel("n")
        title("Correlacion ryx")
        grid on
%save
cfg.PaperPositionMode = 'auto';
print("imgs/4_radar_c",'-dpdf','-bestfit') 

SNR_c = snr(y,ruido)

%% d - Sigma = 0.1
clc, clear, close all

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
n = 0:1:199;
a = 0.9;
D = 20;
x = [1,1,1,-1,-1,-1,1,-1,-1,1,-1]; %Barker
padding = zeros(1,200 - length(x));
x = [x, padding];
ruido = randn(1,200).*sqrt(0.1);
y = zeros(1,200);

for i=n+1
    if i <= D
        y(i) = ruido(i);
    else
        y(i) = a*x(i-D) + ruido(i);
    end
end

figure()
    subplot(2,1,1)
        stem(n, x, "color", Colors(1,:));
        xlabel("muestras")
        ylabel("Amplitud")
        title("x[n]: secuencia de Barker")
        grid on
    subplot(2,1,2)
        stem(n,y,"color",Colors(2,:))
        xlabel("muestras")
        ylabel("Amplitud")
        title("y[n]: Señal recibida")
        grid on
%save
cfg.PaperPositionMode = 'auto';
print("imgs/4_radar_d_0_1_signal",'-dpdf','-bestfit') 

% Correlacion ryy
ryy = xcorr2(y,y);
ryx = xcorr2(y,x);
figure("name","correlaciones")
    subplot(2,1,1)
        stem(-199:1:199, ryy, "color", Colors(1,:))
        xlabel("n")
        title("Correlacion ryy")
        grid on
    subplot(2,1,2)
        stem(-199:1:199, ryx, "color", Colors(2,:))
        xlabel("n")
        title("Correlacion ryx")
        grid on
%save
cfg.PaperPositionMode = 'auto';
print("imgs/4_radar_d_0_1_corre",'-dpdf','-bestfit') 

SNR_c = snr(y,ruido)

%% d - Sigma = 1
clc, clear, close all

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
n = 0:1:199;
a = 0.9;
D = 20;
x = [1,1,1,-1,-1,-1,1,-1,-1,1,-1]; %Barker
padding = zeros(1,200 - length(x));
x = [x, padding];
ruido = randn(1,200).*sqrt(1);
y = zeros(1,200);

for i=n+1
    if i <= D
        y(i) = ruido(i);
    else
        y(i) = a*x(i-D) + ruido(i);
    end
end

figure()
    subplot(2,1,1)
        stem(n, x, "color", Colors(1,:));
        xlabel("muestras")
        ylabel("Amplitud")
        title("x[n]: secuencia de Barker")
        grid on
    subplot(2,1,2)
        stem(n,y,"color",Colors(2,:))
        xlabel("muestras")
        ylabel("Amplitud")
        title("y[n]: Señal recibida")
        grid on
%save
cfg.PaperPositionMode = 'auto';
print("imgs/4_radar_d_1_signal",'-dpdf','-bestfit') 

% Correlacion ryy
ryy = xcorr2(y,y);
ryx = xcorr2(y,x);
figure("name","correlaciones")
    subplot(2,1,1)
        stem(-199:1:199, ryy, "color", Colors(1,:))
        xlabel("n")
        title("Correlacion ryy")
        grid on
    subplot(2,1,2)
        stem(-199:1:199, ryx, "color", Colors(2,:))
        xlabel("n")
        title("Correlacion ryx")
        grid on
%save
cfg.PaperPositionMode = 'auto';
print("imgs/4_radar_d_1_corre",'-dpdf','-bestfit') 

SNR_c = snr(y,ruido)
%% Radar : 10 periodos de barker
clc, clear, close all

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
n = 0:1:199;
a = 0.9;
D = 20;
barker = [1,1,1,-1,-1,-1,1,-1,-1,1,-1]; %Barker
x = [barker,barker,barker,barker,barker,barker,barker,barker,barker,barker];
padding = zeros(1,200 - length(x));
x = [x, padding];
ruido = randn(1,200).*sqrt(0.05);
y = zeros(1,200);

for i=n+1
    if i <= D
        y(i) = ruido(i);
    else
        y(i) = a*x(i-D) + ruido(i);
    end
end

figure()
    subplot(2,1,1)
        stem(n, x, "color", Colors(1,:));
        xlabel("muestras")
        ylabel("Amplitud")
        title("x[n]: secuencia de Barker")
        grid on
    subplot(2,1,2)
        stem(n,y,"color",Colors(2,:))
        xlabel("muestras")
        ylabel("Amplitud")
        title("y[n]: Señal recibida")
        grid on
%save
cfg.PaperPositionMode = 'auto';
print("imgs/4_radar_e_signal",'-dpdf','-bestfit') 

% Correlacion ryy
ryy = xcorr2(y,y);
ryx = xcorr2(y,x);
figure("name","correlaciones")
    subplot(2,1,1)
        stem(-199:1:199, ryy, "color", Colors(1,:))
        xlabel("n")
        title("Correlacion ryy")
        grid on
    subplot(2,1,2)
        stem(-199:1:199, ryx, "color", Colors(2,:))
        xlabel("n")
        title("Correlacion ryx")
        grid on
%save
cfg.PaperPositionMode = 'auto';
print("imgs/4_radar_e_corre",'-dpdf','-bestfit') 

SNR_c = snr(y,ruido)
