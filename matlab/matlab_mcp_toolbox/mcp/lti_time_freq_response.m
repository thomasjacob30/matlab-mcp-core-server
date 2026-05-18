% LTI System Time and Frequency Response
% Systems:
%   1a) y(n) = x(n) - x(n-1)
%   1b) y(n) = 0.2x(n) + 0.2x(n-1) + 0.6y(n-1)
%   2a) y(n) = 0.5x(n) + 0.9x(n-2) - 0.4y(n-2)

% Copyright 2026 The MathWorks, Inc.

clc;
clear;
close all;

N    = 50;    % number of samples for time-domain responses
Nfft = 512;   % FFT points for frequency response

% Unit impulse and unit step inputs
impulse_in = [1 zeros(1, N-1)];
step_in    = ones(1, N);
n          = 0:N-1;

% =========================================================
%  SYSTEM COEFFICIENTS  [b = numerator, a = denominator]
% =========================================================

% 1a) y(n) = x(n) - x(n-1)
%     H(z) = 1 - z^-1
b1a = [1, -1];
a1a = [1];

% 1b) y(n) = 0.2x(n) + 0.2x(n-1) + 0.6y(n-1)
%     H(z) = (0.2 + 0.2z^-1) / (1 - 0.6z^-1)
b1b = [0.2, 0.2];
a1b = [1, -0.6];

% 2a) y(n) = 0.5x(n) + 0.9x(n-2) - 0.4y(n-2)
%     H(z) = (0.5 + 0.9z^-2) / (1 + 0.4z^-2)
b2a = [0.5, 0, 0.9];
a2a = [1,   0, 0.4];

% =========================================================
%  FIGURE 1 : System 1a
% =========================================================
figure('Name', 'System 1a', 'NumberTitle', 'off');

h1a   = filter(b1a, a1a, impulse_in);
y1a   = filter(b1a, a1a, step_in);
[H1a, w1a] = freqz(b1a, a1a, Nfft);

subplot(2, 2, 1);
stem(n, h1a, 'filled', 'LineWidth', 1.5);
title('Impulse Response  h[n]');
xlabel('n'); ylabel('h[n]'); grid on;

subplot(2, 2, 2);
stem(n, y1a, 'filled', 'LineWidth', 1.5);
title('Step Response');
xlabel('n'); ylabel('y[n]'); grid on;

subplot(2, 2, 3);
plot(w1a/pi, 20*log10(abs(H1a) + eps), 'LineWidth', 1.5);
title('Magnitude Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)'); grid on;

subplot(2, 2, 4);
plot(w1a/pi, angle(H1a)*180/pi, 'LineWidth', 1.5);
title('Phase Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (degrees)'); grid on;

sgtitle('System 1a :  y(n) = x(n) - x(n-1)', 'FontWeight', 'bold');

% =========================================================
%  FIGURE 2 : System 1b
% =========================================================
figure('Name', 'System 1b', 'NumberTitle', 'off');

h1b   = filter(b1b, a1b, impulse_in);
y1b   = filter(b1b, a1b, step_in);
[H1b, w1b] = freqz(b1b, a1b, Nfft);

subplot(2, 2, 1);
stem(n, h1b, 'filled', 'LineWidth', 1.5);
title('Impulse Response  h[n]');
xlabel('n'); ylabel('h[n]'); grid on;

subplot(2, 2, 2);
stem(n, y1b, 'filled', 'LineWidth', 1.5);
title('Step Response');
xlabel('n'); ylabel('y[n]'); grid on;

subplot(2, 2, 3);
plot(w1b/pi, 20*log10(abs(H1b) + eps), 'LineWidth', 1.5);
title('Magnitude Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)'); grid on;

subplot(2, 2, 4);
plot(w1b/pi, angle(H1b)*180/pi, 'LineWidth', 1.5);
title('Phase Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (degrees)'); grid on;

sgtitle('System 1b :  y(n) = 0.2x(n) + 0.2x(n-1) + 0.6y(n-1)', 'FontWeight', 'bold');

% =========================================================
%  FIGURE 3 : System 2a
% =========================================================
figure('Name', 'System 2a', 'NumberTitle', 'off');

h2a   = filter(b2a, a2a, impulse_in);
y2a   = filter(b2a, a2a, step_in);
[H2a, w2a] = freqz(b2a, a2a, Nfft);

subplot(2, 2, 1);
stem(n, h2a, 'filled', 'LineWidth', 1.5);
title('Impulse Response  h[n]');
xlabel('n'); ylabel('h[n]'); grid on;

subplot(2, 2, 2);
stem(n, y2a, 'filled', 'LineWidth', 1.5);
title('Step Response');
xlabel('n'); ylabel('y[n]'); grid on;

subplot(2, 2, 3);
plot(w2a/pi, 20*log10(abs(H2a) + eps), 'LineWidth', 1.5);
title('Magnitude Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)'); grid on;

subplot(2, 2, 4);
plot(w2a/pi, angle(H2a)*180/pi, 'LineWidth', 1.5);
title('Phase Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (degrees)'); grid on;

sgtitle('System 2a :  y(n) = 0.5x(n) + 0.9x(n-2) - 0.4y(n-2)', 'FontWeight', 'bold');
