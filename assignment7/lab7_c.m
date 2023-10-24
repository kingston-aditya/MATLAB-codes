%1c
clc;
close all;

%message signal
fa=1;
fb=3;
f=50;
n_samples=100;  
fs=n_samples*f;
t=0:1/fs:1;
ym=sin(2*pi*fa*t)-sin(2*pi*fb*t);
peaku=round(max(ym));
peakl=round(min(ym));

%impulse train 
y=zeros(size(t));
y(1:n_samples:end)=1;

%sampled signal
ym =  [ym(1,:)];
y = [y(1,:)];

gs = zeros(1,length(y));
for i=1:length(y)
    gs(i) = y(i)*ym(i);
end

%quantized signal;
gkts=zeros(1,length(gs));
k=(peaku-peakl)/16;
Vmax=peaku-k/2;
Vmin=peakl+k/2;
for i=Vmin:k:Vmax
    for j=1:length(gs)
        if((i-k/2)<gs(j) && (gs(j)<(i+k/2)))
            gkts(j)=i;
        end
    end
end

%pulse train
w = 0.01; 
delay = w/2:w*2:10; 
y2=pulstran(t,delay,'rectpuls',w); 
delay1 = [t;y2.*gkts;]';
y3 = pulstran(t,delay1,'rectpuls',w);

current = 0.125;
for c = 1:length(y3)
    if(y2(c)==0)
        y3(c) = 0;
    elseif y3(c)==0
        y3(c) = current;
    else
        current = y3(c);
    end
end

% Plots
figure(1);
subplot(2,1,1);
plot(t,ym);
hold on;
plot(t,y2,'r');
title('message signal and pulse train');
xlabel('Time(sec)');
ylabel('Magnitude');
yticks([-2 -1.75 -1.5 -1.25 -1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1 1.25 1.5 1.75 2]);
xticks(0:0.02:1);
legend('g(t)','p(t)');
grid on;

subplot(2,1,2);
plot(t,ym);
hold on;
stairs(t,y3,'r');
yticks([-2 -1.75 -1.5 -1.25 -1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1 1.25 1.5 1.75 2]);
grid on;
title('message train and quantised signal');
xlabel('Time(sec)');
ylabel('Magnitude');
xticks(0:0.02:1);
yticks([-2 -1.75 -1.5 -1.25 -1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1 1.25 1.5 1.75 2]);
legend('g(t)','g_q(t)');
grid on;