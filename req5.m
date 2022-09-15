close all;

addpath data\feat4\

C50_a = [];
C50_b = [];

dist = [0.5, 1, 2, 3];
room = ["a", "b"];

for ii = room
    for jj = 1:length(dist)
        
        filename = sprintf("imp_resp_%s_%s.mat", num2str(dist(jj)), ii);
        imp_resp = load(filename).y;
        
        if ii == "a"
            C50_a(jj) = 1;
        else 
            C50_b(jj) = 1;
        end
    end
end