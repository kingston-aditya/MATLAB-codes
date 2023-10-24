% question1(a)
clc;
close all;

% message signal
Am =1;   
fm1 = 1; 
fm2 = 3;  
t = 0:0.02:1;  

ym = Am*(sin(2*pi*fm1*t)-sin(2*pi*fm2*t)); 
peaku=round(max(ym));
peakl=round(min(ym));
figure(1);
subplot(3,1,1);
plot(t,ym);
title("Message signal in time domain");
xlabel("time(sec)");
ylabel("Amplitude(Volt)");
grid on; 

%impulse train 
t=0:0.02:1;
y = ones(length(t));
subplot(3,1,2)
stem(t,y);
title("impulse train");
xlabel("t");
ylabel("Amplitude(volt)");
grid on;

%sampled signal
ym =  [ym(1,:)];
y = [y(1,:)];

gs = zeros(1,length(y));
for i=1:length(y)
    gs(i) = y(i)*ym(i);
end

subplot(3,1,3);
stem(t,gs);
title("impulse train multiplied to message signal");
xlabel("t");
ylabel("Amplitude(volt)");
grid on;

% superimposed signal
l = 16;
peak = max(abs(ym));
delta = 2*peak/16;

gkts=zeros(1,length(gs));

%defining the quantised signal
k=(peaku-peakl)/16;
Vmax=peaku-k/2;
Vmin=peakl+k/2;
for i=Vmin:k:Vmax
    for j=1:length(ym)
        if((i-k/2)<gs(j) && (gs(j)<(i+k/2)) && ...
                gs(j) ~= 0)
            gkts(j)=i;
        end
        if(gs(j) == 0)
            gkts(j)=0.125;
        end
    end
end

figure(2);
plot(t,ym,'r');
hold on;
stem(t,ym,'o');
hold on;
stem(t,gkts,'b');
legend('message','sampled','quantized');
title("Superimposed signal");
xlabel("t");
ylabel("Amplitude(volt)");
yticks([-2 -1.75 -1.5 -1.25 -1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1 1.25 1.5 1.75 2]);
grid on;
