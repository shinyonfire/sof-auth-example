# Example using Firebase Authentication with Shiny

In this Shiny app we use the default Bootstrap css provided with Shiny, and we use Firebase's email/password
authentication.  Additional information available in [the blog post](https://www.tychobra.com/posts/2019-01-03-firebasse-auth-wtih-shiny/). 

## Steps to Run this App Locally 

1. download or clone this repository
2. Create a [Firebase](https://firebase.google.com/) account, and in your new account create a project 
3. In your new Firebase project enable the email password authentication provider.  This is the screen where you enable authentiation:
![](https://res.cloudinary.com/dxqnb8xjb/image/upload/v1546446242/firebase-auth-screenshot_rdn9sr.png)
4. Click the "Web Setup" button (top right in above screenshot) and copy your project's "apiKey", "authDomain", and "projectId" into the object defined in line 3 of the file "www/sof-auth.js"
5. Run the Shiny app

## Adding authorization after authentication

This capability has been added to the csv-authorization branch of the repo. 

Using this implementation enables authorization for specific users after the e-mail firebase authentication step. The app blocks users which are authenticated but are not authorized, i.e., only users which their e-mail appears in the file `authorized_users.csv` are allowd to access the app. Unauthorized users will see an error message _You are not authorized to use this app_ (file `not-authorized.R` in /sof-auth directory).

Edit/add emails to the file `authorized_users.csv` to authorize users. Note that authorized users will still need to go through the firebase registration process.