clc, clear, close all;
Colors = [  hex2dec('fd') hex2dec('3c') hex2dec('3c');
            hex2dec('06') hex2dec('12') hex2dec('83');
            hex2dec('ff') hex2dec('b7') hex2dec('4c');
            hex2dec('13') hex2dec('8d') hex2dec('90');
            hex2dec('00') hex2dec('00') hex2dec('00')]/255;
plotPath = "../plot_out/";

% Magnitud y fase respuesta del sistema

L = 8;
n = 0:1:L+1;
omega = 2*pi*(0:1/1000:1);
H_w = exp(-j*omega*L/2).*(1/(L+1)).*(sin(omega*(L+1)/2))./sin(omega/2);

name= "2_1"
figure
	subplot(2,1,1)
		plot(omega, abs(H_w), "color", Colors(1,:), "linewidth", 1.15);
		grid on
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter", "latex")
		ylabel("Magnitud -")
		title("Magnitud respuesta en frecuencia H(\omega)")
		xlim([0, 2*pi])
	subplot(2,1,2)
		plot(omega, unwrap(angle(H_w)), "color", Colors(2,:), "linewidth", 1.15);
		grid on
		xlabel("Frecuencia normalizada \textit{rad/s}","Interpreter", "latex")
		ylabel("Fase \textit{rad}","Interpreter", "latex")
		title("Fase respuesta en frecuencia H(\omega)")
		xlim([0, 2*pi])
cfg.PaperPositionMode = 'auto';
print(plotPath+name,'-dpdf','-bestfit');
