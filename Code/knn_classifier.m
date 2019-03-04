function [ vec ] = knn_classifier(train_feats, train_labels, test_feats)

vec = [];
k = 3;
nn = 10000000000; %nearest neighbor
nns = [];
diff = 0;
index = 0;
indices = [];
freq = zeros(1,16);

[height,width] = size(test_feats);
[height_train,~] = size(train_feats);


for h = 1:height %test image, go through each test image
    for i = 1:height_train %train image, this goes through each train image
        for j = 1:width
            neigh = abs(test_feats(h, j)-train_feats(i, j)); %calculates difference 
            diff = diff + neigh;
        end
        if diff < nn %if lower nn is found, assign new nn
            nn = diff; 
            index = i;
            indices = [indices, index];
        end
    diff = 0;
    end
    
    %index iteration here
    
    indices = flip(indices);
    
    it = 1;
    
    for x = 1:length(indices)
        it = it+1;
        indices(x) = floor(indices(x)/100)+1;
        indices(x);
        if it <= k
            freq(indices(x)) = freq(indices(x)) + 1;
        end
    end
    
    [lab_val, nn_index] = max(freq);
    nn_index = (nn_index*100);
    lab = train_labels(nn_index, 1);
    vec = [vec;lab];
    
    indices = [];
    freq = zeros(1,16);
    
    index = 0;
    nn = 10000000000;
end

%vec = rot90(vec);

end

