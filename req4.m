close all;

tob_cf = [250, 315, 400, 500, 630, 800, 1000, ...
    1250, 1600, 2000, 2500, 3150, 4000];

rooms = ["a", "b"];
positions = ["a", "b"];

addpath data\feat2\
for room = rooms
    for pos = positions

        filename = sprintf("imp_resp_%s_%s.mat", room, pos);
        imp_resp = load(filename).y(4.75e4:9.55e4); 
        EDC = [];
        
        figure;
        
        labels = [];
        y = [];
        for cf = tob_cf
            [B,A] = oct3dsgn(cf, 4.8e4, 3);
            y = filter(B,A,imp_resp);
            
            for kk = 1:length(y)
                EDC(kk) = 10*log10(sum(y(kk:end).^2));
                % Doesn't start at 0??
            end
            plot(EDC); axis square
            hold on
            
            title(sprintf("EDC - Room %s, Position %s", upper(room), upper(pos)));
            ylabel("dB");
            xlabel("Time");

            labels = [labels sprintf("1/3 Octave Band Freq: %d", cf)];
        end
        legend(labels);
    end
end
