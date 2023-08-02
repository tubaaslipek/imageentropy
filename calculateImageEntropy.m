function entropyValue = calculateImageEntropy(image)
    % Convert the image to grayscale if it's a color image
    if size(image, 3) > 1
        image = rgb2gray(image);
    end

    % Calculate the histogram of the image
    [pixelCounts, ~] = imhist(image);

    % Calculate the probability distribution of pixel intensities
    totalPixels = numel(image);
    pixelProbabilities = pixelCounts / totalPixels;

    % Remove zero probabilities to avoid log(0) issues
    pixelProbabilities(pixelProbabilities == 0) = [];

    % Calculate the entropy
    entropyValue = -sum(pixelProbabilities .* log2(pixelProbabilities));
end