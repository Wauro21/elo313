function y = overlap_add(x, H, Lms,fs)
	L = Lms*fs; %n muestras para el frame
	M = length(H);
	N = L+M-1;
	% 
	base = 1;
	for i=1:length(x)/N
		x_temp = [x(base: base+(L-1) zeros(1,(M-1));
		X_temp = fft(x_temp);
		y_temp = ifft(X_temp.*H);
	end
end