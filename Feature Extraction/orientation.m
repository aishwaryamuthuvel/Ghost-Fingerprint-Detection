function angle = orientation(I)

[Sx,Sy] = sobel(I);
vx = 0;
vy = 0;
for i = 1:size(I,1)
    for j = 1:size(I,2)
        vx = vx+(2*Sx(i,j)*Sy(i,j));
        vy = vy+(Sx(i,j)^2+Sy(i,j)^2);
    end
end

angle = 0.5*atan(vx/vy);
 
if isnan(angle)
    angle = 0;
end

end

