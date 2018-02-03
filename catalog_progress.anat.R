## Here I'm going to begin to catalog the progress of understanding recurrent high grade gliomas, where we are in processing all of these. 

## First I downloaded the demographics data from Braino on Jan 22 2018; I chose "Presugery Demographics Report" and REC_HGG as the study 
## It is in the directory /lupo/analysis/catalog_progress, under the name "rechgg_demographics_012218" 
## I opened the file & saved it as a .csv file so that I could read it into here. 

demographics = read.csv("/Users/juliacluceru/Box Sync/lupo/analysis/catalog_progress/rechgg_demographics_012218.csv")
View(demographics)
dim(demographics)
# [1] 314 19 

## I want to get rid of duplicated data, so I will use the tnumber to eliminate duplicates. The SF number might be different, but that doesn't matter. 
duplicated_tnum = duplicated(demographics$t_number) # list of duplicated tnums 
demographics_nodup=demographics[!duplicated_tnum, ] # dataframe w/ no duplicated items 
dim(demographics_nodup)
# [1] 106 19 

## I want to read in an updated version of my REC_HGG & see if there are any missing bnum/tnum combos from new scans, and if I'm missing some, annotate why. 
rechgg = read.csv("/Users/juliacluceru/Box Sync/lupo/analysis/catalog_progress/REC_HGG_012218.csv")
View(rechgg)

as.character(rechgg$tnumber) %in% as.character(demographics_nodup$t_number)
as.character(demographics_nodup$t_number) %in% as.character(rechgg$tnumber)

## see note in Evernote for what I did; but basically just went through and added all the missing values from the downloaded demographics data into the REC_HGG file I have on 
## google sheets; therefore I now have updated bnum/tnum stuff & what's been acquired on scanner; now let's also make a sheet annotating what's been done in terms of 
## the processing of images & their workflow 

newrechgg =  read.csv("/Users/juliacluceru/Box Sync/lupo/analysis/catalog_progress/REC_HGG_012418.csv")
View(newrechgg)
dim(newrechgg)
# [1] 108  36
newrechgg=newrechgg[order(newrechgg$tnum),]
demographics_nodup=demographics_nodup[order(demographics_nodup$t_number),]

table(as.character(demographics_nodup$t_number) %in% as.character(newrechgg$tnumber))

newrechgg_include=newrechgg[newrechgg$Include==1,]
dim(newrechgg_include)
# [1] 88 36 






