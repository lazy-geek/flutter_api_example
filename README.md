# CRUD Operations in an App

A Feature Rich Google Keep Like Notes App Written In Flutter With Beautiful UI.




## Features

Create an admin panel with the provided api and [https://gorest.co.in/](https://gorest.co.in/).

CRUD operation for only that user:

- Create a login screen without the use of an API."admin" and "admin" are the username and password, respectively. (Show a SnackBar if the credentials entered by user are incorrect)
- Create a user list page that includes the API field as well as a standard, appealing user card. view, edit, and delete buttons.
- There should be an "add user" button on the list page so that administrators can add users.
- A single screen where the user can see the particular user's details.
- The app should show the changes in data in Real-Time. (For Ex. if the user deletes a User the change should be reflected in the UI at the same time).
Try to get as creative as much you can. Think of some edge cases & show a warning wherever needed.

  
## Total screens

- Page 1: The Authentication/Login Page
- Page 2: List of Users
- Page 3: Modify and Add a User Page
- Page 4: User Information
## Run Locally


Clone the project

```bash
  git clone https://github.com/lazy-geek/Momento
```

Go to the project directory

```bash
  cd Momento
```

Install dependencies

```bash
  flutter pub get
```
create .env file in the project root with api key. e.g:

```.env
API_KEY=YOUR_GOREST_API_KEY
```
Run The App

```bash
  flutter run
```

## Packages Used

- flutter_svg: for displaying svg
- google_fonts: for fonts
- http: for making api requests
- flutter_dotenv: for environment variable
- flutter_riverpod: for state management
  
