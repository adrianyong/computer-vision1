function [ vec ] = knn_classifier(train_feats, train_labels, test_feats)

vec = [];
k = 0;
nn = 10000000000; %nearest neighbor
cum_sum = 0;

[height,width] = size(test_feats);
[height_train,~] = size(train_feats);


for h = 1:height %test image, go through each test image
    for i = 1:height_train %train image, this goes through each train image
        for j = 1:width
            neigh = abs(test_feats(h, j)-train_feats(i, j)); %calculates difference 
            cum_sum = cum_sum + neigh;
        end
        if cum_sum < nn %if lower nn is found, assign new nn
            nn = cum_sum; 
            lab = train_labels(i, 1);
        end
    vec = [vec;lab];
    cum_sum = 0;
    end
    nn = 10000000000;
end

%vec = rot90(vec);

end