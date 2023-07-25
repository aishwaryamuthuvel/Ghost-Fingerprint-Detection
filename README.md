# Ghost-Fingerprint-Detection

## What's a ghost fingerprint?

A Ghost fingerprint occurs when a second unwanted fingerprint overlaps part (or even whole) of the primary or wanted fingerprint as shown in the image below.







In this work, an algorithm is proposed to detect the presence of ghost prints in an input fingerprint image. The algorithm consists of three main subdivisions – Preprocessing, Feature Extraction and Classification. After the basic preprocessing steps, the fingerprint image is divided into image blocks. Features that are based on the local orientation, frequency and mean pixel intensity are extracted from each of the image blocks. The local orientation is calculated using the Sobel operator. Then the local ridge frequency is calculated based on the location orientation obtained. Fourier Transform is used to obtain the first and the second prominent frequencies and orientations. The difference in these prominent frequencies and orientations is used as a feature. The mean intensity of all the pixels that represent the ridges in the input fingerprint is also considered as a feature. The final step was to train classification models (Neural Networks, Random Forest and K-nearest Neighbors) on the features extracted to detect the presence of ghost prints in the input. 



