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
                EDC(kk) = sum(y(kk:end).^2);
            end

            EDC = 10*log10(EDC/max(EDC));

            Y = EDC(min(find(EDC<0)):min(find(EDC<-10)))';
            
            X = [ones(length(Y), 1) , (1:length(Y))'];

            beta = X \ Y;
            y_decay = X * beta;
            
            plot(EDC); axis square
            hold on
            plot(y_decay);
            
            title(sprintf("EDC - Room %s, Position %s", upper(room), upper(pos)));
            ylabel("dB");
            xlabel("Time");

            labels = [labels sprintf("1/3 OBCF: %d, EDT: %d, T20: %d", cf)];
        end
        legend(labels);
        break
    end
end
