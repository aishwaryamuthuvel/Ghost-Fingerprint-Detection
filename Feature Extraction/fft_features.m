function [f1,f2,o1,o2,f,o] = fft_features(I)

C = mat2cell(I,(32*ones(1,24)),(32*ones(1,25)));
f1 = zeros(size(C));
o1 = zeros(size(C));
f2 = zeros(size(C));
o2 = zeros(size(C));

for i = 1:size(C,1)
    for j = 1:size(C,2)
        if min(min(C{i,j})) ~= 1
            I_fft = fft2(C{i,j});
            I_shift = fftshift(I_fft);
            
            I_shift(17,17)=0; %DC peak

            [~,ind] = max(I_shift,[],'all','linear');

            I_shift(ind) = 0; %First peak

            [~,ind] = max(I_shift,[],'all','linear');
            I_shift(ind) = 0; %First peak (symmetry)

            [r,c] = ind2sub([32,32],ind);

            u = c-17;
            v = r-17;

            f1(i,j) = sqrt(u^2+v^2);
            
            if u ~=0
                o1(i,j) = atan((v/u));
            else
                o1(i,j) = deg2rad(90);
            end

            if isnan(o1(i,j))
                o1(i,j) = 0;
            end

            [~,ind] = max(I_shift,[],'all','linear');

            I_shift(ind) = 0; %Second Peak

            [~,ind] = max(I_shift,[],'all','linear');
            
%             I_shift(ind) = 0;

            [r,c] = ind2sub([32,32],ind);

            u = c-17;
            v = r-17;
            
            % to deal with harmonics 
            f2(i,j) = sqrt(u^2+v^2);
            if f2(i,j) >= 2*f1(i,j)
                f2(i,j) = f2(i,j)/(floor(f2(i,j)/f1(i,j)));
            end
            if u ~=0
                o2(i,j) = atan((v/u));
            else
                o2(i,j) = deg2rad(90);
            end

            if isnan(o2(i,j))
                o2(i,j) = 0;
            end
        end
    end
end

f = f1 - f2;
o = o1 - o2;

% xrange = -16:15; % the range of x values
% yrange = -16:15; % the range of y values
% C = cat(3, ones(size(I_shift)),zeros(size(I_shift)),ones(size(I_shift)));
% figure;
% hd =surf(xrange,yrange,log(abs(I_shift)),C,'FaceColor','interp','Facelighting','gouraud');
% camlight right

end

