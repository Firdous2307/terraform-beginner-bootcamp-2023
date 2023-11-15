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

## Terra Houses 
Deployed the listed TerraHouses to [terratowns.cloud](https://terratowns.cloud/) using the [main.tf](https://github.com/Firdous2307/terraform-beginner-bootcamp-2023/blob/main/main.tf) file.


## Table of Contents
- [Anime](https://github.com/Firdous2307/terraform-beginner-bootcamp-2023/tree/main/public/anime)
- [R&B Music](https://github.com/Firdous2307/terraform-beginner-bootcamp-2023/tree/main/public/r-b)
- [Jollof Rice](https://github.com/Firdous2307/terraform-beginner-bootcamp-2023/tree/main/public/naija-jollof-rice)
- [Christopher - Nolan](https://github.com/Firdous2307/terraform-beginner-bootcamp-2023/tree/main/public/christopher-nolan)


## Anime
![Anime Screenshot](https://github.com/Firdous2307/terraform-beginner-bootcamp-2023/assets/124298708/03d19203-0027-4db2-a182-f222504bdeb9)


## R&B Music 
![R&B Music Screenshot](https://github.com/Firdous2307/terraform-beginner-bootcamp-2023/assets/124298708/7ebdde51-9541-4c09-9951-bd7591fe89c0)


## Jollof Rice
![Jollof Rice Screenshot](https://github.com/Firdous2307/terraform-beginner-bootcamp-2023/assets/124298708/b6a00c55-82b6-41b9-b20c-2439c24056df)


## Christopher Nolan
![Christopher - Nolan Screenshot](https://github.com/Firdous2307/terraform-beginner-bootcamp-2023/assets/124298708/27f25d3e-932c-49fe-8bfc-65359de1eeed)

![Screenshot (723)](https://github.com/Firdous2307/terraform-beginner-bootcamp-2023/assets/124298708/970b58aa-4ffd-4117-909a-f2a56fc27908)


