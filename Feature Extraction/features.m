function [freq,orient,inten] = features(I,I_bw)

C = mat2cell(I,(32*ones(1,24)),(32*ones(1,25)));
C_bw = mat2cell(I_bw,(32*ones(1,24)),(32*ones(1,25)));
freq = zeros(size(C));
orient = zeros(size(C));
inten = zeros(size(C));

for i = 1:size(C,1)
    for j = 1:size(C,2)
        if min(min(C_bw{i,j})) ~= 1 %non-background segments 
            orient(i,j) = orientation(C{i,j});
            freq(i,j) = frequency(C_bw{i,j},orient(i,j));
            inten(i,j) = intensity(C{i,j},C_bw{i,j});
        end
    end
end
end

