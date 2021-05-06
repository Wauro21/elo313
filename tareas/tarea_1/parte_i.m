%% Evaluacion de Propiedades de Sistemas

% Plot colors

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
        
% Sistema #1 - Analisis de invariancia temporal
fs = 1000; % Frecuencia de muestre de la señal a generar
time = 0:1/fs:10;
figure("name","Sistema 1: Invariancia temporal")
    subplot(2,1,1)
        square_pulse = rectangularPulse(0,1,time);
        plot(time, square_pulse,"color",Colors(1,:), "linewidth", 1.15);
        ylim([-2,2]); 
        xlabel("Tiempo s")
        ylabel("Amplitud -")
        title("Entrada sistema 1");
        grid on
    subplot(2,1,2)
        plot(time, sistema1(square_pulse),"color",Colors(2,:), "linewidth", 1.15)
        xlabel("Tiempo s")
        ylabel("Amplitud -")
        title("Salida sistema 1");
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_1_invarianza_temporal_noretardo",'-dpdf','-bestfit')
figure("name","Sistema 1: Invariancia temporal");
    subplot(2,1,1)
        square_pulse_k = rectangularPulse(0,1,time-5);
        plot(time, square_pulse_k, "color",Colors(3,:), "linewidth", 1.15)
        ylim([-2,2])
        xlabel("Tiempo s")
        ylabel("Amplitud -")
        title("Entrada sistema 1: Desplazado en k = 5");
        grid on
    subplot(2,1,2)
        plot(time, sistema1(square_pulse_k), "color",Colors(4,:), "linewidth", 1.15)
        xlabel("Tiempo s")
        ylabel("Amplitud -")
        title("Salida sistema 1");
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_1_invarianza_temporal_retardo",'-dpdf','-bestfit')

%% Sistema #1 - Analisis linealidad
clc, clear, close all;
% Plot colors

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
        
fs = 1000;
time = 0:1/fs:10;
vector_size = size(time)
noise_1 = wgn(vector_size(1),vector_size(2),0);
noise_2 = wgn(vector_size(1),vector_size(2),0);
alpha = 2;
beta = 3;
u_1 = alpha*noise_1;
u_2 = alpha*noise_2;
% Senales de entrada
figure("name","Señales de entrada");
    subplot(2,1,1)
        plot(time, u_1, "color", Colors(1,:), "linewidth", 1.15);
        title("u_1: Ruido blanco escalado")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
    subplot(2,1,2)
        plot(time, u_2,"color", Colors(2,:), "linewidth", 1.15);
        title("u_2: Ruido blanco escalado")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_1_linealidad_entradas",'-dpdf','-bestfit')

composicion = sistema1(alpha*u_1 + beta*u_2);
suma_salidas = alpha*sistema1(u_1) + beta*sistema1(u_2);
figure("name", "Señales de salida")
    subplot(2,1,1)
        plot(time, composicion, "color", Colors(3,:), "linewidth", 1.15)
        title("Y: Salida de la composición de entradas")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
    subplot(2,1,2)
        plot(time, suma_salidas, "color", Colors(4,:), "linewidth", 1.15)
        title("Y1 + Y2: Suma de salidas")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_1_linealidad_salidas",'-dpdf','-bestfit')

figure("name", "Comprobacion linealidad")
    subplot(2,1,1)
        plot(time, composicion, "color", Colors(3,:), "linewidth", 1.15)
        hold on
        plot(time, suma_salidas, "color", Colors(4,:),"linewidth",1.15)
        title("Superposicion de resultado para las salidas")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
        hold off
        legend("Y", "Y1 + Y2");
    subplot(2,1,2)
        plot(time, composicion - suma_salidas, "color", Colors(5,:), "linewidth", 1.15)
        title("Diferencia entre los resultado para las salidas")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_1_linealidad_superpuestas",'-dpdf','-bestfit')

%% Sistema #1 : Estabilidad BIBO
clc, clear, close all
% Plot colors

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
        
fs = 1000;
time = 0:1/fs:10;
time_size = size(time);
kronecker_delta = [1 zeros(time_size(1), time_size(2)-1)];
figure("name", "Sistema #1 Estabilidad BIBO")
    subplot(2,1,1)
        stem(time, kronecker_delta, "color", Colors(1,:), "linewidth",1.15)
        title("Entrada del sistema: Delta de Kronecker en n = 0");
        xlabel("Tiempo s");
        ylabel("Amplitud -")
        grid on
    subplot(2,1,2)
        stem(time, sistema1(kronecker_delta), "color",Colors(2,:), "linewidth", 1.15)
        title("Salida del sistema");
        xlabel("Tiempo s");
        ylabel("Amplitud -")
        grid on
%save        
cfg.PaperPositionMode = 'auto';   
print("imgs/sistema_1_bibo_n_0",'-dpdf','-bestfit')

