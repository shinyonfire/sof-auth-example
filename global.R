library(shiny)
library(shinyjs)
library(DT)

# read list of authorized users
auth_users <- readr::read_csv("authorized_users.csv")
