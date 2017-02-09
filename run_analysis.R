##R Script to run analysis of UCI HAR dataset
##By Alan Roberts Feb. 8th 2017

## Read in training and test datasets
## X are the features, Y are the activities
xtrn<-read.table("train/X_train.txt")
ytrn<-read.table("train/Y_train.txt")
xtest<-read.table("test/X_test.txt")
ytest<-read.table("test/Y_test.txt")
subtest<-read.table("test/subject_test.txt")
subtrn<-read.table("train/subject_train.txt")

## Merge all test and training Xs, Ys and subjects into single files
xcomb<-rbind(xtrn,xtest)
ycomb<-rbind(ytrn,ytest)
subcomb<-rbind(subtrn,subtest)

## Read in feature names and apply them as column headers for the features (X) table
xcombname<-xcomb
feats<-noquote(levels(read.table("features.txt")[,2]))
colnames(xcombname)<-feats

## Choose those features which are means or stds
xcombmnssds<-xcombname[,grep("mean|std",tolower(feats))]
numobs<-dim(xcombmnssds)[2]

## Read in Action labels and translate code numbers into readable words
## And read in subject (person) labels
actlabels<-as.character(read.table("activity_labels.txt")[,2])
ycombacts<-as.character(factor(c(t(ycomb)),labels=c(actlabels),ordered=T))
sublabels<-as.numeric(levels(factor(t(subcomb),ordered=T)))

## Make summary table for means of each feature for each (subject,action) combination
summarytab<-matrix(0,length(actlabels)*length(sublabels),numobs)
sublb<-c(rep(" ",length(actlabels)*length(sublabels)))
actlb<-sublb

## Make column headers for new summary means table
mnfeats<-feats[grep("mean|std",tolower(feats))]
for(i in 1:length(mnfeats)){
  mnfeats[i]<-paste("mean(",mnfeats[i],")",sep="")
  i=i+1
}
## Populate summary means table
for (i in 1:length(sublabels)){
  for(j in 1:length(actlabels)){
    summarytab[(i-1)*length(actlabels)+j,]<-colMeans(xcombmnssds[subcomb==sublabels[i] & ycombacts==actlabels[j],])
    sublb[(i-1)*length(actlabels)+j]<-as.character(sublabels[i])
    actlb[(i-1)*length(actlabels)+j]<-actlabels[j]
  }
}

## Prepare and generate output
outtab<-as.table(cbind(sublb,actlb,summarytab))
colnames(outtab)<-c("Subject","Activity",mnfeats)
write.table(outtab,"outtable.txt",row.names=F,quote=F)
