# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Base app was already built for educational purposes.

## Features added
* Display a sold out badge when product stock is zero
* Implement feature for admins to add new categories
* Implement feature for admins to add new products for a category
* Enable User Authentication: Create new users, login with created users and logout
* Create and show an invoice of user's submitted order with all the relevant product details and pricing
* Added basic HTTP authentication when visiting the admin/products page

## Bugs Fixed
* Fixed issue where the checkout page displayed payment option even when cart had no items. Now displays a friendly message that cart is empty and not show the payment options


## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
