% EXPERIMENT 7 - FIR and IIR Filter Design
%
% Part i  - IIR Low-Pass Filter
%           Specs: Passband ripple <= 1dB, Passband edge = 4kHz
%                  Stopband atten  >= 40dB, Stopband edge = 6kHz
%                  Sampling rate   = 24kHz
%           Design: a) Butterworth   b) Chebyshev Type-I
%
% Part ii - FIR Band-Pass Filter
%           Specs: fp1=20Hz, fp2=30Hz, fs1=10Hz, fs2=40Hz
%                  Rp=0.5dB, Rs=30dB, Fs=100Hz
%           Design: a) Hamming Window   b) Kaiser Window

% Copyright 2026 The MathWorks, Inc.

clc;
clear;
close all;

% =========================================================
%  PART i : IIR LOW-PASS FILTER
% =========================================================
Fs  = 24000;   % sampling frequency (Hz)
Fp  = 4000;    % passband edge (Hz)
Fst = 6000;    % stopband edge (Hz)
Rp  = 1;       % passband ripple (dB)
Rs  = 40;      % stopband attenuation (dB)

% Normalize to [0,1] where 1 = Nyquist = Fs/2
Wp = Fp  / (Fs/2);
Ws = Fst / (Fs/2);

% --- a) Butterworth LPF ---
[n_but, Wn_but] = buttord(Wp, Ws, Rp, Rs);
[b_but, a_but]  = butter(n_but, Wn_but, 'low');
fprintf('Butterworth LPF  Order = %d\n', n_but);

figure('Name','IIR - Butterworth LPF','NumberTitle','off');
[H, f] = freqz(b_but, a_but, 1024, Fs);

subplot(2,1,1);
plot(f, 20*log10(abs(H)+eps), 'LineWidth', 1.5);
title(sprintf('Butterworth LPF  (Order = %d)  Magnitude Response', n_but));
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
xline(Fp,  '--r', 'Passband Edge', 'LabelVerticalAlignment','bottom');
xline(Fst, '--b', 'Stopband Edge', 'LabelVerticalAlignment','bottom');
grid on;

subplot(2,1,2);
plot(f, angle(H)*180/pi, 'LineWidth', 1.5);
title('Butterworth LPF  Phase Response');
xlabel('Frequency (Hz)'); ylabel('Phase (degrees)');
grid on;

sgtitle('IIR Filter - Butterworth LPF', 'FontWeight', 'bold');

% --- b) Chebyshev Type-I LPF ---
[n_cheb, Wn_cheb] = cheb1ord(Wp, Ws, Rp, Rs);
[b_cheb, a_cheb]  = cheby1(n_cheb, Rp, Wn_cheb, 'low');
fprintf('Chebyshev Type-I LPF  Order = %d\n', n_cheb);

figure('Name','IIR - Chebyshev Type-I LPF','NumberTitle','off');
[H, f] = freqz(b_cheb, a_cheb, 1024, Fs);

subplot(2,1,1);
plot(f, 20*log10(abs(H)+eps), 'LineWidth', 1.5);
title(sprintf('Chebyshev Type-I LPF  (Order = %d)  Magnitude Response', n_cheb));
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
xline(Fp,  '--r', 'Passband Edge', 'LabelVerticalAlignment','bottom');
xline(Fst, '--b', 'Stopband Edge', 'LabelVerticalAlignment','bottom');
grid on;

subplot(2,1,2);
plot(f, angle(H)*180/pi, 'LineWidth', 1.5);
title('Chebyshev Type-I LPF  Phase Response');
xlabel('Frequency (Hz)'); ylabel('Phase (degrees)');
grid on;

sgtitle('IIR Filter - Chebyshev Type-I LPF', 'FontWeight', 'bold');

% =========================================================
%  PART ii : FIR BAND-PASS FILTER
% =========================================================
Fs2 = 100;   % sampling frequency (Hz)
fp1 = 20;    % passband lower edge (Hz)
fp2 = 30;    % passband upper edge (Hz)
fs1 = 10;    % stopband lower edge (Hz)
fs2 = 40;    % stopband upper edge (Hz)
Rp2 = 0.5;   % passband ripple (dB)
Rs2 = 30;    % stopband attenuation (dB)

% Transition width (use the narrower of the two)
df      = min(fp1 - fs1, fs2 - fp2);   % = 10 Hz

% FIR order estimate using Kaiser formula
% N ~ (Rs - 7.95) / (14.36 * (df/Fs))
N_est   = ceil((Rs2 - 7.95) / (14.36 * (df/Fs2)));
N_ham   = N_est + mod(N_est+1, 2);    % make odd (Type I FIR)
N_kai   = N_ham;                       % use same order for comparison

% Normalized passband edges [0,1]  (1 = Nyquist)
Wn_bp   = [fp1, fp2] / (Fs2/2);

% --- a) Hamming Window BPF ---
b_ham = fir1(N_ham - 1, Wn_bp, 'bandpass', hamming(N_ham));
fprintf('\nFIR BPF Hamming Window  Order = %d\n', N_ham - 1);

figure('Name','FIR BPF - Hamming Window','NumberTitle','off');
[H, f] = freqz(b_ham, 1, 1024, Fs2);

subplot(2,1,1);
plot(f, 20*log10(abs(H)+eps), 'LineWidth', 1.5);
title(sprintf('FIR BPF - Hamming Window  (Order = %d)  Magnitude Response', N_ham-1));
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
xline(fs1, '--b'); xline(fp1, '--r');
xline(fp2, '--r'); xline(fs2, '--b');
grid on;

subplot(2,1,2);
plot(f, angle(H)*180/pi, 'LineWidth', 1.5);
title('FIR BPF - Hamming Window  Phase Response');
xlabel('Frequency (Hz)'); ylabel('Phase (degrees)');
grid on;

sgtitle('FIR Filter - Hamming Window BPF', 'FontWeight', 'bold');

% --- b) Kaiser Window BPF ---
beta  = 0.1102 * (Rs2 - 8.7);             % Kaiser beta parameter
b_kai = fir1(N_kai - 1, Wn_bp, 'bandpass', kaiser(N_kai, beta));
fprintf('FIR BPF Kaiser Window   Order = %d  (beta = %.4f)\n', N_kai-1, beta);

figure('Name','FIR BPF - Kaiser Window','NumberTitle','off');
[H, f] = freqz(b_kai, 1, 1024, Fs2);

subplot(2,1,1);
plot(f, 20*log10(abs(H)+eps), 'LineWidth', 1.5);
title(sprintf('FIR BPF - Kaiser Window  (Order = %d)  Magnitude Response', N_kai-1));
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
xline(fs1, '--b'); xline(fp1, '--r');
xline(fp2, '--r'); xline(fs2, '--b');
grid on;

subplot(2,1,2);
plot(f, angle(H)*180/pi, 'LineWidth', 1.5);
title('FIR BPF - Kaiser Window  Phase Response');
xlabel('Frequency (Hz)'); ylabel('Phase (degrees)');
grid on;

sgtitle('FIR Filter - Kaiser Window BPF', 'FontWeight', 'bold');
