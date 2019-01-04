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

