# Ghost-Fingerprint-Detection

## What's a ghost fingerprint?

A Ghost fingerprint occurs when a second unwanted fingerprint overlaps part (or even whole) of the primary or wanted fingerprint as shown in the image below.

<p align="center">
<img src="https://github.com/aishwaryamuthuvel/Ghost-Fingerprint-Detection/blob/main/Ghost_fingerprint_example.png" width=25% height=25% />
</p>

## Dataset

Real fingerprint image dataset provided by the Dutch police has been used for training and testing of the proposed system. The fingerprint images in the given dataset were labelled into 7 classes - class 0 to 6. Class 0 consists of fingerprints that are uncorrupted by any ghost fingerprints or any other contaminations. Fingerprint images that were highly affected by ghost prints were labelled as class 1. Classes 2-5 included proportionally less affected fingerprints with the least affected fingerprints labelled as class 5. Fingerprints that were contaminated by other than ghost fingerprints were labelled as class 6. There are a total of 4650 RGB images. Not all the images are of the same size and the images are not distributed equally within the classes. 

## Method

The proposed algorithm consists of three main subdivisions – Preprocessing, Feature Extraction and Classification. After the basic preprocessing steps, the fingerprint image is divided into image blocks. Features that are based on the local orientation, frequency and mean pixel intensity are extracted from each of the image blocks. The local orientation is calculated using the Sobel operator. Then the local ridge frequency is calculated based on the location orientation obtained. Fourier Transform is used to obtain the first and the second prominent frequencies and orientations. The difference in these prominent frequencies and orientations is used as a feature. The mean intensity of all the pixels that represent the ridges in the input fingerprint is also considered as a feature. The final step was to train classification models (Neural Networks, Random Forest and K-nearest Neighbors) on the features extracted to detect the presence of ghost prints in the input. 

### Image Pre-processing

<p align="center">
<img src="https://github.com/aishwaryamuthuvel/Ghost-Fingerprint-Detection/blob/main/Preprocessing.png" width=25% height=25% />
</p>





