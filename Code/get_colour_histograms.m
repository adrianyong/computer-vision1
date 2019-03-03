function [ vec ] = get_colour_histograms(database_dirs)
vec = [];

files = database_dirs;

for i = 1:length(files)

    test_file = fullfile(files{i});
    test_im = imread(test_file); %test image
    chist_test = generateColourHistogram(test_im);
    value = chist_test;
    vec = [vec, value];

end

vec = rot90(vec);

end

