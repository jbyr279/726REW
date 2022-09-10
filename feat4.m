close all;

tob_cf = [250, 315, 400, 500, 630, 800, 1000, ...
    1250, 1600, 2000, 2500, 3150, 4000];

cd data\feat2\
for ii = 1:2

    room = "a";
    if ii == 1
        room = "b";
    end

    for jj = 1:2

        pos = "a";
        if jj == 1
            pos = "b";
        end
        filename = sprintf("imp_resp_%s_%s.mat", room, pos);
        imp_resp = load(filename).y(4.5e4:8e4); 
        EDC = [];
        
        for kk = 1:length(imp_resp)
            EDC(kk) = 10*log10(sum(imp_resp(kk:end).^2));
        end
        figure;
        plot(imp_resp);
        figure;
        plot(EDC);
        break;
    end
    break;
end

cd ../..