time = 0:1/fs:100;
time_size = size(time);
kronecker_delta = [zeros(time_size(1), (time_size(2)-1)/2) 1 zeros(time_size(1), (time_size(2)-1)/2)];
figure("name", "Sistema #1 Estabilidad BIBO")
    subplot(2,1,1)
        stem(time, kronecker_delta, "color", Colors(1,:), "linewidth",1.15)
        title("Entrada del sistema: Delta de Kronecker en n = 50");
        xlabel("Tiempo s");
        ylabel("Amplitud -")
        grid on
    subplot(2,1,2)
        stem(time, sistema1(kronecker_delta), "color",Colors(2,:), "linewidth", 1.15)
        title("Salida del sistema");
        xlabel("Tiempo s");
        ylabel("Amplitud -")
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_1_bibo_n_50",'-dpdf','-bestfit')


time = 0:1/fs:100;
step_u = heaviside(time -10);
figure("name", "Sistema #1 Estabilidad BIBO");
    subplot(2,1,1)
        stem(time, step_u, "color", Colors(3,:), "linewidth", 1.14)
        title("Entrada del sistema: Escalón unitario en t = 10");
        xlabel("Tiempo s");
        ylabel("Amplitud");
        grid on
    subplot(2,1,2)
        stem(time, sistema1(step_u), "color", Colors(4,:), "linewidth",1.15)
        title("Salida del sistema");
        xlabel("Tiempo s");
        ylabel("Amplitud");
        grid on
        
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_1_bibo_step",'-dpdf','-bestfit')


%% Sistema #2 - Analisis de invarianza temporal
clc, clear, close all;
% Plot colors

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
        
fs = 1000; % Frecuencia de muestreo de la señal a generar
time = 0:1/fs:10;
figure("name","Sistema 2: Invariancia temporal")
    subplot(2,1,1)
        square_pulse = rectangularPulse(0,1,time);
        plot(time, square_pulse,"color",Colors(1,:), "linewidth", 1.15);
        ylim([-2,2]); 
        xlabel("Tiempo s")
        ylabel("Amplitud -")
        title("Entrada sistema 2");
        grid on
    subplot(2,1,2)
        plot(time, sistema2(square_pulse),"color",Colors(2,:), "linewidth", 1.15)
        xlabel("Tiempo s")
        ylabel("Amplitud -")
        ylim([-1,3])
        title("Salida sistema 2");
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_2_invarianza_temporal_noretardo",'-dpdf','-bestfit')
figure("name","Sistema 2: Invariancia temporal");
    subplot(2,1,1)
        square_pulse_k = rectangularPulse(0,1,time-5);
        plot(time, square_pulse_k,"color",Colors(3,:), "linewidth", 1.15); 
        ylim([-2,2])
        xlabel("Tiempo s")
        ylabel("Amplitud -")
        title("Entrada sistema 2: Desplazado en k = 5");
        grid on
    subplot(2,1,2)
        plot(time, sistema2(square_pulse_k),"color",Colors(4,:), "linewidth", 1.15);
        xlabel("Tiempo s")
        ylabel("Amplitud -")
        ylim([-1,3])
        title("Salida sistema 2");
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_2_invarianza_temporal_retardo",'-dpdf','-bestfit')

%% Sistema #2 - Analisis linealidad
clc, clear, close all;
% Plot colors

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
        
fs = 1000;
time = 0:1/fs:10;
vector_size = size(time)
noise_1 = wgn(vector_size(1),vector_size(2),0);
noise_2 = wgn(vector_size(1),vector_size(2),0);
alpha = 2;
beta = 3;
u_1 = alpha*noise_1;
u_2 = alpha*noise_2;
% Senales de entrada
figure("name","Señales de entrada");
    subplot(2,1,1)
        plot(time, u_1, "color", Colors(1,:), "linewidth", 1.15);
        title("u_1: Ruido blanco escalado")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
    subplot(2,1,2)
        plot(time, u_2,"color", Colors(2,:), "linewidth", 1.15);
        title("u_2: Ruido blanco escalado")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_2_linealidad_entradas",'-dpdf','-bestfit')

composicion = sistema2(alpha*u_1 + beta*u_2);
suma_salidas = alpha*sistema2(u_1) + beta*sistema2(u_2);
figure("name", "Señales de salida")
    subplot(2,1,1)
        plot(time, composicion, "color", Colors(3,:), "linewidth", 1.15)
        title("Y: Salida de la composición de entradas")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
    subplot(2,1,2)
        plot(time, suma_salidas, "color", Colors(4,:), "linewidth", 1.15)
        title("Y1 + Y2: Suma de salidas")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_2_linealidad_salidas",'-dpdf','-bestfit')

