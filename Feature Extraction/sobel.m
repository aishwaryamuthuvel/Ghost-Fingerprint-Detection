function [opx,opy] = sobel(I)
hx = [1 0 -1;2 0 -2;1 0 -1]; 
hy = [1 2 1;0 0 0;-1 -2 -1];

B = zeros(size(I)+[2 2]);
B(2:end-1,2:end-1) = I;
B(1,2:end-1)=I(1,:);
B(end,2:end-1)=I(end,:);
B(2:end-1,1)=I(:,1);
B(2:end-1,end)=I(:,end);
B(1,1) = I(1,1);
B(end,1) = I(end,1);
B(end,end) = I(end,end);
B(1,end) = I(1,end);


opx = zeros(size(I));
opy = zeros(size(I));

for i=2:size(B,1)-1
    for j=2:size(B,2)-1
        %Sobel mask for x-direction:
        opx(i-1,j-1) = sum(sum(B(i-1:i+1,j-1:j+1).*hx));
        %Sobel mask for y-direction:
        opy(i-1,j-1) = sum(sum(B(i-1:i+1,j-1:j+1).*hy));
     
    end
end
end

