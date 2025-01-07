% Manchester Encoding and Decoding

% Input
bits = input('Enter the bits as a binary sequence (e.g., [1 0 1 0]): ');
if ischar(bits)
    bits = str2num(bits); % Convert string input to numeric array if necessary
end

% Parameters
bitrate = 1; % Bits per second
samples_per_bit = 1000; % Number of samples per bit
T = length(bits) / bitrate; % Total time
N = samples_per_bit * length(bits); % Total samples
dt = T / N; % Time step
time_vector = 0:dt:(T-dt); % Time vector
manchester_signal = zeros(1, length(time_vector)); % Encoded Manchester signal

% Manchester Encoding
for i = 1:length(bits)
    start_idx = (i-1) * samples_per_bit + 1; % Start index for current bit
    mid_idx = start_idx + samples_per_bit / 2 - 1; % Midpoint index
    end_idx = i * samples_per_bit; % End index for current bit
    
    if bits(i) == 1
        % High for the first half, Low for the second half
        manchester_signal(start_idx:mid_idx) = 1;
        manchester_signal(mid_idx+1:end_idx) = -1;
    else
        % Low for the first half, High for the second half
        manchester_signal(start_idx:mid_idx) = -1;
        manchester_signal(mid_idx+1:end_idx) = 1;
    end
end

% Plot the encoded Manchester signal
figure;
plot(time_vector, manchester_signal, 'LineWidth', 3);
grid on;
xlabel('Time');
ylabel('Amplitude');
title('Manchester Encoding');
ylim([-2 2]);

% Manchester Decoding
counter = 0; % Bit counter
result = zeros(1, length(bits)); % Decoded result array

for i = 1:length(time_vector)
    if time_vector(i) >= counter
        counter = counter + 1; % Move to the next bit period
        start_idx = (counter-1) * samples_per_bit + 1; % Start index for bit period
        mid_idx = start_idx + samples_per_bit / 2 - 1; % Midpoint index
        
        % Decoding logic
        if manchester_signal(start_idx) > 0 && manchester_signal(mid_idx+1) < 0
            result(counter) = 1; % High-to-Low transition
        elseif manchester_signal(start_idx) < 0 && manchester_signal(mid_idx+1) > 0
            result(counter) = 0; % Low-to-High transition
        else
            error('Invalid Manchester signal detected during decoding.');
        end
    end
end

% Display decoded bits
disp('Manchester Decoding:');
disp(result);
