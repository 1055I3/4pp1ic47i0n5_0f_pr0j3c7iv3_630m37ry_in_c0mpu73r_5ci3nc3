function [panorama] = make_panorama(img1,img2)
%make_panorama Makes panorama from the given images
%   Takes two images on the input and returns panorama

img1g = im2gray(img1);
img2g = im2gray(img2);

img1_size = size(img1g);
img2_size = size(img2g);

% find and match characteristic points
pts1 = detectSIFTFeatures(img1g);
pts2 = detectSIFTFeatures(img2g);

[ftrs1, key_pts1] = extractFeatures(img1g, pts1);
[ftrs2, key_pts2] = extractFeatures(img2g, pts2);

correspondences = matchFeatures(ftrs1, ftrs2, 'Unique', true);

matched_points1 = key_pts1(correspondences(:, 1), :);
matched_points2 = key_pts2(correspondences(:, 2), :);

H = estgeotform2d(matched_points1, matched_points2, 'projective', 'MaxNumTrials', 15451', 'Confidence', 99.99);

% find panorama dimensions
[xlim(1,:), ylim(1,:)] = deal([1 img1_size(1)], [1 img1_size(2)]);
[xlim(2,:), ylim(2,:)] = outputLimits(H, [1 img2_size(2)], [1 img2_size(1)]);

max_img_size = max(img1_size, img2_size);

x_min = min([1; xlim(:)]);
x_max = max([max_img_size(2); xlim(:)]);

y_min = min([1; ylim(:)]);
y_max = max([max_img_size(1); ylim(:)]);

width  = round(x_max - x_min);
height = round(y_max - y_min);

% make panorama
panorama = zeros([height width 3], 'like', img1);
panorama(1:img1_size(1), 1:img1_size(2), :) = img1;

blender = vision.AlphaBlender('Operation', 'Binary mask', 'MaskSource', 'Input port');  

% create a 2-D spatial reference object defining the size of the panorama
x_limits = [x_min x_max];
y_limits = [y_min y_max];
panorama_view = imref2d([height width], x_limits, y_limits);

% transform img2 into the panorama
warped_image = imwarp(img2, H, 'OutputView', panorama_view);
                  
% generate a binary mask
mask = imwarp(true(img2_size(1), img2_size(2)), H, 'OutputView', panorama_view);

% overlay the warped_image onto the panorama
panorama = step(blender, panorama, warped_image, mask);

end