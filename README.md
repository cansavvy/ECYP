---
title: "ECYP Fellows and Alumni Database"
output: 
  flexdashboard::flex_dashboard:
    orientation: columns
    social: menu
    source_code: embed
runtime: shiny
---

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

Inputs {.sidebar}
-----------------------------------------------------------------------
```{r}
Masterfile <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1rQaqQIYLZw1tZnJZQHMNhTf0-zDRH2zWzA6Eo0giP80/edit#gid=1665986408')
#Delete a column
Masterfile <- Masterfile[ -c(2,14,18)]

#change column names
names(Masterfile) [1] <- "Class Year"
names(Masterfile) [2] <- "Unique_Number"
names(Masterfile) [3] <- "Full Name"
names(Masterfile) [4] <- "Address"
names(Masterfile) [5] <- "City State Zip"
names(Masterfile) [6] <- "Permanent Telephone"
names(Masterfile) [7] <- "Email"
names(Masterfile) [8] <- "High School"
names(Masterfile) [9] <- "Hs Grad Year"
names(Masterfile) [10] <- "College"
names(Masterfile) [11] <- "Grad Year"
names(Masterfile) [12] <- "Degree Major"
names(Masterfile) [13] <- "Grad School"
names(Masterfile) [14] <- "Grad School Year"
names(Masterfile) [15] <- "LinkedIN"
names(Masterfile) [16] <- "Employers"
## make a variable list
#variable_list <- names(Masterfile)[-2]
## pasting the unique number when typing it
#names(variable_list) <- paste("Enter", names(Masterfile)[-2])

##changing numeric column to character
Masterfile$Unique_Number <- as.character(Masterfile$Unique_Number)
Masterfile$`Class Year` <- as.character(Masterfile$`Class Year`)



```




```{r}
textInput("enter_number", label = h3("Enter your number"), value = "", placeholder = NULL)
selectInput("variable", "Choose which field to update Info:", colnames(Masterfile)[-2])

variable_list <- names(Masterfile)[-2]
## pasting the unique number when typing it
names(variable_list) <- paste("Enter", names(Masterfile)[-2])


##textoutput.. is for instructions.
## WHEN Entering your unique number, remember to Push " Enter" to access information.

#textOutput("Push Enter", container = if (inline) span else div, inline = FALSE)

 #textInput("txt", "Enter the text to display below:"),
      #textOutput("text"),


##textinput. one for each column



##add action button.



#take all information.
```

## Column

```{r}
# palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
#   "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

### changing horizontal to vertical
#t(Masterfile)

renderTable({
  dplyr::filter(Masterfile, Unique_Number == input$enter_number)
  
})
```

```{r}
selectInput("variable", "Choose which field to update Info:", colnames(Masterfile)[-2])
renderUI({
  field_text <- names(variable_list)[[which(variable_list == input$variable)]]
  textInput(paste0("new_", input$variable), field_text)
  
  
  
})
```


```{r}




```
