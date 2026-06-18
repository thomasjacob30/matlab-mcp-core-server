% EXPERIMENT 3 - Linear Convolution & Circular Convolution
%
% 1. Linear Convolution
% 2. Circular Convolution
% 3. Linear Convolution using Circular Convolution

% Copyright 2026 The MathWorks, Inc.

clc;
clear;
close all;

% Input sequences
x = [1, 2, 3, 4];
h = [1, 1, 1];

fprintf('Input x[n] : ');  disp(x);
fprintf('Input h[n] : ');  disp(h);

% =========================================================
%  1. LINEAR CONVOLUTION  (length = M + N - 1)
% =========================================================
y_linear = conv(x, h);
fprintf('\nLinear Convolution y[n]:\n');
disp(y_linear);

% =========================================================
%  2. CIRCULAR CONVOLUTION
%     Both sequences must be same length; zero-pad the shorter one
% =========================================================
N_circ = max(length(x), length(h));
x_c    = [x, zeros(1, N_circ - length(x))];
h_c    = [h, zeros(1, N_circ - length(h))];
y_circ = cconv(x_c, h_c, N_circ);
fprintf('\nCircular Convolution y[n]  (N = %d):\n', N_circ);
disp(y_circ);

% =========================================================
%  3. LINEAR CONVOLUTION USING CIRCULAR CONVOLUTION
%     Zero-pad both sequences to length L = M + N - 1
% =========================================================
L      = length(x) + length(h) - 1;
x_pad  = [x, zeros(1, L - length(x))];
h_pad  = [h, zeros(1, L - length(h))];
y_lcc  = cconv(x_pad, h_pad, L);
fprintf('\nLinear via Circular Convolution y[n]  (L = %d):\n', L);
disp(y_lcc);

fprintf('\nVerification: Linear conv == Linear via Circular conv: %d\n', ...
        max(abs(y_linear - y_lcc)) < 1e-9);

% =========================================================
%  PLOTS
% =========================================================
figure('Name','Experiment 3 - Convolution','NumberTitle','off');

subplot(3,2,1);
stem(0:length(x)-1, x, 'filled', 'LineWidth', 1.5);
title('Input x[n]'); xlabel('n'); ylabel('x[n]'); grid on;

subplot(3,2,2);
stem(0:length(h)-1, h, 'filled', 'LineWidth', 1.5);
title('Impulse Response h[n]'); xlabel('n'); ylabel('h[n]'); grid on;

subplot(3,2,3);
stem(0:length(y_linear)-1, y_linear, 'filled', 'LineWidth', 1.5);
title('1. Linear Convolution  y[n] = x[n] * h[n]');
xlabel('n'); ylabel('y[n]'); grid on;

subplot(3,2,4);
stem(0:N_circ-1, y_circ, 'filled', 'LineWidth', 1.5);
title(sprintf('2. Circular Convolution  (N=%d)', N_circ));
xlabel('n'); ylabel('y[n]'); grid on;

subplot(3,2,5);
stem(0:L-1, y_lcc, 'filled', 'LineWidth', 1.5);
title(sprintf('3. Linear via Circular  (L=%d)', L));
xlabel('n'); ylabel('y[n]'); grid on;

sgtitle('Linear and Circular Convolution', 'FontWeight', 'bold', 'FontSize', 12);
