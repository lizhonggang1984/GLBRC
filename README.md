
# GLBRC

> GLBRC Board is a web app based on Rails 

## Framework

* Ruby 2.6.5
* Ruby on Rails 6.0.3
* bootstrap 4
* js
* SQLite3


## Depedency

Rails 6.0.3

## Preparation

*  Install All Dependency: $ bundle install

*  Migrate Database: $ rake db:migrate

*  Start Server: $ rails server 

*  Visit The App Through Explorer at http://localhost:3000

## Login   
1. login: user1/user2/user3, password: glbrcpass
2. if wrong password or wrong username, will stay in login page

## Home Page Panel
1. All apps are currently shown for all users for first time login
2. On the top left of homepage, it shows the current user login
3. On the top right of homepage, it shows the option to see current user information 
4. On the top right of homepage, it also shows the logout option.
5. In the middle of the homepage, all apps are shown
6. On the bottom left of homepage, user can choose to save current page layout.

## Main Function Operation
1. User can click the image of each app, and it will relink to relative webiste.
2. User can choose to remove the selected app and remove it from current panel.
3. User can choose to first the selected app and put it to the top position.
4. User can choose to drag the img of selected app, place it to other place of page or switch with other apps.
5. User can click + / or add app to add availale app back to panel.

## Home Page Layout Memory
1. If user wants to save the current layout of apps, user can click the save_layout button on bottom left.
2. After logout, user can log back in, user will find the last set up layout.
3. User can re-organize the layout and save it for next time login.


## Backend Administration
1. Only when user is login, he/she can type related web url
2. Login first, then use   /apps/admin  or  /apps/users/admin for backend administration as administrator. 


# Sample Screen Shots
1. Login Page
![ScreenShot](/images/1.PNG)

2. Home Page
![ScreenShot](/images/2.PNG)

3. User information Page
![ScreenShot](/images/3.PNG)

4. Add App when No Availabe
![ScreenShot](/images/4.PNG)

5. Remove Google From Panel
![ScreenShot](/images/5.PNG)

6. Google is Remove
![ScreenShot](/images/6.PNG)

7. Add Google Back to Panel
![ScreenShot](/images/7.PNG)

8. Google is now back In Panel
![ScreenShot](/images/8.PNG)

9. Drag App to Other Places of Panel
![ScreenShot](/images/9.PNG)

10. Switch the relative position of Apps in User Panel
![ScreenShot](/images/10.PNG)

11. Click save Panel to Exit
![ScreenShot](/images/11.PNG)

12. After Log out, it needs to Login again
![ScreenShot](/images/12.PNG)

13. After log back, It Shows User Panel saved as last time
![ScreenShot](/images/13.PNG)

14. Apps Administration Page (only when login)
![ScreenShot](/images/14.PNG)

15. Users Administration Page (only when login)
![ScreenShot](/images/15.PNG)


## Contributor

* John Li 
* Contact: zli769@wisc.edu


