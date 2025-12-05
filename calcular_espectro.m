function [f, mag] = calcular_espectro(sinal, Fs)
    N = length(sinal);
    N_fft = 2^nextpow2(N); % Pega a próxima potência de 2 para eficiência da FFT
    
    Y_fft = fft(sinal, N_fft);
    
    % Calcula a magnitude e normaliza
    P2 = abs(Y_fft / N); % Espectro de dois lados
    
    % Calcula o espectro de lado único (0 a Fs/2)
    P1 = P2(1:N_fft/2+1);
    P1(2:end-1) = 2 * P1(2:end-1);
    
    % Cria o eixo de frequência
    f = Fs * (0:(N_fft/2)) / N_fft;
    mag = P1;
end