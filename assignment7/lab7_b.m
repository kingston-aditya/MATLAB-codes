%1b
clc;
close all;

%message signal
fa=1;
fb=3;
fs=50; 
t=0:1/fs:1; 
ym=sin(2*pi*fa*t)-sin(2*pi*fb*t);
peaku=round(max(ym));
peakl=round(min(ym));

%impulse train                 
y=zeros(size(t));
y(1:1:end)=1;

%sampled signal
ym =  [ym(1,:)];
y = [y(1,:)];

gs = zeros(1,length(y));
for i=1:length(y)
    gs(i) = y(i)*ym(i);
end

%Initialise zeros array
gskt=zeros(1,length(gs));

%defining the quantised signal
k=(peaku-peakl)/16;
Vmax=peaku-k/2;
Vmin=peakl+k/2;
for i=Vmin:k:Vmax
    for j=1:length(ym)
        if((i-k/2)<=gs(j) && (gs(j)<=(i+k/2)) && ...
                gs(j) ~= 0)
            gskt(j)=i;
        end
        if(gs(j) == 0)
            gskt(j)=0.125;
        end
    end
end

% pulse train
ts = 1/fs;
tp = ts;
w = zeros(1,length(gskt));
for i=1:length(w)
    w(i) = 1;
end
y2=w;

%creating g_h signal
gq=y2.*gskt;

subplot(2,1,1);
plot(t,ym,'b');
hold on;
plot(t,y2,'r');
title('Superposition of message signal and pulse train');
xlabel('Time(sec)');
ylabel('Magnitude');
xticks(t);
yticks([-2 -1.75 -1.5 -1.25 -1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1 1.25 1.5 1.75 2]);
legend('g(t)','p(t)');
grid on;

subplot(2,1,2);
plot(t,ym,'b');
hold on;
stairs(t,gq,'r');
yticks([-2 -1.75 -1.5 -1.25 -1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1 1.25 1.5 1.75 2]);
grid on;
title('quantised signal multipled to pulse train vs message signal');
xlabel('Time(sec)')
ylabel('Magnitude')
xticks(t);
yticks([-2 -1.75 -1.5 -1.25 -1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1 1.25 1.5 1.75 2]);
legend('g(t)','g_q(t)')
grid on;