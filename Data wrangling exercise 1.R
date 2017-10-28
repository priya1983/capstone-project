library(tidyr)
library(dplyr)

refine_orig <- read.csv("C:/Users/priya/Desktop/Data science foundation - Springboard/R directory/DS Intro Capstone/refine_original.csv", header= TRUE,stringsAsFactors=FALSE)

summary(refine_orig)

refine_orig2<- separate(refine_orig,col=Product.code...number, into=c("Productcode", "prodnumber"),sep="-")

refine_orig2 <- unite(refine_orig2,full_address,address,city,country,sep = ",")
refine_orig2$company  <- tolower(refine_orig$company) 
refine_orig2$company  <- gsub("^ph.*","philips",refine_orig2$company)
refine_orig2$company  <- gsub("^fi.*","philips",refine_orig2$company)
refine_orig2$company  <- gsub("^ak.*","akzo",refine_orig2$company)
refine_orig2$company  <- gsub("^va.*","van houten",refine_orig2$company)
refine_orig2$company  <- gsub("^un.*","unilever",refine_orig2$company)

refine_orig2 <- mutate( refine_orig2, prodcat = if_else(Productcode == "p","Smartphone",
                                                        if_else(Productcode == "v","TV",
                                                                if_else(Productcode == "x","Laptop","Tablet")))) 

refine_orig2 <-  mutate( refine_orig2, company_philips = if_else(company == "philips", TRUE,FALSE),
                         company_akzo =  if_else(company == "akzo", TRUE,FALSE),
                         company_vanhouten =  if_else(company == "van houten", TRUE,FALSE),
                         company_uniliever =  if_else(company == "unilever", TRUE,FALSE),
                         product_smartphone = if_else(prodcat == "Smartphone", TRUE,FALSE),
                         product_TV = if_else(prodcat == "TV", TRUE,FALSE),
                         product_Laptop = if_else(prodcat == "Laptop", TRUE,FALSE),
                         product_Tablet = if_else(prodcat == "Tablet", TRUE,FALSE)
                         
)


write.csv(refine_orig2, file ="C:/Users/priya/Desktop/Data science foundation - Springboard/R directory/DS Intro Capstone/refine_clean.csv")

