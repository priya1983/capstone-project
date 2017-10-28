titanic_orig <- read.csv("C:/Users/priya/Desktop/Data science foundation - Springboard/R directory/DS Intro Capstone/titanic_original.csv", header= TRUE,stringsAsFactors=FALSE)

summary(titanic_orig)
meanage <- round (mean(titanic_orig$age,na.rm=TRUE),digits = 1)
titanic_orig <- mutate( titanic_orig, has_cabin_number = TRUE)

for (row in 1:nrow(titanic_orig))
  
{ 
  if( titanic_orig[row,"embarked"] == "") {
    titanic_orig[row,"embarked"] <- "S"
  }
  
}
for (row in 1:nrow(titanic_orig))
{
  if (is.na(titanic_orig[row,"age"])== TRUE) {
    titanic_orig[row,"age"] <-meanage
  }
}
for (row in 1:nrow(titanic_orig))
{
  
  if (  (is.na(titanic_orig[row,"boat"])== 1 ) | (titanic_orig[row,"boat"]== "")  ) {
    titanic_orig[row,"boat"] <- "Nothing"
  } 
}
for (row in 1:nrow(titanic_orig)) 
{  
  titanic_orig[row,"has_cabin_number"] <- TRUE
  if  ( (is.na(titanic_orig[row,"cabin"])== 1)| ( titanic_orig[row,"cabin"]== "") ){
    titanic_orig[row,"has_cabin_number"] <- FALSE
  }  
}

summary (titanic_orig)

write.csv(titanic_orig, file ="C:/Users/priya/Desktop/Data science foundation - Springboard//R directory/DS Intro Capstone/titanic_clean.csv")
