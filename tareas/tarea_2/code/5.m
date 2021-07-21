%% 5
clc, clear, close all;
rsrc_path = "../rsrc/";
[x,fs] = audioread(rsrc_path+"music.wav");
h = zeros(1,16);
for i=1:1:16
	h(i) = (-1)^(i-1);
end