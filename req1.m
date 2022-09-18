close all;

addpath data\cali\

for ii = 1:4
    figure;

    filename = sprintf("deg%d.mat", (ii-1)*90);
    imp_resp = load(filename).y(4.75e4:9.55e4);
    
    freq_resp = abs(fft(imp_resp));%.^2;
    freq_resp = freq_resp(1:floor(length(freq_resp)/2));

    freq_resp = 20*log10(freq_resp);

    freq_range = 100:1e4;
    semilogx(freq_range, freq_resp(freq_range)); axis square
    hold on

    title(sprintf("Frequency Response (%d degrees)", (ii-1)*90));
    ylabel("Level (dB)");
    xlabel("Frequency (Hz)");

    hold off;
end

