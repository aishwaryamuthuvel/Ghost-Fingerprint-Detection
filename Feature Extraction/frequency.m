function freq = frequency(I,angle)

x = zeros([41,1]);
y = zeros([41,1]);
x(1) = 16;
y(1) = 16;
for i = 2:21
    x(i) = x(i-1) + cos(angle);
    y(i) = y(i-1) + sin(angle);
    x(i+20) = x(1) - (i-1)*cos(angle);
    y(i+20) = y(1) - (i-1)*sin(angle);
end

x = sort(x);
y = sort(y);
x = round(x,4);
y = round(y,4);
[X,Y]=meshgrid(1:size(I,1),1:size(I,2));
V = interp2(X,Y,I,x,y,'linear');
V = V(~isnan(V));
lmaxima = islocalmax(V,'FlatSelection','first');
lminima = islocalmin(V,'FlatSelection','first');

% xaxis = [1:length(V)];
% figure
% plot(xaxis, V,xaxis(lmaxima),V(lmaxima),'r*',xaxis(lminima),V(lminima),'b*');
% xlabel('Points along Line')
% ylabel('Pixel intensity value')
% 
% figure
% imshow(I)
% hold on
% plot(x,y,'LineWidth',1.5)

freq = (length(V(lmaxima))+length(V(lminima)))/2;
end

