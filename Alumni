---
title: "ECYP Fellows and Alumni Database"
output: 
  flexdashboard::flex_dashboard:
    orientation: columns
    social: menu
    source_code: embed
runtime: shiny
---

Inputs {.sidebar}
-----------------------------------------------------------------------

```{r}
 textInput("enter_number", label = h3("Enter your number"), value = "", placeholder = NULL)
 * this code brings down Enter"



## find a code to return a enter number to help search for the unique number. %>%

### once i find that code save it to the database and use filter()

#"filter( "return_code"" %in% "Unique Number")

```
##Loading the Packages and libraries
```{r global, include=FALSE}
# load data in 'global' chunk so it can be shared by all users of the dashboard
# install.packages("dplyr")
# install.packages("ggplot2")
# install.packages("tidyverse")
# install.packages("tidyr")
# install.packages("flexdashboard")
# install.packages('DT')
# install.packages("gsheet")

library(dplyr)
library(readr)
library(gsheet)
library(tidyverse)
library(ggplot2)
library(datasets)
library(data.table)
library(gsheet)
library(shiny)
library(DT)
```


Set up the data pulling the file down

```{r}
Masterfile <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1rQaqQIYLZw1tZnJZQHMNhTf0-zDRH2zWzA6Eo0giP80/edit#gid=1665986408')

#Deleting the same column

Masterfile <- Masterfile[ -c(2)]

#change column names
names(Masterfile) [1] <- "Class Year"
names(Masterfile) [2] <- "Unique Number"
names(Masterfile) [3] <- "Full Name"
names(Masterfile) [4] <- "Address"
names(Masterfile) [5] <- "City State Zip"
names(Masterfile) [7] <- "Permanent Telephone"
names(Masterfile) [8] <- "Email"
names(Masterfile) [9] <- "High School"
names(Masterfile) [10] <- "Hc Grad Year"
names(Masterfile) [11] <- "College Post Grad School"
names(Masterfile) [12] <- "Grad Year"
names(Masterfile) [13] <- "Degree Major"
names(Masterfile) [14] <- "Last Updated"
names(Masterfile) [15] <- "Grad School"
names(Masterfile) [16] <- "Grad School Year"
names(Masterfile) [17] <- "LinkedIN"
names(Masterfile) [18] <- "Notes"
names(Masterfile) [19] <- "Employers"



```

## Column {.sidebar}
### this will be on the side where people can enter and update their information.
```{r}
renderUI({
  textInput("full_name",'Enter Your name')
  textInput("Unique_Number",'Enter Your number')
  textInput("email",'Enter Your email')
  textInput("address", 'Enter your address')
  textInput("city_state_zip", 'Enter Your city, state, and zip')
  textInput("permanent_telephone", 'Enter your Telephone')
  textInput("Highschool", 'Enter Highschool')
  textInput("hc_grad_year",'Highschool Grad Year')
  textInput("college_post_grad",'College Grad year')
  textInput("degree-major",'Enter your degree or major')
  textInput("Grad_school",'Enter your Grad School')
  textInput("Grad_school_date",'Enter Grad School Date.')
  textInput("linkedin",'Enter your Linkedin.')
  textInput("notes",'Add extra notes')
  textInput("employer",'Update work History')
})
```

## Column 
## this is to help create the data table 
## i am attempting to create a data table to help alumni type go in a type their uniquee number in. Once that happens then 
## they can see their information and update it.

```{r}

#Masterfile_subset <- Masterfile[, 1:5]

# palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
#   "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))


## i keep getting an "Output" not found so i assigned to the Masterfile to try and solve this matter.

output=data.frame(Masterfile)


if (input$UniqueNumber != "All") {
master_data <- Masterfile[Masterfile$UniqueNumber == input$UniqueNumber,]
}
## i tried creating a rendertable to help with this table but i dont understand where the error is going wrong. maybe the output?

# mastefile_subst <-renderTable({
#   DT::datatable(
#       dplyr::filter(Masterfile_subset, Unique_number == output$enter_number,
#       options = list(
#         scrollY="100vh",
#         scrollCollapse = FALSE
#       )
#     ))}
# )


##another way of me trying my code.
output$masterfile_subset <- renderTable({
 Masterfile_subset
})

## this makes the table more clearer for the code below


tableOutput("Mastefile_subset")
##this is how the user will see their information.

input <- Masterfile
```

## this next column is to create
##Creating a shinyapps.io account for ECYP here: https://www.shinyapps.io/
#Deploying the app with the rsconnect package: https://cran.r-project.org/web/packages/rsconnect/index.html

```{r}














```
