function [ vec ] = knn_classifier(train_feats, train_labels, test_feats)

vec = [];
k = 0;
nn = 10000000000; %nearest neighbor

[height,width] = size(test_feats);
[heightTrain, widthTrain] = size(train_feats);


for i = 1:height %test image
    for j = 1:heightTrain %train images
        for k = 1:width
            neigh = abs(test_feats(i, k)-train_feats(i, k)); %calculates difference
            if neigh < nn %if lower nn is found, assign new nn
               nn = neigh; 
               lab = train_labels(j, 1);
            end
        end
        vec = [vec,lab];
    end
    
    nn = 10000000000;
end

%vec = rot90(vec);

end