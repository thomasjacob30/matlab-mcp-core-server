% EXPERIMENT 2 - Time and Frequency Response of LTI Systems
%
% First Order:
%   1a) y(n) = x(n) - x(n-1)
%   1b) y(n) = 0.2x(n) + 0.2x(n-1) + 0.6y(n-1)
%
% Second Order:
%   2a) y(n) = 0.5x(n) + x(n-1) + 0.5x(n-2)
%   2b) y(n) = x(n) + 0.9x(n-2) - 0.4y(n-2)

% Copyright 2026 The MathWorks, Inc.

clc;
clear;
close all;

N    = 50;
Nfft = 512;
n    = 0:N-1;

imp = [1 zeros(1,N-1)];   % unit impulse
stp = ones(1,N);           % unit step

% =========================================================
%  SYSTEM COEFFICIENTS   b = numerator,  a = denominator
% =========================================================
% 1a) y(n) = x(n) - x(n-1)
b1a = [1, -1];        a1a = [1];

% 1b) y(n) = 0.2x(n) + 0.2x(n-1) + 0.6y(n-1)
b1b = [0.2, 0.2];     a1b = [1, -0.6];

% 2a) y(n) = 0.5x(n) + x(n-1) + 0.5x(n-2)
b2a = [0.5, 1, 0.5];  a2a = [1];

% 2b) y(n) = x(n) + 0.9x(n-2) - 0.4y(n-2)
b2b = [1, 0, 0.9];    a2b = [1, 0, 0.4];

% =========================================================
%  FIGURE 1 : First Order System 1a
% =========================================================
figure('Name','System 1a  y(n)=x(n)-x(n-1)','NumberTitle','off');

h = filter(b1a, a1a, imp);
y = filter(b1a, a1a, stp);
[H, w] = freqz(b1a, a1a, Nfft);

subplot(2,2,1);
stem(n, h, 'filled', 'LineWidth', 1.5);
title('Impulse Response h[n]');
xlabel('n'); ylabel('h[n]'); grid on;

subplot(2,2,2);
stem(n, y, 'filled', 'LineWidth', 1.5);
title('Step Response');
xlabel('n'); ylabel('y[n]'); grid on;

subplot(2,2,3);
plot(w/pi, 20*log10(abs(H)+eps), 'LineWidth', 1.5);
title('Magnitude Response');
xlabel('Normalized Freq (\times\pi rad/sample)');
ylabel('Magnitude (dB)'); grid on;

subplot(2,2,4);
plot(w/pi, angle(H)*180/pi, 'LineWidth', 1.5);
title('Phase Response');
xlabel('Normalized Freq (\times\pi rad/sample)');
ylabel('Phase (degrees)'); grid on;

sgtitle('First Order System 1a :  y(n) = x(n) - x(n-1)', ...
        'FontWeight','bold','FontSize',10);

% =========================================================
%  FIGURE 2 : First Order System 1b
% =========================================================
figure('Name','System 1b  y(n)=0.2x(n)+0.2x(n-1)+0.6y(n-1)','NumberTitle','off');

h = filter(b1b, a1b, imp);
y = filter(b1b, a1b, stp);
[H, w] = freqz(b1b, a1b, Nfft);

subplot(2,2,1);
stem(n, h, 'filled', 'LineWidth', 1.5);
title('Impulse Response h[n]');
xlabel('n'); ylabel('h[n]'); grid on;

subplot(2,2,2);
stem(n, y, 'filled', 'LineWidth', 1.5);
title('Step Response');
xlabel('n'); ylabel('y[n]'); grid on;

subplot(2,2,3);
plot(w/pi, 20*log10(abs(H)+eps), 'LineWidth', 1.5);
title('Magnitude Response');
xlabel('Normalized Freq (\times\pi rad/sample)');
ylabel('Magnitude (dB)'); grid on;

subplot(2,2,4);
plot(w/pi, angle(H)*180/pi, 'LineWidth', 1.5);
title('Phase Response');
xlabel('Normalized Freq (\times\pi rad/sample)');
ylabel('Phase (degrees)'); grid on;

sgtitle('First Order System 1b :  y(n) = 0.2x(n) + 0.2x(n-1) + 0.6y(n-1)', ...
        'FontWeight','bold','FontSize',10);

% =========================================================
%  FIGURE 3 : Second Order System 2a
% =========================================================
figure('Name','System 2a  y(n)=0.5x(n)+x(n-1)+0.5x(n-2)','NumberTitle','off');

h = filter(b2a, a2a, imp);
y = filter(b2a, a2a, stp);
[H, w] = freqz(b2a, a2a, Nfft);

subplot(2,2,1);
stem(n, h, 'filled', 'LineWidth', 1.5);
title('Impulse Response h[n]');
xlabel('n'); ylabel('h[n]'); grid on;

subplot(2,2,2);
stem(n, y, 'filled', 'LineWidth', 1.5);
title('Step Response');
xlabel('n'); ylabel('y[n]'); grid on;

subplot(2,2,3);
plot(w/pi, 20*log10(abs(H)+eps), 'LineWidth', 1.5);
title('Magnitude Response');
xlabel('Normalized Freq (\times\pi rad/sample)');
ylabel('Magnitude (dB)'); grid on;

subplot(2,2,4);
plot(w/pi, angle(H)*180/pi, 'LineWidth', 1.5);
title('Phase Response');
xlabel('Normalized Freq (\times\pi rad/sample)');
ylabel('Phase (degrees)'); grid on;

sgtitle('Second Order System 2a :  y(n) = 0.5x(n) + x(n-1) + 0.5x(n-2)', ...
        'FontWeight','bold','FontSize',10);

% =========================================================
%  FIGURE 4 : Second Order System 2b
% =========================================================
figure('Name','System 2b  y(n)=x(n)+0.9x(n-2)-0.4y(n-2)','NumberTitle','off');

h = filter(b2b, a2b, imp);
y = filter(b2b, a2b, stp);
[H, w] = freqz(b2b, a2b, Nfft);

subplot(2,2,1);
stem(n, h, 'filled', 'LineWidth', 1.5);
title('Impulse Response h[n]');
xlabel('n'); ylabel('h[n]'); grid on;

subplot(2,2,2);
stem(n, y, 'filled', 'LineWidth', 1.5);
title('Step Response');
xlabel('n'); ylabel('y[n]'); grid on;

subplot(2,2,3);
plot(w/pi, 20*log10(abs(H)+eps), 'LineWidth', 1.5);
title('Magnitude Response');
xlabel('Normalized Freq (\times\pi rad/sample)');
ylabel('Magnitude (dB)'); grid on;

subplot(2,2,4);
plot(w/pi, angle(H)*180/pi, 'LineWidth', 1.5);
title('Phase Response');
xlabel('Normalized Freq (\times\pi rad/sample)');
ylabel('Phase (degrees)'); grid on;

sgtitle('Second Order System 2b :  y(n) = x(n) + 0.9x(n-2) - 0.4y(n-2)', ...
        'FontWeight','bold','FontSize',10);
