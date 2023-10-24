% question1(a)
clc;
close all;

% defining time period
Am =1;  
fm1 = 1; 
fm2 = 3;  
t = 0:1/999:1; 
N= length(t); 
N = 2^ceil(log2(N));
f=(-N/2:N/2-1) / ((N/3)*1/999);

% message signal
ym = Am*(sin(2*pi*fm1*t)-sin(2*pi*fm2*t));   
figure();
subplot(2,1,1);
plot(t,ym); 
title("Message signal in time domain");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
grid on; 

%FT of message Signal 
y_F=fftshift(fft(ym,N)); 
subplot(2,1,2);
plot(f,abs(y_F));
title("FFT frequency domain");
xlabel("f");
ylabel("Y(f)");
ylim([0 600]);
xlim([-100 100]);
grid on;
