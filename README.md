# Gifty

Gifty is a Rails App to help you find gifts for friends and streamline shopping for those gifts. After signing up by either email or Facebook, you can:

  - As a Gift Giver:
    - Find friends and view their wishlists
    - Select friends' gifts to shop for
    - View all of your selected gifts
    - Mark items as purchased
    - Unselect items to purchase
  - As a Gift Recipient
    - Add items to your wish list
    - Delete items from your wish list
    - Edit items on your wish list
    - Delete projects with their associated tasks

## Video walkthrough
*COMING SOON*

## Installation
Clone the repository, then execute:
```
$ bundle
```

## Usage
Migrate the database and load seed data:
```
$ rails db:migrate && rails db:seed
```
To start the server, run:
```
$ rails s
```
Then navigate to ```localhost:3000``` or run:
```
$ open http://localhost:3000
```


### Tech

Gifty uses a number of open source projects to work properly, including:
* [Rails] - A web-application framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern.
* [Omniauth-facebook] - Facebook OAuth2 Strategy for OmniAuth.
* [Figaro] - Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file.


### Todos

 - Add admin console
 - Add ability to list by store

## Contributing

Bug reports and pull requests are welcome on GitHub at [this project's repository]. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

This Web Application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


   [Rails]: <http://rubyonrails.org/>
   [Omniauth-facebook]: <https://github.com/mkdynamic/omniauth-facebook>
   [Figaro]: <https://github.com/laserlemon/figaro>
