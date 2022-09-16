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
        for cf = 1:length(tob_cf)
            [B,A] = oct3dsgn(tob_cf(cf), 4.8e4, 3);
            y = filter(B,A,imp_resp);
            
            for kk = 1:length(y)
                EDC(kk) = sum(y(kk:end).^2);
            end
            
            % Normalise
            EDC = 10*log10(EDC/max(EDC));

            EDT = RTcalc("EDT", EDC);
            T20 = RTcalc("T20", EDC);

            plot(EDC); axis square
            hold on

            title(sprintf("EDC - Room %s, Position %s", upper(room), upper(pos)));
            ylabel("Level (dB)");
            xlabel("Time (\times10^{-4} s)");

            labels = [labels sprintf("%.1fHz %.2fs %.2fs", tob_cf(cf), EDT, T20)];
        end
        legend(labels);
    end
end
