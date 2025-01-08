% NRZ-L Signal Generator

% User-defined parameters
binary_data = [1 0 1 1 0 0 1 0]; % Input binary sequence
bit_duration = 1;                % Duration of each bit (seconds)
sampling_frequency = 1000;        % Samples per second

% Derived parameters
samples_per_bit = bit_duration * sampling_frequency;
t = linspace(0, length(binary_data) * bit_duration, length(binary_data) * samples_per_bit);

% Generate NRZ-L waveform
nrz_l_waveform = repelem(2 * binary_data - 1, samples_per_bit);

% Plot Binary Input Sequence
figure;
subplot(2, 1, 1);
stairs(0:length(binary_data), [binary_data, binary_data(end)], 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Binary Input Sequence');
ylim([-0.5, 1.5]);
grid on;

% Plot NRZ-L Waveform
subplot(2, 1, 2);
plot(t, nrz_l_waveform, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('NRZ-L Signal');
ylim([-1.5, 1.5]);
grid on;