figure("name", "Comprobacion linealidad")
    subplot(2,1,1)
        plot(time, composicion, "color", Colors(3,:), "linewidth", 1.15)
        hold on
        plot(time, suma_salidas, "color", Colors(4,:),"linewidth",1.15)
        title("Superposicion de resultado para las salidas")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
        hold off
        legend("Y", "Y1 + Y2");
    subplot(2,1,2)
        plot(time, composicion - suma_salidas, "color", Colors(5,:), "linewidth", 1.15)
        title("Diferencia entre los resultado para las salidas")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_2_linealidad_superpuestas",'-dpdf','-bestfit')

%% Sistema #2 : Estabilidad BIBO
clc, clear, close all
% Plot colors

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
        
fs = 1000;
time = 0:1/fs:10;
time_size = size(time);
kronecker_delta = [1 zeros(time_size(1), time_size(2)-1)];
figure("name", "Sistema #2 Estabilidad BIBO")
    subplot(2,1,1)
        stem(time, kronecker_delta, "color", Colors(1,:), "linewidth",1.15)
        title("Entrada del sistema: Delta de Kronecker en n = 0");
        xlabel("Tiempo s");
        ylabel("Amplitud -")
        grid on
    subplot(2,1,2)
        stem(time, sistema2(kronecker_delta), "color",Colors(2,:), "linewidth", 1.15)
        title("Salida del sistema");
        xlabel("Tiempo s");
        ylabel("Amplitud -")
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_2_bibo_n_0",'-dpdf','-bestfit')

figure("name", "Sistema #2 Estabilidad BIBO")
    subplot(2,1,1)
        stem(time, heaviside(time-5), "color", Colors(1,:), "linewidth", 1.15)
        title("Entrada del sistema: Escalón unitario en n = 5")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
    subplot(2,1,2)
        stem(time,sistema2(heaviside(time-5)), "color", Colors(2,:), "linewidth", 1.15);
        title("Salida del sistema");
        xlabel("Tiempo s");
        ylabel("Amplitud -")
        ylim([-1,3])
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_2_bibo_heaviside_n_5",'-dpdf','-bestfit')

figure("name", "Sistema #2 Estabilidad BIBO")
    subplot(2,1,1)
        stem(time, sawtooth(2*pi*time), "color", Colors(1,:), "linewidth", 1.15)
        title("Entrada del sistema: Escalón unitario en n = 5")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
    subplot(2,1,2)
        stem(time,sistema2(sawtooth(2*pi*time)), "color", Colors(2,:), "linewidth", 1.15);
        title("Salida del sistema");
        xlabel("Tiempo s");
        ylabel("Amplitud -")
        ylim([-1,3])
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_2_bibo_sawtooth",'-dpdf','-bestfit')

%% Sistema #3 - Analisis de invarianza temporal
clc, clear, close all;
% Plot colors

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
        
fs = 1000; % Frecuencia de muestreo de la señal a generar
time = 0:1/fs:10;
figure("name","Sistema 3: Invariancia temporal")
    subplot(2,1,1)
        square_pulse = rectangularPulse(0,1,time);
        plot(time, square_pulse,"color",Colors(1,:), "linewidth", 1.15);
        ylim([-2,2]); 
        xlabel("Tiempo s")
        ylabel("Amplitud -")
        title("Entrada sistema 3");
        grid on
    subplot(2,1,2)
        plot(time, sistema3(square_pulse),"color",Colors(2,:), "linewidth", 1.15)
        xlabel("Tiempo s")
        ylabel("Amplitud -")
        ylim([-1,3])
        title("Salida sistema 3");
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_3_invarianza_temporal_noretardo",'-dpdf','-bestfit')
figure("name","Sistema 3: Invariancia temporal");
    subplot(2,1,1)
        square_pulse_k = rectangularPulse(0,1,time-5);
        plot(time, square_pulse_k)
        ylim([-2,2])
        xlabel("Tiempo s")
        ylabel("Amplitud -")
        title("Entrada sistema 3: Desplazado en k = 5");
        grid on
    subplot(2,1,2)
        plot(time, sistema3(square_pulse_k))
        xlabel("Tiempo s")
        ylabel("Amplitud -")
        ylim([-1,3])
        title("Salida sistema 3");
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_3_invarianza_temporal_retardo",'-dpdf','-bestfit')
%% Sistema #3 - Analisis linealidad
clc, clear, close all;
% Plot colors

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
        
