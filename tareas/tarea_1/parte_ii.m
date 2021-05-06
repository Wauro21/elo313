% Implementacion de sistemas discretos
clc, clear, close all
% Plot colors

Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
        
fs = 1000;
time = 0:1/fs:0.1; 
test_signal = double(kroneckerDelta(sym(time))); %Impulso de entrada

% Sa(deltaKronecker)
Sa_response = Sa(test_signal);
figure("name", "Sistema Sa(x), respuesta a impulso")
    stem(time, Sa_response, "color",Colors(1,:), "linewidth",1.15)
    xlim([0,0.03])
    xlabel("Tiempo s")
    ylabel("Amplitud ")
    grid on
%save


% Sb(deltaKronecker)
Sb_response = Sb(test_signal);
figure("name", "Sistema Sb(x), respuesta a impulso")
    stem(time, Sb_response, "color",Colors(2,:), "linewidth",1.15)
    xlim([0,0.03])
    xlabel("Tiempo s")
    ylabel("Amplitud ")
    grid on
%save


% Sb(Sa(deltaKronecker))
Sba_response = Sb(Sa(test_signal));
figure("name", "Sistema Sb(Sa(x)), respuesta a impulso")
    stem(time, Sba_response, "color",Colors(3,:), "linewidth",1.15)
    xlim([0,0.03])
    xlabel("Tiempo s")
    ylabel("Amplitud ")
    grid on
%save



% Sistema A
function y = Sa(x)
num = [-1];
den = [1 -0.5];
y = filter(num,den,x);
end
% Sistema B
function y = Sb(x)
num = [-1 0.5];
den = [1 0];
y = filter(num, den, x);
end