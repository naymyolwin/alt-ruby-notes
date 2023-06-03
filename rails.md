# Rails

### General Notes

- model use singular
- table use plural
- class name in capital
- rails generate migration add_user_id_to_articles
- add_column :articles, :user_id, :integer
- rails db:migrate
- rails db:rollback to roll back the migration

### Sample Controller

```ruby
rails generate controller Articles index --skip-routes
```

```ruby
class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def show
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
            flash[:notice] = "Article created successfully"
            redirect_to @article
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def edit
       # @article = Article.find(params[:id])
    end

    def update
       # @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully"
            redirect_to @article
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
       # @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private
    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

    def require_same_user
        if current_user != @article.user && !current_user.admin?
            flash[:alert] = "Not your article"
            redirect_to @article
        end
    end

end
```

### Sample Model

```ruby
rails generate model Article title:string body:text

```

```ruby
class User < ApplicationRecord
    before_save {self.email = email.downcase}
    has_many :articles, dependent: :destroy
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 6, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 105}, format: {with: VALID_EMAIL_REGEX}
    has_secure_password
end
```

```ruby
class Session < ApplicationRecord

  belongs_to :user
  before_validation :generate_session_token

  private

    def generate_session_token
      self.token = SecureRandom.urlsafe_base64
    end
end
```

# migration file

```ruby
class AddUserIdToSessions < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :sessions, :user
  end
end
```

If you made a huge mess in all your migration files, and you don't mind destroying your database, you can do these:

    Run rails db:drop to destroy the whole database
    Run rails db:create to create a new database
    Run rails db:migrate

```
belongs_to :[table name in singular]
has_many :[table name in plural]
```

```
https://dbdiagram.io/home
```

### Sample Route

```ruby
Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
end
```

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

Before save

```
before_save {self.email = email.downcase}
```

```
rails routes --expanded | grep edit
```

generating the test files

```
rails g test_unit:scaffold category
```

Tailwind CSS watch

```ruby
bin/rails tailwindcss:watch
```

rails admin for visualizing database records

```ruby
gem 'rails_admin', '~> 2.0'
bundle install
rails g rails_admin:install
rails s
http://localhost:3000/admin
```

Favicon
put the image named favicon.ico in image folder
inside application.html.erb

```ruby
<%= favicon_link_tag %>
```

password column need to name as below in order to secure passwork to work.
along with has_secure password in model file

```ruby
t.string :password_digest
```

hirb gem to show table in proper format

```
create multiple data using seeds.rb
-   create seeds.rb in db folder
-   User.create(...)
-   rails db:seed

gem 'hirb'
bundle install
rails c
Hirb.enable
```

# To make Flash Message

# before_action

# helper_method

# current_user.messages.build(message_params)

# websocket protocol and actioncable

- chatroom channel
- controller to create broadcast data
- JS to handle data to displauy

```ruby
rails generate channel chatroom
```

---

# Stock Tracker Social Media App

## devise gem

```ruby
- gem 'devise'
- rails generate devise:install
- rails generate devise:views
- rails generate devise User (model)
```

```ruby
- gem 'devise-bootstrap-views', '~> 1.0'
- rails generate devise:view:bootstrap_templates
```

- model method for dealing with database, in this case, using for API call
- controller method for dealing with view and model

```ruby
class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: 'token',
      endpoint: 'https://sandbox.iexapi.com/v1'
    )
    begin
      new(ticker: ticker_symobl, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
    rescue => exception
      return nil
    end

  end
```

```ruby
rails c
Stock.new_lookup('AAPL')
```

### secure api call

- use the master key file to encrypt for the credential file. master.key file need to be ignore in the gitignore file.

```ruby
  - credentials.yml.enc
  - master.key
  - rails creditials:edit
  - EDITOR="code --wait" rails credentials:edit
  - rails c
  - Rails.application.credentials.aws[:access_key_id]
```

```ruby
  client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      endpoint: 'https://sandbox.iexapi.com/v1'
    )
```

```ruby
rails g controller user my_portfolio
```

- create user contoller with my_portfolio method
- create my_portfolio route
- create view

### working with ajax

update the form to use with ajax

```ruby
<%= form_tag search_stock_path, remote: true, method: :get do %>
<% end %>
```

update view using javascript, need to update the StockController

```ruby
if @stock
  respond_to do |format|
    format.js {render partial: 'users/result'}
```

- need to create users/\_result.js.erb
- j will escape javascript and render users/\_result.html.erb
- escape_javascript(render 'users/result.html')

```javascript
document.querySelector('#reslult').innerHTML = '<%= j render 'users/result.html' %>'
```

This command will create

- controller
- model
- table
- association

```ruby
rails g resources UserStock user:references stock:references
```

```ruby
has_many: users, through: :user_stocks
```

```ruby
user = User.first
stock = Stock.last
user.stocks << stock
stock.users << user
```

devise also provide current_user method

```ruby
@tracked_stocks = current_user.stocks
```

conditional css class

```
<% 'active' if request.path == my_portfolio_path %>
```

devise user update need to senitize at controller level, in ApplicationController

```ruby
before_action :configure_permitted_parameters, if: :devise_controller?

protect

def configure_permitted_parameters
  devise_parameter_senitizer.permit(:account_update, keys[:first_name, :last_name])
end
```

## self referencial association

```ruby
rails g model Friendship user:references
```

in migration file

```ruby
t.references :friend, references: :users, foreign_key: {to_table: :users}
```

FriendShip model file

```ruby
belong_to :friend, class_name 'User'
```

Users model file

```ruby
has_many :friendships
has_many :friends, through: :friendships
```

wild card for seach

```ruby
User.where("email like ?", "%gmail.com%")
```

Controller method

```ruby
def self.search(param)
  param.strip!
  to_send_back = (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
  return nil unless to_send_back
  to_send_back
end

def self.first_name_matches(param)
  matches("first_name", param)
end

def self.last_name_matches(param)
  matches("last_name", param)
end

def self.email_matches(param)
  matches("email", param)
end

def self.matches(field_name, param)
  where("#{field_name} like ?", "%#{param}%")
end
```
