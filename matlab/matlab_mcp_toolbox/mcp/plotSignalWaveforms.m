function plotSignalWaveforms()
    %plotSignalWaveforms Plot fundamental signal waveforms
    %   Generates and displays plots for five standard signals:
    %   Unit Impulse, Unit Step, Unit Ramp, Sine, and Cosine.

    % Copyright 2026 The MathWorks, Inc.

    clc;
    close all;

    % ---------- Discrete-time axis (for impulse, step, ramp) ----------
    n = -10:10;

    % ---------- Continuous-time axis (for sine, cosine) ----------
    t = 0:0.01:1;          % 1 second window
    f = 5;                 % frequency in Hz

    % ---------- 1. Unit Impulse Signal ----------
    impulse = (n == 0);

    % ---------- 2. Unit Step Signal ----------
    step_sig = (n >= 0);

    % ---------- 3. Unit Ramp Signal ----------
    ramp = n .* (n >= 0);

    % ---------- 4. Sine Signal ----------
    sine_sig = sin(2 * pi * f * t);

    % ---------- 5. Cosine Signal ----------
    cosine_sig = cos(2 * pi * f * t);

    % ---------- Plotting ----------
    figure('Name', 'Signal Waveforms', 'NumberTitle', 'off');

    subplot(3, 2, 1);
    stem(n, impulse, 'filled', 'LineWidth', 1.5);
    title('Unit Impulse Signal');
    xlabel('n');
    ylabel('\delta[n]');
    grid on;
    axis([-10 10 -0.2 1.2]);

    subplot(3, 2, 2);
    stem(n, step_sig, 'filled', 'LineWidth', 1.5);
    title('Unit Step Signal');
    xlabel('n');
    ylabel('u[n]');
    grid on;
    axis([-10 10 -0.2 1.2]);

    subplot(3, 2, 3);
    stem(n, ramp, 'filled', 'LineWidth', 1.5);
    title('Unit Ramp Signal');
    xlabel('n');
    ylabel('r[n]');
    grid on;

    subplot(3, 2, 4);
    plot(t, sine_sig, 'LineWidth', 1.5);
    title('Sine Signal');
    xlabel('Time (s)');
    ylabel('sin(2\pift)');
    grid on;

    subplot(3, 2, 5);
    plot(t, cosine_sig, 'LineWidth', 1.5);
    title('Cosine Signal');
    xlabel('Time (s)');
    ylabel('cos(2\pift)');
    grid on;

    sgtitle('Basic Signal Waveforms');
end
