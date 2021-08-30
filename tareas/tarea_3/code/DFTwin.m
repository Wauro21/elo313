function X = DFTwin(x,L,m,N)
	signal_part = x(m:m+L-1);
	window_signal = hamming(L).*signal_part;
	X = fft(window_signal,N);
end