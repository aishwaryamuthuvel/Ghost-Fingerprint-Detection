# Ghost-Fingerprint-Detection

## What's a ghost fingerprint?

A Ghost fingerprint occurs when a second unwanted fingerprint overlaps part (or even whole) of the primary or wanted fingerprint as shown in the image below. A detailed report on the proposed method for ghost fingerprint detection could be found [here](https://github.com/aishwaryamuthuvel/Ghost-Fingerprint-Detection/blob/main/Intro_Biometrics%20-%20Ghost%20Fingerprint%20Detection.pdf).

<p align="center">
<img src="https://github.com/aishwaryamuthuvel/Ghost-Fingerprint-Detection/blob/main/Ghost_fingerprint_example.png" width=25% height=25% />
</p>

## Dataset

Real fingerprint image dataset provided by the Dutch police has been used for training and testing of the proposed system. The fingerprint images in the given dataset were labelled into 7 classes - class 0 to 6. Class 0 consists of fingerprints that are uncorrupted by any ghost fingerprints or any other contaminations. Fingerprint images that were highly affected by ghost prints were labelled as class 1. Classes 2-5 included proportionally less affected fingerprints with the least affected fingerprints labelled as class 5. Fingerprints that were contaminated by other than ghost fingerprints were labelled as class 6. There are a total of 4650 RGB images. Not all the images are of the same size and the images are not distributed equally within the classes. 

## Method

The proposed algorithm consists of three main subdivisions – Preprocessing, Feature Extraction and Classification. After the basic preprocessing steps, the fingerprint image is divided into image blocks. Features that are based on the local orientation, frequency and mean pixel intensity are extracted from each of the image blocks. The local orientation is calculated using the Sobel operator. Then the local ridge frequency is calculated based on the location orientation obtained. Fourier Transform is used to obtain the first and the second prominent frequencies and orientations. The difference in these prominent frequencies and orientations is used as a feature. The mean intensity of all the pixels that represent the ridges in the input fingerprint is also considered as a feature. The final step was to train classification models (Neural Networks, Random Forest and K-nearest Neighbors) on the features extracted to detect the presence of ghost prints in the input. 

### Image Pre-processing
Below are the image pre-processing steps and a corresponding flowchart.
* For the proposed analysis only grayscale and binary versions of the image were required. Thus as the first preprocessing step, the input RGB image was converted into a grayscale image that had intensity values in the range [0 1].
* Non-uniform image sizes in the dataset were addressed by padding 1 (analogous to the white backgrounds) to the images. All the images were brought to a uniform size of 768x800. 
* The next step was to binarize the input images. Otsu’s method was used to compute the threshold value.
* The binary image is then morphologically opened and closed to remove unwanted discontinuities and noise. 

<p align="center">
<img src="https://github.com/aishwaryamuthuvel/Ghost-Fingerprint-Detection/blob/main/Preprocessing.png" width=75% height=75% />
</p>

### Feature Extraction
The presence of ghost fingerprints is mainly characterized by the changes in ridge frequency, orientation and pixel intensity values. The intensity values of the pixels that form the ridges are directly obtained from the grayscale image and the ridge frequency and orientation were calculated using two methods - Sobel operator and Fast Fourier Transform (FFT). 

The preprocessed grayscale and binary versions of the input image are divided into image blocks of size 32x32 and the following five local features were extracted from each image block – ridge frequency and orientation obtained using the Sobel operator, the difference between the first and second prominent frequencies and orientations obtained from Fourier Transform and mean ridge pixel intensity. The mean and standard deviation of the above mentioned five local features were used to form the feature array.

<p align="center">
<img src="https://github.com/aishwaryamuthuvel/Ghost-Fingerprint-Detection/blob/main/Feature_extraction.png" width=100% height=75% />
</p>

### Classification Model

Three classification models were trained – Neural Networks, Random Forrest and K-nearest Neighbor with a split of 80-10-10 for training, validation and testing. Below is the table with the performance of the models.

<p align="center">
<img src="https://github.com/aishwaryamuthuvel/Ghost-Fingerprint-Detection/blob/main/Results.png" width=50% height=50% />
</p>









