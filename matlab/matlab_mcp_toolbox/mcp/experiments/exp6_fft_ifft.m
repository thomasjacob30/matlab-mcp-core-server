% EXPERIMENT 6 - FFT and IFFT of a Given Input Sequence

% Copyright 2026 The MathWorks, Inc.

clc;
clear;
close all;

% Input sequence
x = [1, 2, 3, 4, 5, 6, 7, 8];
N = length(x);

fprintf('Input sequence x[n]: ');  disp(x);

% =========================================================
%  FFT
% =========================================================
X = fft(x);

fprintf('\nFFT  X(k):\n');
disp(X);
fprintf('Magnitude |X(k)|:\n');
disp(abs(X));
fprintf('Phase (degrees):\n');
disp(angle(X)*180/pi);

% =========================================================
%  IFFT
% =========================================================
x_rec = real(ifft(X));

fprintf('\nIFFT reconstructed x[n]:\n');
disp(x_rec);
fprintf('Reconstruction error (max): %.2e\n', max(abs(x - x_rec)));

% =========================================================
%  PLOTS
% =========================================================
k_ax = 0:N-1;

figure('Name','Experiment 6 - FFT and IFFT','NumberTitle','off');

subplot(2,2,1);
stem(k_ax, x, 'filled', 'LineWidth', 1.5);
title('Input Sequence x[n]');
xlabel('n'); ylabel('x[n]'); grid on;

subplot(2,2,2);
stem(k_ax, abs(X), 'filled', 'LineWidth', 1.5);
title('FFT Magnitude  |X(k)|');
xlabel('k'); ylabel('|X(k)|'); grid on;

subplot(2,2,3);
stem(k_ax, angle(X)*180/pi, 'filled', 'LineWidth', 1.5);
title('FFT Phase  \angleX(k)');
xlabel('k'); ylabel('Phase (degrees)'); grid on;

subplot(2,2,4);
stem(k_ax, x_rec, 'filled', 'LineWidth', 1.5);
title('IFFT Reconstructed x[n]');
xlabel('n'); ylabel('x[n]'); grid on;

sgtitle('FFT and IFFT of Input Sequence', 'FontWeight', 'bold', 'FontSize', 12);
