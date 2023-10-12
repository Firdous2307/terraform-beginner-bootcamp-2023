# Terraform Beginner Bootcamp 2023 - Week 2


## Working with Ruby

Bundler is a package manager for **Ruby**, serving as the primary way to install Ruby packages (known as gems).


#### Install Gems

To start, create a Gemfile and define your gems like this:


  ```ruby
  source "https://rubygems.org"

  gem 'sinatra'
  gem 'rake'
  gem 'pry'
  gem 'puma'
  gem 'activerecord'
  ```


Afterward, run `bundle install` to install these gems globally, creating a **Gemfile.lock** to lock gem versions.




#### Executing Ruby Scripts in the Context of Bundler

For future Ruby scripts to use the installed gems, prefix them with `bundle exec`.


### Sinatra

Sinatra is a micro web-framework for **Ruby**, ideal for building web apps with ease. You can create a web server in a single file.



 [Learn more about Sinatra](https://sinatrarb.com/)


## Terratowns Mock Server

To run the web server, execute these commands:

```ruby
bundle install
bundle exec ruby server.rb
```

All of the code for our server is stored in the `server.rb` file.


## Binding.Pry

`binding.pry` s a breakpoint used for interactive debugging in Ruby programs, allowing you to pause execution and examine the program's state.

## CRUD

Terraform Provider resources utilize CRUD.

CRUD stands for Create, Read Update, and Delete

[Create,Read,Update and Delete](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)