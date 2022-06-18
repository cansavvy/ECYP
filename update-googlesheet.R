

library(optparse)

spreadsheet_url <- "https://docs.google.com/spreadsheets/d/14KYZA2K3J78mHVCiWV6-vkY6it37Ndxnow1Uu7nMa80/edit#gid=0"

################################ Set up options ################################
# Set up optparse options.
option_list <- list(
  make_option(
    opt_str = c("-n", "--new_value"), type = "character",
    default = NULL, help = "New value to be saved",
    metavar = "character"
  )
)

# Parse options
opt <- parse_args(OptionParser(option_list = option_list))

# This function gets the sheet_id from the url provided
get_sheet_id <- function(sheet_url) {
  # This is the hard-coded in url to the Alumni Master File that the data is kept in.
  sheet_url <- "https://docs.google.com/spreadsheets/d/1rQaqQIYLZw1tZnJZQHMNhTf0-zDRH2zWzA6Eo0giP80/edit#gid=1665986408"
  googledrive::drive_auth(cache = gargle::gargle_oauth_cache(), email = TRUE)
  
  googlesheets4::gs4_auth(
    email = "cansav09@gmail.com",
    scopes = c("https://www.googleapis.com/auth/spreadsheets", "https://www.googleapis.com/auth/drive"),
    cache = gargle::gargle_oauth_cache(),
    use_oob = TRUE
  )
  sheet_id <- googledrive::drive_get(id = sheet_url)$id
  return(sheet_id)
}

# This function reads the googlesheet from online
refresh_db <- function(sheet_url) {
  # This is the hard-coded in url to the Alumni Master File that the data is kept in.
  sheet_url <- "https://docs.google.com/spreadsheets/d/1rQaqQIYLZw1tZnJZQHMNhTf0-zDRH2zWzA6Eo0giP80/edit#gid=1665986408"
  
  # Read in sheet
  ecyp_db_org <- gsheet::gsheet2tbl(sheet_url) %>%
    data.frame() %>%
    dplyr::mutate_all(as.character)
  
  return(ecyp_db_org)
}

# This function takes the googlesheet and sets up the table the user will see
refresh_table <- function(sheet_url) {
  # This is the hard-coded in url to the Alumni Master File that the data is kept in.
  sheet_url <- "https://docs.google.com/spreadsheets/d/1rQaqQIYLZw1tZnJZQHMNhTf0-zDRH2zWzA6Eo0giP80/edit#gid=1665986408"
  ecyp_db_org <- refresh_db(sheet_url)
  
  # Delete a column
  ecyp_db <- ecyp_db_org %>%
    dplyr::select(-Name_Original, -Notes)
  
  return(ecyp_db)
}

sheet_url <- "https://docs.google.com/spreadsheets/d/1glmt1ccNbdjFzWCEOK3nX8GeMAkxCU_R94MMslIEXAU/edit#gid=1665986408"

sheet_id <- get_sheet_id(sheet_url)
ecyp_db_org <- refresh_db(sheet_url)

ecyp_db_org[which(ecyp_db_org$Unique_Number == enter_number()), variable_choice()] <-
  as.character(opt$new_value)

ecyp_db_org[which(ecyp_db_org$Unique_Number == enter_number()), ]$Last_Updated <- as.character(Sys.time())

drive_auth(cache = gargle::gargle_oauth_cache(), email = TRUE)

gs4_auth(
  email = "cansav09@gmail.com",
  scopes = c("https://www.googleapis.com/auth/spreadsheets", "https://www.googleapis.com/auth/drive"),
  cache = gargle::gargle_oauth_cache(),
  use_oob = TRUE
)

sheet_write(
  data = ecyp_db_org,
  ss = sheet_id,
  sheet = "Master Spreadsheet"
)