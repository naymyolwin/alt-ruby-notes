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

```sh
rails new alpha_blog
```

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
- config\routes -> define routes

create new routes

```sh
get 'about', to: 'pages#about'
```

create scaffold

- created migration file
- that migration file will use to create the table
- created model
- created test
- created controller
- created routes
- created views

```sh
rails generate scaffold Article title:string description:text
```

- string has character limit of 250

to run migration file

```sh
rails db:migrate
```

to check the routes

```
rails routes --expanded
```

### Rails naming conventions

- Model name: article
- Article model file name: article.rb
- Article model class name: Article
- Table name: articles

create migration file

```ruby
rails generate migration create_articles
```

add column

```ruby
t.string :title
```

roll back migration

```ruby
rails db:rollback
```

new migration file to add column

```ruby
add_column :articles, :created_at, :datetime
add_column :articles, :updated_at, :datetime
```

Access to Rails console

```ruby
rails console or rails c
```

To see the article table

```ruby
Article.all
```

To create new record

```ruby
Article.create(title: "first article", description: "first article")
```

To create article variable

```ruby
article = Article.new
```

now can use getter and setter function

```ruby
article.title = "second article"
article.description = "sencond article"
article.save
```

3rd way

```ruby
article = Article.new(title: "third article", description: "third article")
article.save
```

To quit from console

```
exit
```

Find article

```
Article.find(2)
Article.first
Article.last
```

Delete article

```
aritcle.destroy
```

Need to add validation in article.rb model file.

```ruby
validates :title, presence: true, length: {minimum: 6, maximum: 100}
validates :description, presence: true, length: {minimum: 10, maximum: 30}
```

```
article.errors.full_messages
```

Retrive params

```ruby
def show
        @article = Article.find(params[:id])
end
```

Evaluate

```ruby
<% @article.title %>
```

Evaluate and Display

```ruby
<%= @article.title %>
```

can call `buybug` anywhere to stop and debug and `continue` to continue with the code.

check routes

```ruby
rails routes --expanded
```

routes

```ruby
resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
or
resources: articles
```

DB change methods

| Method         | Description                                                                  |
| -------------- | ---------------------------------------------------------------------------- |
| add_column     | add a new column in a table                                                  |
| add_index      | create an index in a table                                                   |
| add_reference  | add a new relationship with another table                                    |
| add_timestamps | add two columns created_at and updated_at with datetime data type            |
| create_table   | create a new table                                                           |
| drop_table     | remove table from database schema; all record will be gone                   |
| remove_column  | remove a column from a table; all records will gone for that specific column |

Rails DB Associations

```
belongs_to
has_one
has_many
has_many :through
has_one :through
has_and_belongs_to_many
```

Update DB

```ruby
Article.update_all(user_id: User.first.id)
```
