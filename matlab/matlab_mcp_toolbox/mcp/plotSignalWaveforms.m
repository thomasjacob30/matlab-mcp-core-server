function plotSignalWaveforms()
    %plotSignalWaveforms Plot fundamental signal waveforms
    %   Generates and displays plots for five standard signals:
    %   Unit Impulse, Unit Step, Unit Ramp, Sine, and Cosine.

    % Copyright 2026 The MathWorks, Inc.

    t = -5:0.01:5;          % continuous-time axis
    n = -10:10;             % discrete-time axis for impulse/step/ramp

    figure('Name', 'Signal Waveforms', 'NumberTitle', 'off', ...
           'Position', [100 100 1200 700]);

    % --- 1. Unit Impulse ---
    subplot(2, 3, 1);
    impulse = double(n == 0);
    stem(n, impulse, 'filled', 'LineWidth', 1.5, 'Color', [0.2 0.4 0.8]);
    title('Unit Impulse Signal \delta[n]');
    xlabel('n');
    ylabel('Amplitude');
    xlim([-5 5]);
    ylim([-0.1 1.3]);
    grid on;

    % --- 2. Unit Step ---
    subplot(2, 3, 2);
    step_sig = double(n >= 0);
    stem(n, step_sig, 'filled', 'LineWidth', 1.5, 'Color', [0.8 0.3 0.2]);
    title('Unit Step Signal u[n]');
    xlabel('n');
    ylabel('Amplitude');
    xlim([-5 5]);
    ylim([-0.1 1.3]);
    grid on;

    % --- 3. Unit Ramp ---
    subplot(2, 3, 3);
    ramp = max(n, 0);
    stem(n, ramp, 'filled', 'LineWidth', 1.5, 'Color', [0.2 0.7 0.3]);
    title('Unit Ramp Signal r[n]');
    xlabel('n');
    ylabel('Amplitude');
    xlim([-5 10]);
    grid on;

    % --- 4. Sine ---
    subplot(2, 3, 4);
    f = 1;                  % 1 Hz
    sine_sig = sin(2 * pi * f * t);
    plot(t, sine_sig, 'LineWidth', 1.8, 'Color', [0.7 0.2 0.7]);
    title('Sine Signal sin(2\pift)');
    xlabel('Time (s)');
    ylabel('Amplitude');
    xlim([-5 5]);
    ylim([-1.3 1.3]);
    grid on;

    % --- 5. Cosine ---
    subplot(2, 3, 5);
    cosine_sig = cos(2 * pi * f * t);
    plot(t, cosine_sig, 'LineWidth', 1.8, 'Color', [0.9 0.5 0.1]);
    title('Cosine Signal cos(2\pift)');
    xlabel('Time (s)');
    ylabel('Amplitude');
    xlim([-5 5]);
    ylim([-1.3 1.3]);
    grid on;

    sgtitle('Fundamental Signal Waveforms', 'FontSize', 14, 'FontWeight', 'bold');
end
