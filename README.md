# Effect-of-analysis-window-and-feature-selection-on-classification-of-hand-movements-using-emg-signal
This is the code for the paper "Effect of Analysis Window and Feature Selection on Classification of Hand Movements Using EMG Signal". The repository contain two MATLAB scripts.
The first file "preprocessing_data_and_Extracting_fearures" preprocess the signal and extract the features and the second file "Code_for_shuffling_test_train_split" appends the 
true vale against the corresponding features values and then shuffles the feature values into test train split according to repetitions. 

The data from the dataset [1] is fed to the first code which will extract all the features. These extracted features are then used by the second script "Code_for_shuffling_test_train_split" whose output can then to deployed to classifier.   

The research paper can be find at https://doi.org/10.1007/978-3-030-55190-2_30

Use the following reference if you find this code helpful. 
Ullah, A., Ali, S., Khan, I., Khan, M. A., & Faizullah, S. (2020, September). Effect of analysis window and feature selection on classification of hand movements using emg signal. In Proceedings of SAI Intelligent Systems Conference (pp. 400-415). Springer, Cham.

[1] http://ninapro.hevs.ch/MeganePro



