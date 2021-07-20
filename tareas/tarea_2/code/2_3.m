%% a)
clc, clear, close all;
x = [0 0 1 0 1 0 0 0];
X = fft(x,8);

%% b)
k = 0:1:7;
mult = exp(j*2*k*2*pi/8);
Y = X.*mult;
y = ifft(Y,8);

%% c)
w = [1 1 1 1 1 1 0 0];
W = fft(w,8);
Y = X.*W;
y = ifft(Y,8);
y_teo = conv(x,w);