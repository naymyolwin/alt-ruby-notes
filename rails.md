# Rails

### MVC

- Model
  - User
  - Post
  - Article
  - Stock
- View
  - home.html.erb
  - new.html.erb
  - friends.html.erb
  - my_portfolio.html.erb
- Controller

  - users_controller
  - post_contreller
  - articles_controller
  - stock_controller

- Step 1: You (the client) send the server a request demanding that a Tweet of yours to be created in the database
- Step 2: Router interprets the URL, your request and its method type
- Step 3: Router pass the request along to the controller responsible for processing
- Step 4: Controllers go through Models to interact with the Database to manage information. The models run validations to check
- Step 5: Controllers picks a View (response templates) after processing.
- Step 6: After a Response template (view) is picked, a response is made

### Rails folder

- controllers folder
- models folder
- views folder

routes -> controller#method -> view

_generate controller called pages as well as pages in view_

```sh
rails generate controller pages
```

### structure of rails application

- assets\images -> store images
- assets\stylesheets -> store css
- channels -> for real time communications
- controllers -> controllers
- helpers -> helper functions for views
- javascript\pack ->
- models ->
- views ->
