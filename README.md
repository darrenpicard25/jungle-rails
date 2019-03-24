# Jungle

A mini e-commerce application built with Rails 4.2


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Set up username and password of gmail account to be used in responses .env file following .env.example
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Quick Look
!["Main Page"](https://github.com/darrenpicard25/jungle-rails/blob/master/images/view_pictures/main_page.gif?raw=true)
!["Registering"](https://github.com/darrenpicard25/jungle-rails/blob/master/images/view_pictures/registering.gif?raw=true)
!["Product Page"](https://github.com/darrenpicard25/jungle-rails/blob/master/images/view_pictures/product_show.png?raw=true)
!["Cart Page"](https://github.com/darrenpicard25/jungle-rails/blob/master/images/view_pictures/cart_show.png?raw=true)

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe






