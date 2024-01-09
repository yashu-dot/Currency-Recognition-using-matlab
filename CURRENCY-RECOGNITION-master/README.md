# Currency Recognition using MATLAB


Compute an edge orientation histogram for RGB images, which categorizes edges into one of five orientations: horizontal, vertical, two diagonals (45° and 135°), and non-directional.

## Overview

The `edgehist.m` function processes an RGB image and provides a 1x5 histogram representing the distribution of edge orientations. The primary steps include converting the RGB image to the YCbCr color space, applying Sobel-like filters for edge detection in the specified orientations, using the Canny edge detector to refine the edge map, and finally computing the histogram.

## Features

- **RGB to YCbCr Conversion**: Only the luminance (Y) channel is used for processing.
  
- **5 Defined Filters for Edge Detection**: Filters for vertical, horizontal, 45° diagonal, 135° diagonal, and non-directional edges.
  
- **Max Sobel Gradient Calculation**: Determines the strongest edge orientation for each pixel.

- **Canny Edge Detection**: Refines the edges detected using the Sobel-like filters.

- **Histogram Computation**: Outputs a histogram that categorizes the edge orientations.

## Prerequisites

Ensure that MATLAB's Image Processing Toolbox is installed, as the code uses specific functions from this toolbox.

## Usage

1. Clone this repository:
    ```bash
    git clone [YOUR REPOSITORY LINK]
    cd [YOUR REPOSITORY FOLDER NAME]
    ```

2. In MATLAB, navigate to the directory containing the `edgehist.m` function.

3. Use the function as follows:
    ```matlab
    img = imread('path_to_rgb_image.jpg');
    histogram = edgehist(img);
    ```

## Example

Suppose you have an RGB image named 'example.jpg' in your MATLAB directory. To compute its edge histogram:

```matlab
img = imread('example.jpg');
histogram = edgehist(img);
disp(histogram);
