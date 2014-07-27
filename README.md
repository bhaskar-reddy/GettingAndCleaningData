{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf200
{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 HelveticaNeue;\f2\fnil\fcharset0 Consolas;
}
{\colortbl;\red255\green255\blue255;\red38\green38\blue38;\red52\green110\blue183;\red11\green81\blue160;
\red100\green100\blue100;\red246\green246\blue246;}
{\*\listtable{\list\listtemplateid1\listhybrid{\listlevel\levelnfc0\levelnfcn0\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{decimal\}.}{\leveltext\leveltemplateid1\'02\'00.;}{\levelnumbers\'01;}\fi-360\li720\lin720 }{\listname ;}\listid1}
{\list\listtemplateid2\listhybrid{\listlevel\levelnfc0\levelnfcn0\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{decimal\}.}{\leveltext\leveltemplateid101\'02\'00.;}{\levelnumbers\'01;}\fi-360\li720\lin720 }{\listname ;}\listid2}
{\list\listtemplateid3\listhybrid{\listlevel\levelnfc23\levelnfcn23\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{disc\}}{\leveltext\leveltemplateid201\'01\uc0\u8226 ;}{\levelnumbers;}\fi-360\li720\lin720 }{\listname ;}\listid3}}
{\*\listoverridetable{\listoverride\listid1\listoverridecount0\ls1}{\listoverride\listid2\listoverridecount0\ls2}{\listoverride\listid3\listoverridecount0\ls3}}
\margl1440\margr1440\vieww17100\viewh11040\viewkind0
\deftab720
\pard\pardeftab720\sa300

\f0\b\fs76 \cf2 Project for Getting and Cleaning Data\
\pard\pardeftab720\sa300

\b0\fs30 \cf2 Author: Bhaskar Reddy (https://github.com/bhaskar-reddy/GettingAndCleaningData)\
\pard\pardeftab720

\b\fs60 \cf3 \
\pard\pardeftab720\sa300
\cf2 Parameters for the project\
\pard\pardeftab720

\f1\b0\fs28 \cf2 The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.\'a0 \
\
One of the most exciting areas in all of data science right now is wearable computing - see for example {\field{\*\fldinst{HYPERLINK "http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/"}}{\fldrslt \cf4 this article }}. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: \
\
\pard\pardeftab720
{\field{\*\fldinst{HYPERLINK "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"}}{\fldrslt \cf4 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones}} \
\
Here are the data for the project: \
\
\pard\pardeftab720
{\field{\*\fldinst{HYPERLINK "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"}}{\fldrslt \cf4 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip}} \
\
You should create one R script called run_analysis.R that does the following.\'a0\
\pard\tx220\tx720\pardeftab720\li720\fi-720
\ls1\ilvl0\cf2 {\listtext	1.	}Merges the training and the test sets to create one data set.\
{\listtext	2.	}Extracts only the measurements on the mean and standard deviation for each measurement.\'a0\
{\listtext	3.	}Uses descriptive activity names to name the activities in the data set\
{\listtext	4.	}Appropriately labels the data set with descriptive variable\'a0names.\'a0\
{\listtext	5.	}Creates a second, independent tidy data set with the average of each variable for each activity and each subject.\'a0\
\pard\pardeftab720
\cf2 \
Good luck!
\f0\fs30 \cf5 \
\pard\pardeftab720

\b\fs60 \cf3 \
\pard\pardeftab720\sa300
\cf2 Steps to reproduce this project\
\pard\tx220\tx720\pardeftab720\li720\fi-720
\ls2\ilvl0
\b0\fs30 \cf2 {\listtext	1.	}Assumption : the Samsung data must be placed in the working directory\
{\listtext	2.	}Open the R script 
\f2\fs24 \cb6 run_analysis.r
\f0\fs30 \cb1  from the working directory using a text editor.\
{\listtext	3.	}Change the parameter of the 
\f2\fs24 \cb6 setwd
\f0\fs30 \cb1  function call to the working directory/folder (i.e., the folder where these the R script file is saved).\
{\listtext	4.	}Run the R script 
\f2\fs24 \cb6 run_analysis.r
\f0\fs30 \cb1 . \
{\listtext	5.	}It will generate the 
\f2\fs24 \cb6 HumanActivityRecognitionUsingSmartphone.txt
\f0\fs30 \cb1  tidy data set as a tab delimited text file without row.names which can be read using the read.table() function.\
\pard\pardeftab720

\b\fs60 \cf3 \
\pard\pardeftab720\sa300
\cf2 Output produced\
\pard\tx220\tx720\pardeftab720\li720\fi-720
\ls3\ilvl0
\b0\fs30 \cf2 {\listtext	\'95	}Tidy dataset file 
\f2\fs24 \cb6 DatasetHumanActivityRecognitionUsingSmartphones.txt
\f0\fs30 \cb1  (tab-delimited text, without row names)
\fs24 \cf0 \
}