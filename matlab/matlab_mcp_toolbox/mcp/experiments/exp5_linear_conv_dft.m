% EXPERIMENT 5 - Linear Convolution using DFT (FFT/IFFT)
%
% Method:  Y(k) = FFT{x[n]} * FFT{h[n]}
%          y[n] = IFFT{Y(k)}
% Verified against MATLAB built-in conv()

% Copyright 2026 The MathWorks, Inc.

clc;
clear;
close all;

% Input sequences
x = [1, 2, 3, 4];
h = [1, 1, 1];

fprintf('Input x[n]: ');  disp(x);
fprintf('Input h[n]: ');  disp(h);

% =========================================================
%  LINEAR CONVOLUTION USING FFT / IFFT
% =========================================================
L = length(x) + length(h) - 1;    % required output length

X = fft(x, L);    % zero-pad both to length L before FFT
H = fft(h, L);
Y = X .* H;       % multiply in frequency domain
y_fft = real(ifft(Y));

% =========================================================
%  VERIFICATION USING conv()
% =========================================================
y_conv = conv(x, h);

fprintf('\nLinear Convolution using FFT/IFFT:\n');
disp(y_fft);
fprintf('Verification using conv():\n');
disp(y_conv);
fprintf('Results match: %d\n', max(abs(y_fft - y_conv)) < 1e-9);

% =========================================================
%  PLOTS
% =========================================================
figure('Name','Experiment 5 - Linear Convolution using DFT','NumberTitle','off');

subplot(3,1,1);
stem(0:length(x)-1, x, 'filled', 'LineWidth', 1.5);
title('Input Sequence x[n]');
xlabel('n'); ylabel('x[n]'); grid on;

subplot(3,1,2);
stem(0:length(h)-1, h, 'filled', 'LineWidth', 1.5);
title('Impulse Response h[n]');
xlabel('n'); ylabel('h[n]'); grid on;

subplot(3,1,3);
stem(0:L-1, y_fft, 'filled', 'LineWidth', 1.5);
hold on;
stem(0:L-1, y_conv, 'rx', 'LineWidth', 1.5);
hold off;
legend('FFT/IFFT method', 'conv() verification');
title('Linear Convolution y[n] = x[n] * h[n]');
xlabel('n'); ylabel('y[n]'); grid on;

sgtitle('Linear Convolution using DFT (FFT/IFFT)', 'FontWeight', 'bold', 'FontSize', 12);