fs = 1000;
time = 0:1/fs:10;
vector_size = size(time)
noise_1 = wgn(vector_size(1),vector_size(2),0);
noise_2 = wgn(vector_size(1),vector_size(2),0);
alpha = 2;
beta = 3;
u_1 = alpha*noise_1;
u_2 = alpha*noise_2;
% Senales de entrada
figure("name","Señales de entrada");
    subplot(2,1,1)
        plot(time, u_1, "color", Colors(1,:), "linewidth", 1.15);
        title("u_1: Ruido blanco escalado")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
    subplot(2,1,2)
        plot(time, u_2,"color", Colors(2,:), "linewidth", 1.15);
        title("u_2: Ruido blanco escalado")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_3_linealidad_entradas",'-dpdf','-bestfit')

composicion = sistema3(alpha*u_1 + beta*u_2);
suma_salidas = alpha*sistema3(u_1) + beta*sistema3(u_2);
figure("name", "Señales de salida")
    subplot(2,1,1)
        plot(time, composicion, "color", Colors(3,:), "linewidth", 1.15)
        title("Y: Salida de la composición de entradas")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
    subplot(2,1,2)
        plot(time, suma_salidas, "color", Colors(4,:), "linewidth", 1.15)
        title("Y1 + Y2: Suma de salidas")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_3_linealidad_salidas",'-dpdf','-bestfit')

figure("name", "Comprobacion linealidad")
    subplot(2,1,1)
        plot(time, composicion, "color", Colors(3,:), "linewidth", 1.15)
        hold on
        plot(time, suma_salidas, "color", Colors(4,:),"linewidth",1.15)
        title("Superposicion de resultado para las salidas")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
        hold off
        legend("Y", "Y1 + Y2");
    subplot(2,1,2)
        plot(time, composicion - suma_salidas, "color", Colors(5,:), "linewidth", 1.15)
        title("Diferencia entre los resultado para las salidas")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_3_linealidad_superpuestas",'-dpdf','-bestfit')


%% Sistema #3 : Estabilidad BIBO
clc, clear, close all
% Plot colors

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
        
fs = 1000;
time = 0:1/fs:10;
time_size = size(time);
kronecker_delta = [1 zeros(time_size(1), time_size(2)-1)];
figure("name", "Sistema #3 Estabilidad BIBO")
    subplot(2,1,1)
        stem(time, kronecker_delta, "color", Colors(1,:), "linewidth",1.15)
        title("Entrada del sistema: Delta de Kronecker en n = 0");
        xlabel("Tiempo s");
        ylabel("Amplitud -")
        grid on
    subplot(2,1,2)
        stem(time, sistema3(kronecker_delta), "color",Colors(2,:), "linewidth", 1.15)
        title("Salida del sistema");
        xlabel("Tiempo s");
        ylabel("Amplitud -")
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_3_bibo_n_0",'-dpdf','-bestfit')

time = 0:1/fs:100;
time_size = size(time);
kronecker_delta = [zeros(time_size(1), (time_size(2)-1)/2) 1 zeros(time_size(1), (time_size(2)-1)/2)];
figure("name", "Sistema #1 Estabilidad BIBO")
    subplot(2,1,1)
        stem(time, kronecker_delta, "color", Colors(1,:), "linewidth",1.15)
        title("Entrada del sistema: Delta de Kronecker en n = 50");
        xlabel("Tiempo s");
        ylabel("Amplitud -")
        grid on
    subplot(2,1,2)
        stem(time, sistema3(kronecker_delta), "color",Colors(2,:), "linewidth", 1.15)
        title("Salida del sistema");
        xlabel("Tiempo s");
        ylabel("Amplitud -")
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_3_bibo_n_50",'-dpdf','-bestfit')

figure("name", "Sistema #3 Estabilidad BIBO")
    subplot(2,1,1)
        stem(time, heaviside(time-5), "color", Colors(1,:), "linewidth", 1.15)
        title("Entrada del sistema: Escalón unitario en n = 5")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
    subplot(2,1,2)
        stem(time,sistema3(heaviside(time-5)), "color", Colors(2,:), "linewidth", 1.15);
        title("Salida del sistema");
        xlabel("Tiempo s");
        ylabel("Amplitud -")
        ylim([-1,3])
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_3_bibo_heaviside_n_5",'-dpdf','-bestfit')

figure("name", "Sistema #2 Estabilidad BIBO")
    subplot(2,1,1)
        stem(time, sawtooth(2*pi*time), "color", Colors(1,:), "linewidth", 1.15)
        title("Entrada del sistema: Escalón unitario en n = 5")
        xlabel("Tiempo s")
        ylabel("Amplitud")
        grid on
    subplot(2,1,2)
        stem(time,sistema3(sawtooth(2*pi*time)), "color", Colors(2,:), "linewidth", 1.15);
        title("Salida del sistema");
        xlabel("Tiempo s");
        ylabel("Amplitud -")
        ylim([-1,3])
        grid on
%save        
cfg.PaperPositionMode = 'auto';
print("imgs/sistema_3_bibo_sawtooth",'-dpdf','-bestfit')
