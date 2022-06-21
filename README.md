# ECYP

## Summary
Put a summary of your project here.

## How to re-run
1. Open the `eycp-database.Rmd` file in RStudio.
2. Click the `Run Document` button.
3. A new window with your resulting page should pop up.

## How to publish a new version to Shiny
You'll need access to the Shiny account: https://www.shinyapps.io/

Install the `rsconnect` package `install.packages("rsconnect")`. 

On Shinyapps account dashboard, go to `Accounts` > `Tokens` and find the token used for this account. 

Click `Show`, then `Show secret` and copy to your clipboard. 

Paste that command into the Console of your RStudio and click Enter. 
Your Rstudio should be linked to the app. 

Now you can click the swirly blue button in the right top corner of your RStudio page and publish. 

Make sure to choose the Rmd and all the files in the `.secrets` folder. 
Click `Publish`. When it is done publishing it will pop up the app in your browser and you can test it. 
