close all;

cd data\cali\
speaker_char = load("deg0.mat").y;
cd ..

cd feat2\
for ii = 1:2
    if ii == 1
        filename = 
    for jj = 1:2
        figure;
    
        filename = sprintf("deg%d.mat", (ii-1)*90);
        imp_resp = load(filename).y;
        freq_resp = fft(imp_resp);
    
        semilogx(10*log(abs(freq_resp(1:length(freq_resp)/2)))); axis square
        hold on;
        xlim([100, 1e4])
        ylim([-120, 10])
    
        title(sprintf("Frequency Response (%d degrees)", (ii-1)*90));
        ylabel("dB");
        xlabel("Frequency (Hz)");
    
        hold off;
    end
end

cd ../..