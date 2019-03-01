function [ vec ] = allDifferences()

database_dir = 'C:\Users\ayong\Documents\computer-vision-cw1\swaindatabase\testset';

cd(database_dir)
test_list = dir(fullfile(database_dir, '*.bmp'));

database_dir2 = 'C:\Users\ayong\Documents\computer-vision-cw1\swaindatabase';

cd(database_dir2)
train_list = dir(fullfile(database_dir2, '*.bmp'));

vec = [];

for i = 1:length(test_list)

    test_file = fullfile(database_dir, test_list(i).name);
    test_im = imread(test_file); %test image
    chist_test = generateColourHistogram(test_im);
    
    %imshow(test_im)
    
    for j = 1:length(train_list)
        train_file = fullfile(database_dir2, train_list(j).name);
        train_im = imread(train_file); %train image
        chist_train = generateColourHistogram(train_im);
        dif = chist_train-chist_test;
        value = sum(abs(sum(dif)));
        vec = [vec, value];
        
        if(value < 615)
            %figure
            %imshow(train_im)
            %pause(5)
        end
    end
    
end

vec = sort(vec);

end

