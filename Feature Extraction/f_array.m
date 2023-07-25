N = dir('Ghost FP Dataset/Ghost FP labeled/0/*.jpg'); 
freq = zeros([24,25]);
orient = zeros([24,25]);
inten = zeros([24,25]);
e_features = zeros([length(N),13]); %feature array

e_features(:,end) = 1; %label

for i = 1:length(N)
    I = im2double(rgb2gray(imread(strcat(N(i).folder,'/',N(i).name))));
    r = (768-size(I,1))/2;
    c = (800-size(I,2))/2; 
    I = padarray(I,[floor(r) floor(c)],1,'pre');
    I = padarray(I,[ceil(r) ceil(c)],1,'post');
    
    level = graythresh(I);
    
    I_bw = double(imbinarize(I,level));
    
    s = [0,1,0;1,1,1;0,1,0];

    I_bw = imclose(imopen(I_bw,s),s);
    imshow(I_bw)

    [freq,orient,inten] = features(I,I_bw);
    
    s = strel('diamond',1);
    
    freq_e = imerode((freq~=0),s);
    orient_e = imerode((orient~=0),s);
    inten_e = imerode((inten~=0),s);
    freq_e = (freq~=0) - freq_e;
    orient_e = (orient~=0) - orient_e;
    inten_e = (inten~=0) - inten_e;
    
    freq = freq.*(freq_e==0);
    orient = orient.*(orient_e==0);
    inten = inten.*(inten_e==0);
    
    e_features(i,1) = sum(sum(imregionalmax(freq)))/sum(sum(freq~=0));
    e_features(i,2) = sum(sum(imregionalmax(orient)))/sum(sum(orient~=0));
    e_features(i,3) = mean(freq(freq~=0));
    e_features(i,4) = std(freq(freq~=0));
    e_features(i,5) = mean(orient(orient~=0));
    e_features(i,6) = std(orient(orient~=0));
    
    [f1,f2,o1,o2,f,o] = fft_features(I_bw);
    
    freq_e = imerode((f1~=0),s);
    orient_e = imerode((o1~=0),s);
    freq_e = (f1~=0) - freq_e;
    orient_e = (o1~=0) - orient_e;
    
    f1 = f1.*(freq_e==0);
    o1 = o1.*(orient_e==0);
    
    e_features(i,7) = mean(f(f1~=0));
    e_features(i,8) = std(f(f1~=0));
    e_features(i,9) = mean(o(o1~=0));
    e_features(i,10) = std(o(o1~=0));
    e_features(i,11) = mean(inten(inten~=0));
    e_features(i,12) = std(inten(inten~=0));
    
end
