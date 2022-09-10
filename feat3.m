close all;

cd data\cali\
speaker_char = load("deg0.mat").y;
cd ..
cd feat2\

for ii = 1:2

    room = "a";
    if ii == 1
        room = "b";
    end

    figure;
    labels = [];

    for jj = 1:2

        pos = "a";
        if jj == 1
            pos = "b";
        end
        filename = sprintf("imp_resp_%s_%s.mat", room, pos);
        imp_resp = load(filename).y - speaker_char;
        freq_resp = fft(imp_resp);
    
        semilogx(10*log(abs(freq_resp(1:length(freq_resp)/2)))); axis square
        hold on;
        xlim([100, 1e4])
        ylim([-120, 10])
    
        title(sprintf("Frequency Response: Room %s", upper(room)));
        ylabel("dB");
        xlabel("Frequency (Hz)");

        labels = [labels sprintf("Position %s", upper(pos))];
    
    end
    legend(labels);
    hold off;
end

cd ../..