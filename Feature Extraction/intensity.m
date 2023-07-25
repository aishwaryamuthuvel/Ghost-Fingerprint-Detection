function [p_intensity] = intensity(I,I_bw)

p_intensity = 0;
count = 0;
for i = 1:size(I,1)
    for j = 1:size(I,2)
        if(I_bw(i,j)==0)
            count = count+1;
            p_intensity = p_intensity+I(i,j);
        end
    end
end

if count == 0
    p_intensity = 1;
else
    p_intensity = p_intensity/count;
end

end

