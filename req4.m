close all;

tob_cf = [250, 315, 400, 500, 630, 800, 1000, ...
    1250, 1600, 2000, 2500, 3150, 4000];

rooms = ["a", "b"];
positions = ["a", "b"];

cd data\feat2\
for room = rooms
    for pos = positions

        filename = sprintf("imp_resp_%s_%s.mat", room, pos);
        imp_resp = load(filename).y(4.75e4:9.55e4); 
        EDC = [];
        
        for kk = 1:length(imp_resp)
            EDC(kk) = 10*log10(sum(imp_resp(kk:end).^2));
            % Doesn't start at 0?? Every 1/3 OBCF?
        end
        
        plot(EDC);
        break;
    end
    break;
end

cd ../..