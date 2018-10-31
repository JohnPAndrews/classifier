
% filename = ['voice-sample-' num2str(sampl) '.wav'];
% [y,Fs] = audioread(filename);
[y,Fs] = audioread('voice-sample-5.wav');

%% Time specifications:
%    Fs = 60;                     % sample frequency = samples per second (hz)
   dt = 1/Fs;                   % time in between each sample (sample interval)
%    StopTime = 10.0;             % end point
   StopTime = dt * length(y);
   t = (0:dt:StopTime-dt)';     % time datapoints = one time value for each sample (time)/(sample interval)
   L = length(t);               % number of data points
   %% Sine wave:
   Fc = 1;                     % hertz
   %x = sin(2*pi*Fc*t) + sin(2*pi*(Fc+1)*t);
%    y = cos(2*pi*Fc*t) + cos(2*pi*(Fc+1)*t + pi/2);
   % Plot the signal versus time:
   figure;
   plot(t,y);
   xlabel('time (in seconds)');
   ylabel('Signal');
   title('Signal versus Time');
   zoom xon;   
   %% fft
   Y = fft(y)/L;
   
   NyLimit = (1/dt)/2;
   
   F = linspace(0,1,L/2)*NyLimit;
   figure
   plot (F, abs(Y(1:L/2)));
   xlabel('freq (Hz)');
   ylabel('Signal');
   title('Amplitude by frequency');
   zoom xon;   
%    X = fft(x, L + 50);
%    NyLimit = (1 / Fs)/ 2;
%    F = linspace(0, 1, L/2);
%    
%    figure;
%    plot(F, abs(X(1:L/2)));
%    
%    figure;
%    plot(F, (X(1:L/2).*conj(X(1:L/2))));
   %% Power
   
   figure
   plot(F, (Y(1:L/2).*conj(Y(1:L/2))));
   xlabel('freq (Hz)');
   ylabel('Power');
   title('Power by frequency');
   zoom xon;   