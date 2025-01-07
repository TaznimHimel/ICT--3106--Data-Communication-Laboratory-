bits = input('Enter the bits: ');
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));

for i=1:length(bits)
    if bits(i)==1
        x((i-1)*n+1:(i-1)*n+n/2) = 1;
        x((i-1)*n+n/2:i*n) = -1;
    else
        x((i-1)*n+1:(i-1)*n+n/2) = -1;
        x((i-1)*n+n/2:i*n) = 1;
    end
end

plot(t,x,'Linewidth',3);
grid on;
xlabel('Time');
ylabel('Amplitude');
title('Manchester Encoding');


counter = 0;
result = zeros(1,length(bits));
for i=1:length(t)
    if t(i)>counter
        counter = counter + 1;
        if x(i) > 0
            result(counter) = 1;
        else
            result(counter) = 0;
        end
    end
end
disp('Manchester Decoding:');
disp(result);