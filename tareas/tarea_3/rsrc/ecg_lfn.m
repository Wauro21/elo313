
% MATLAB PROGRAM ecg_lfn.m
clear all               % clears all active variables
close all

ecg = load('ecg_lfn.dat');
fs = 1000; %sampling rate = 1000 Hz

slen = length(ecg);
t=[1:slen]/fs;
figure
plot(t, ecg)
axis tight;
xlabel('Time in seconds');
ylabel('ECG');
grid on

figure
X = fftshift(fft(ecg));
w = ([0:1:length(ecg)-1] - length(ecg)/2)/length(ecg);
plot(2*pi*w, db(X))
xlim([-pi,pi])
grid on
