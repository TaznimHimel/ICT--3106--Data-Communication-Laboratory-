% NRZ-I Encoding and Decoding

% Input parameters
bits = [1 0 1 1 1 0 0 1]; % Binary sequence
bitrate = 1; % Bits per second
n = 200; % Samples per bit

% Derived parameters
T = length(bits); % Total time in seconds
N = n * length(bits); % Total number of samples
dt = T / N; % Time step
t = 0:dt:(T-dt); % Time vector
x = zeros(1, length(t)); % Encoded signal

% NRZ-I Encoding
lastbit = 1; % Initial polarity
for i = 1:length(bits)
    start_idx = (i-1)*n + 1;
    end_idx = i*n;
    if bits(i) == 1
        lastbit = -lastbit; % Toggle polarity for '1'
    end
    x(start_idx:end_idx) = lastbit; % Assign the signal
end

% Plot the encoded signal
figure;
plot(t, x, 'LineWidth', 2);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('NRZ-I Encoded Signal');
ylim([-1.5, 1.5]);

% NRZ-I Decoding
counter = 0; % To track bit period
lastbit = 1; % Initial polarity
decoded_bits = []; % Array to store decoded bits

for i = 1:length(t)
    if t(i) >= counter
        counter = counter + 1; % Move to the next bit period
        if x(i) == lastbit
            decoded_bits = [decoded_bits, 1]; % No polarity change: '1'
        else
            decoded_bits = [decoded_bits, 0]; % Polarity change: '0'
            lastbit = -lastbit; % Update polarity
        end
    end
end

% Display decoded bits
disp('NRZ-I Decoding:');
disp(decoded_bits);
