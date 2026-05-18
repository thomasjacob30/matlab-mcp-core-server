% EXPERIMENT 1 - Generation of Waveforms (Continuous and Discrete)
% Aim: Plot Unit Impulse, Unit Step, Unit Ramp, Sine, Cosine signals

% Copyright 2026 The MathWorks, Inc.

clc;
clear;
close all;

% ---- Discrete-time axis ----
n  = -10:10;
nd = -10:10;

% ---- Continuous-time axis ----
t  = -2:0.001:2;
tc = 0:0.001:1;
f  = 5;           % frequency for sine/cosine (Hz)

% =========================================================
%  DISCRETE SIGNALS
% =========================================================
impulse_d  = double(n == 0);
step_d     = double(n >= 0);
ramp_d     = n .* double(n >= 0);
sine_d     = sin(2*pi*0.1*n);    % normalized digital freq 0.1
cosine_d   = cos(2*pi*0.1*n);

figure('Name','Experiment 1 - Discrete Time Signals','NumberTitle','off');

subplot(3,2,1);
stem(n, impulse_d, 'filled', 'LineWidth', 1.5);
title('1. Unit Impulse \delta[n]');
xlabel('n'); ylabel('Amplitude');
axis([-10 10 -0.2 1.3]); grid on;

subplot(3,2,2);
stem(n, step_d, 'filled', 'LineWidth', 1.5);
title('2. Unit Step u[n]');
xlabel('n'); ylabel('Amplitude');
axis([-10 10 -0.2 1.3]); grid on;

subplot(3,2,3);
stem(n, ramp_d, 'filled', 'LineWidth', 1.5);
title('3. Unit Ramp r[n]');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(3,2,4);
stem(n, sine_d, 'filled', 'LineWidth', 1.5);
title('4. Sine Signal sin(0.2\pin)');
xlabel('n'); ylabel('Amplitude');
ylim([-1.3 1.3]); grid on;

subplot(3,2,5);
stem(n, cosine_d, 'filled', 'LineWidth', 1.5);
title('5. Cosine Signal cos(0.2\pin)');
xlabel('n'); ylabel('Amplitude');
ylim([-1.3 1.3]); grid on;

sgtitle('Discrete Time Signals', 'FontWeight', 'bold', 'FontSize', 12);

% =========================================================
%  CONTINUOUS SIGNALS
% =========================================================
impulse_c = double(abs(t) < 0.01);     % approximated impulse
step_c    = double(t >= 0);
ramp_c    = t .* double(t >= 0);
sine_c    = sin(2*pi*f*tc);
cosine_c  = cos(2*pi*f*tc);

figure('Name','Experiment 1 - Continuous Time Signals','NumberTitle','off');

subplot(3,2,1);
plot(t, impulse_c, 'LineWidth', 2);
title('1. Unit Impulse \delta(t)');
xlabel('t'); ylabel('Amplitude');
ylim([-0.2 1.5]); grid on;

subplot(3,2,2);
plot(t, step_c, 'LineWidth', 1.5);
title('2. Unit Step u(t)');
xlabel('t'); ylabel('Amplitude');
ylim([-0.2 1.5]); grid on;

subplot(3,2,3);
plot(t, ramp_c, 'LineWidth', 1.5);
title('3. Unit Ramp r(t)');
xlabel('t'); ylabel('Amplitude');
grid on;

subplot(3,2,4);
plot(tc, sine_c, 'LineWidth', 1.5);
title('4. Sine Signal sin(2\pift)');
xlabel('t (s)'); ylabel('Amplitude');
ylim([-1.3 1.3]); grid on;

subplot(3,2,5);
plot(tc, cosine_c, 'LineWidth', 1.5);
title('5. Cosine Signal cos(2\pift)');
xlabel('t (s)'); ylabel('Amplitude');
ylim([-1.3 1.3]); grid on;

sgtitle('Continuous Time Signals', 'FontWeight', 'bold', 'FontSize', 12);
