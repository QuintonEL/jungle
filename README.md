# Jungle

A mini e-commerce application built with Rails 4.2 and Ruby 2.3.5. Testing is done using RSpec, Capybara, and Poltergeist.

## Screenshots

Broswe Products
!["Browse Products"](https://github.com/QuintonEL/jungle/blob/master/docs/browse-products.png?raw=true)
Product Details
!["Product Details"](https://github.com/QuintonEL/jungle/blob/master/docs/product-details.png?raw=true)
Register
!["Register"](https://github.com/QuintonEL/jungle/blob/master/docs/register.png?raw=true)
Shopping Cart
!["Shopping Cart"](https://github.com/QuintonEL/jungle/blob/master/docs/shopping-cart.png?raw=true)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
