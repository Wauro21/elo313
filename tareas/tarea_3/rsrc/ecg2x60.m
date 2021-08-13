
% MATLAB PROGRAM ecg2x60.m
clear all               % clears all active variables
close all

% the ECG signal in the file is sampled at 200 Hz
ecg = load('ecg2x60.dat');
fs = 200; %sampling rate
slen = length(ecg);
t=[1:slen]/fs;
figure
plot(t, ecg)
xlabel('Time in seconds');
ylabel('ECG');
axis tight;


X = fftshift(fft(ecg));
w = ([0:1:length(ecg)-1] - length(ecg)/2)/length(ecg);
plot(2*pi*w, db(X))
xlim([-pi,pi])