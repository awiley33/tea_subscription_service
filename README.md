# Tea Subscription Service Rest API

## Purpose
The main function of this repo is to serve as a Rest API to a front end client that is selling tea subscription boxes. This project was built to satisfy the following prompt given by Turing School of Software @ Design: [Take Home Challenge](https://mod4.turing.edu/projects/take_home/take_home_be)

## Built With
* ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
* ![Postgresql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
* ![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
* ![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
* ![Postman Badge](https://img.shields.io/badge/Postman-FF6C37?logo=postman&logoColor=fff&style=for-the-badge)

## Running On
  - Rails 7.0.8
  - Ruby 3.2.2

## Getting Started

This API is not deployed. To get a local copy, follow these instructions:

1. Fork the Project
2. Clone the repo 
``` 
git clone git@github.com:your_username/tea_subscription_service.git 
```
3. Install the gems
```
bundle install
```
4. Create the database
```
rails db:{create,migrate,seed}
```

## Exposed Endpoints

An endpoint to see all of a customer’s subsciptions (active and cancelled)
```
GET 'api/v0/customers/:customer_id/subscriptions'
```
An endpoint to subscribe a customer to a tea subscription
```
POST 'api/v0/customers/:customer_id/subscriptions'
```
An endpoint to cancel a customer’s tea subscription
```
PATCH 'api/v0/customers/:customer_id/subscriptions/:id'
```

## Database Design

### Customers
| first_name | string |
| last_name | string |
