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
            
            % Normalise
            EDC = 10*log10(EDC/max(EDC));

            Y_EDT = EDC(min(find(EDC<0)):min(find(EDC<-10)))';
            Y_T20 = EDC(min(find(EDC<-5)):min(find(EDC<-20)))';

            X_EDT = [ones(length(Y_EDT), 1) , (1:length(Y_EDT))'];
            X_T20 = [ones(length(Y_T20), 1) , (1:length(Y_T20))'];

            beta_EDT = X_EDT \ Y_EDT;
            beta_T20 = X_T20 \ Y_T20;

            X = [ones(length(EDC), 1) , (1:length(EDC))'];

            EDT = min(find((X * beta_EDT)<-60))/1e4;
            T20 = min(find((X * beta_T20)<-60))/1e4;
            
            plot(EDC); axis square
            hold on

            title(sprintf("EDC - Room %s, Position %s", upper(room), upper(pos)));
            ylabel("dB");
            xlabel("Time");

            labels = [labels sprintf("%dHz - EDT: %.2f, T20: %.2f", cf, EDT, T20)];
        end
        legend(labels);
    end
end
