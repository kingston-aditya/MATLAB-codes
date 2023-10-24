clc;
close all;

% number of bits
N=10^4;

% two bits  
m=[-1,1];

%step 1
x=[];
for i=1:N
    x(i)=m(randi(length(m)));   
end

%SNR ratio in db
%will go from 0 to 14
snr_db=0:1:14;                

% snr
snr=10.^(snr_db/10);

%variance
var=(1./snr); 

% Probability of error
Pe=[];
for k=1:length(var)

    % step 2
    % noise
    % cholesky factorization for GD of specific
    % standard deviation. chol of a scalar is under root
    % of the scalar. eg - chol(4) = 2. See 
    % docs "https://www.mathworks.com/help/matlab/ref/randn.html"
    % for more info.
    % 0 mean added
    n=sqrt(var(k))*randn(1,N);

    % step 3
    % received signal
    y=x+n;
    
    % step 4
    %decoding
    r=[];
    for l=1:N
        if y(l)<0
            r(l)= -1;
        else
            r(l)= 1;
        end
    end
    
    % step 5
    %error calculation
    e=0;
    for j=1:N
        if r(j)~=x(j)
            e=e+1;
        end
    end  
    
    % step 6
    % probability of error
    Pe(k)= e/N;
end

%theoretical Pe
tPe=qfunc(sqrt(snr));

figure(1);
semilogy(snr_db,Pe,'linewidth',1.5);
hold on;
semilogy(snr_db,tPe,'linewidth',1.5);
xlabel('SNR in db');
ylabel('Pe');
title('Pe vs SNR');
xlim([0 16]);
ylim([10^-5 1]);
grid on;
legend('Practical','Theoretical');



