Codebook
========
Codebook explains data from the tidy data set that was generated using the `run_analysis.R` code.

Variable list and descriptions
------------------------------

Variable name    | Description
-----------------|------------
subject          | ID the subject who performed the activity for each window sample. Its range is from 1 to 30.
activity         | Activity name
featDomain       | Feature: Time domain signal or frequency domain signal (Time or Freq)
featInstrument   | Feature: Measuring instrument (Accelerometer or Gyroscope)
featAcceleration | Feature: Acceleration signal (Body or Gravity)
featVariable     | Feature: Variable (Mean or SD)
featJerk         | Feature: Jerk signal
featMagnitude    | Feature: Magnitude of the signals calculated using the Euclidean norm
featAxis         | Feature: 3-axial signals in the X, Y and Z directions (X, Y, or Z)
featCount        | Feature: Count of data points used to compute `average`
featAverage      | Feature: Average of each variable for each activity and each subject

Dataset structure
-----------------


```r
str(tidyDataset)
```

```
## Classes ‘data.table’ and 'data.frame':	11880 obs. of  11 variables:
##  $ subject         : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ activity        : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ featDomain      : Factor w/ 2 levels "Time","Frequency": 1 1 1 1 1 1 1 1 1 1 ...
##  $ featAcceleration: Factor w/ 3 levels NA,"Body","Gravity": 1 1 1 1 1 1 1 1 1 1 ...
##  $ featInstrument  : Factor w/ 2 levels "Accelerometer",..: 2 2 2 2 2 2 2 2 2 2 ...
##  $ featJerk        : Factor w/ 2 levels NA,"Jerk": 1 1 1 1 1 1 1 1 2 2 ...
##  $ featMagnitude   : Factor w/ 2 levels NA,"Magnitude": 1 1 1 1 1 1 2 2 1 1 ...
##  $ featVariable    : Factor w/ 2 levels "Mean","SD": 1 1 1 2 2 2 1 2 1 1 ...
##  $ featAxis        : Factor w/ 4 levels NA,"X","Y","Z": 2 3 4 2 3 4 1 1 2 3 ...
##  $ count           : int  50 50 50 50 50 50 50 50 50 50 ...
##  $ average         : num  -0.0166 -0.0645 0.1487 -0.8735 -0.9511 ...
##  - attr(*, "sorted")= chr  "subject" "activity" "featDomain" "featAcceleration" ...
##  - attr(*, ".internal.selfref")=<externalptr> 
```


List the key variables in the data table
----------------------------------------


```r
key(tidyDataset)
```

```
## [1] "subject"          "activity"         "featDomain"       "featAcceleration" "featInstrument"   "featJerk"        
## [7] "featMagnitude"    "featVariable"     "featAxis"
```


Show a few rows of the dataset
------------------------------


```r
tidyDataset
```

```
##      subject activity featDomain featAcceleration featInstrument featJerk featMagnitude featVariable featAxis count
##  1:       1   LAYING       Time               NA      Gyroscope       NA            NA         Mean        X    50
##  2:       1   LAYING       Time               NA      Gyroscope       NA            NA         Mean        Y    50
##  3:       1   LAYING       Time               NA      Gyroscope       NA            NA         Mean        Z    50
##  4:       1   LAYING       Time               NA      Gyroscope       NA            NA           SD        X    50
##  5:       1   LAYING       Time               NA      Gyroscope       NA            NA           SD        Y    50
##         average
##  1:  -0.01655309
##  2:  -0.06448612
##  3:   0.14868944
##  4:  -0.87354387
##  5:  -0.95109044
          subject         activity featDomain featAcceleration featInstrument featJerk featMagnitude featVariable featAxis
## 11876:      30 WALKING_UPSTAIRS  Frequency             Body  Accelerometer     Jerk            NA           SD        X
## 11877:      30 WALKING_UPSTAIRS  Frequency             Body  Accelerometer     Jerk            NA           SD        Y
## 11878:      30 WALKING_UPSTAIRS  Frequency             Body  Accelerometer     Jerk            NA           SD        Z
## 11879:      30 WALKING_UPSTAIRS  Frequency             Body  Accelerometer     Jerk     Magnitude         Mean       NA
## 11880:      30 WALKING_UPSTAIRS  Frequency             Body  Accelerometer     Jerk     Magnitude           SD       NA
          count    average
## 11876:    65 -0.5615652
## 11877:    65 -0.6108266
## 11878:    65 -0.7847539
## 11879:    65 -0.5497849
## 11880:    65 -0.5808781
```


Summary of variables
--------------------


```r
summary(tidyDataset)
```

```
##    subject                   activity        featDomain   featAcceleration       featInstrument featJerk   
## Min.   : 1.0   LAYING            :1980   Time     :7200   NA     :4680     Accelerometer:7200   NA  :7200  
## 1st Qu.: 8.0   SITTING           :1980   Frequency:4680   Body   :5760     Gyroscope    :4680   Jerk:4680  
## Median :15.5   STANDING          :1980                    Gravity:1440                                     
## Mean   :15.5   WALKING           :1980                                                                     
## 3rd Qu.:23.0   WALKING_DOWNSTAIRS:1980                                                                     
## Max.   :30.0   WALKING_UPSTAIRS  :1980                                                                     
##   featMagnitude  featVariable featAxis      count          average        
## NA       :8640   Mean:5940    NA:3240   Min.   :36.00   Min.   :-0.99767  
## Magnitude:3240   SD  :5940    X :2880   1st Qu.:49.00   1st Qu.:-0.96205  
##                               Y :2880   Median :54.50   Median :-0.46989  
##                               Z :2880   Mean   :57.22   Mean   :-0.48436  
##                                         3rd Qu.:63.25   3rd Qu.:-0.07836  
##                                         Max.   :95.00   Max.   : 0.97451  

```


Save to file
------------

Save data table objects to a tab-delimited text file called `DatasetHumanActivityRecognitionUsingSmartphones.txt`.


```r
f <- file.path(path, "DatasetHumanActivityRecognitionUsingSmartphones.txt")
write.table(tidyDataset, "DatasetHumanActivityRecognitionUsingSmartphones.txt", sep = "\t", fileEncoding="ISO8859-1", row.names = FALSE)
```

