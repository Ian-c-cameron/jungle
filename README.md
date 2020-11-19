# Jungle

A mini e-commerce application built with Rails 4.2

## Screenshots

Main Page:
!["Main Page"](https://github.com/Ian-c-cameron/jungle/blob/master/docs/main.png?raw=true)

Admin Products Page:
!["Admin Products Page"](https://github.com/Ian-c-cameron/jungle/blob/master/docs/admin-products.png?raw=true)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* bcrypt

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Future Development

This project is close to being a full featured application, but some additions would definitely add to its appeal.

* Customer Account Section - allow customers to alter their account details, view order status, and see previous order history.
* Favourites List - allow customers to mark items as favourites and view their list of favourites
* Shared Items - allow users to share items or lists of items(possibly gift lists, eg. for weddings)
* HTTPS security - all sites really should be encrypted for security
* Search - allow customers to search for goods
* Product Filtering - allow customers to filter products by their attributes