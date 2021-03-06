# A-Novel-Geometrical-Method-for-Depression-Diagnosis-Based-on-EEG-Signals
Source codes for the "paper A Novel Geometrical Method for Depression Diagnosis Based on EEG Signals"

## To use:
1. Clone the repo.

2. Add the .m files to your directory.

3. Call the functions on your time_series data.


## example usage of the codes:

```matlab
 time_series = rand(1, 500);
 
 [out rad_der r] = InRadius(time_series, 1);
 
 disp(out)
 
 plot(r)
 
 figure;plot(rd)
```
 %%%%%%%%%%%%%%%
 ```matlab
 time_series = rand(1, 500);
 
 [out Censeq] = Cen45(time_series, 1);
 
 disp(out)
 
 plot(D)
```
 %%%%%%%%%%%%%%%
 ```matlab
 time_series = rand(1,500);
 
 [out CCseq] = CCdis(time_series, 1)

 
 disp(out)
 
 plot(CCseq)
 ```
 %%%%%%%%%%%%%%
 
### a brief abstract form the study:

The aim of this study is to provide a low time consuming non-linear technique for short duration EEG signals, which are complex and non-linear in general. Forty subjects (20 depressed, 20 normals) were included in this study. EEG was recorded with a bipolar montage and a sampling frequency of 256HZ. Each recording consisted of a 5 min recording with eyes open and closed. One Thousand and five hundred samples were selected from each subject for further analysis. Several novel methods are proposed in this study: Centroid to Centroid Distance, Centroid to 45-degree line shortest Distance, Incenter Radius, all built on different aspects of distance in Cartesian space. Based on student's t-test all of the features were found statistically significant (p<0.0001). The depressed group showed higher values in all features compared to the healthy group. Also, all of the features were more distinct in the right hemisphere. According to this study, the proposed methods are viable for diagnosis of depression in short-termed EEG signals.

Please kindly cite the article in the provided link if you find the methods useful to your application.
