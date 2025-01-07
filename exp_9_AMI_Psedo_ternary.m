% Pseudo Ternary Encoding and Decoding
% Input
bits = input('Enter the bits (e.g., [1 0 1 1]): ', 's');
bits = str2num(bits); % Convert input to numeric array
if any(bits ~= 0 & bits ~= 1)
    error('Input must be a binary sequence (0s and 1s only).');
end

% Parameters
bitrate = 1; % Bits per second
n = 1000; % Samples per bit
T = length(bits) / bitrate; % Total duration in seconds
N = n * length(bits); % Total number of samples
dt = T / N; % Time step
t = linspace(0, T, N); % Time vector
x = zeros(1, length(t)); % Encoded signal
lastbit = 1; % Tracks the last polarity

% Pseudo Ternary Encoding
for i = 1:length(bits)
    start_idx = (i-1)*n + 1; % Start index for the bit
    end_idx = i * n; % End index for the bit
    if bits(i) == 1
        x(start_idx:end_idx) = -lastbit; % Flip polarity for '1'
        lastbit = -lastbit; % Update last polarity
    end
    % For '0', signal remains 0 (already initialized in x)
end

% Plot the encoded signal
figure;
plot(t, x, 'LineWidth', 2);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Pseudo Ternary Encoded Signal');
ylim([-2 2]);

% Pseudo Ternary Decoding
result = zeros(1, length(bits)); % Preallocate result array
lastbit = 1; % Reset lastbit for decoding
counter = 1; % Bit index tracker

for i = 1:n:length(t) % Loop through each bit period
    if x(i) == -lastbit
        result(counter) = 1; % Decode as '1'
        lastbit = -lastbit; % Update last polarity
    else
        result(counter) = 0; % Decode as '0'
    end
    counter = counter + 1;
end

% Display the decoded bits
disp('Pseudo Ternary Decoding:');
disp(result);