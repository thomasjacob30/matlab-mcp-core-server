% EXPERIMENT 4 - DFT and IDFT of a Sequence
%
% DFT  : X(k) = sum_{n=0}^{N-1} x(n) * W_N^{nk}    where W_N = e^{-j2pi/N}
% IDFT : x(n) = (1/N) * sum_{k=0}^{N-1} X(k) * e^{j2pi*nk/N}

% Copyright 2026 The MathWorks, Inc.

clc;
clear;
close all;

% Input sequence
x = [1, 2, 3, 4];
N = length(x);

fprintf('Input sequence x[n]: ');  disp(x);

% =========================================================
%  MANUAL DFT
% =========================================================
X = zeros(1, N);
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-1j * 2 * pi * k * n / N);
    end
end

fprintf('\nDFT  X(k) (magnitude):\n');
disp(abs(X));
fprintf('DFT  X(k) (phase in degrees):\n');
disp(angle(X)*180/pi);

% =========================================================
%  MANUAL IDFT
% =========================================================
x_rec = zeros(1, N);
for n = 0:N-1
    for k = 0:N-1
        x_rec(n+1) = x_rec(n+1) + X(k+1) * exp(1j * 2 * pi * k * n / N);
    end
    x_rec(n+1) = x_rec(n+1) / N;
end
x_rec = real(x_rec);   % remove negligible imaginary part

fprintf('\nIDFT reconstructed x[n]:\n');
disp(x_rec);
fprintf('Reconstruction error (max): %.2e\n', max(abs(x - x_rec)));

% Verify with MATLAB built-in
X_builtin  = fft(x);
x_builtin  = ifft(X_builtin);
fprintf('\nBuilt-in FFT   X(k) matches manual DFT: %d\n', ...
        max(abs(X - X_builtin)) < 1e-9);

% =========================================================
%  PLOTS
% =========================================================
k_ax = 0:N-1;

figure('Name','Experiment 4 - DFT and IDFT','NumberTitle','off');

subplot(2,2,1);
stem(k_ax, x, 'filled', 'LineWidth', 1.5);
title('Input Sequence x[n]');
xlabel('n'); ylabel('x[n]'); grid on;

subplot(2,2,2);
stem(k_ax, abs(X), 'filled', 'LineWidth', 1.5);
title('DFT Magnitude  |X(k)|');
xlabel('k'); ylabel('|X(k)|'); grid on;

subplot(2,2,3);
stem(k_ax, angle(X)*180/pi, 'filled', 'LineWidth', 1.5);
title('DFT Phase  \angleX(k)');
xlabel('k'); ylabel('Phase (degrees)'); grid on;

subplot(2,2,4);
stem(k_ax, x_rec, 'filled', 'LineWidth', 1.5);
title('Reconstructed x[n] via IDFT');
xlabel('n'); ylabel('x[n]'); grid on;

sgtitle('DFT and IDFT of a Sequence', 'FontWeight', 'bold', 'FontSize', 12);
