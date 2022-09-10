close all;

cd data\cali\

for ii = 1:4
    figure;

    filename = sprintf("deg%d.mat", (ii-1)*90);
    imp_resp = load(filename).y;
    
    freq_resp = abs(fft(imp_resp)).^2;
    freq_resp = freq_resp(1:floor(length(freq_resp)/2));
    freq_resp(1) = freq_resp(1)/2;

    dc_ = freq_resp(1);

    freq_resp = 10*log10(freq_resp);

    semilogx(freq_resp); axis square
    hold on;
    xlim([100, 1e4])
    ylim([-120, 10])

    title(sprintf("Frequency Response (%d degrees)", (ii-1)*90));
    ylabel("dB");
    xlabel("Frequency (Hz)");

    hold off;
end

cd ../..