# Tea Subscription Service

### Table of Contents
1. [Purpose](#purpose)
2. [Database Design](#database-design)
3. [Endpoints](#endpoints)
4. [Built With](#built-with)
5. [Getting Started](#getting-started)

## Purpose
The main function of this repo is to serve as a Rest API service to the front end client, for a user that is selling tea subscription boxes. This project was built to satisfy the following prompt given by Turing School of Software & Design: [Take Home Challenge](https://mod4.turing.edu/projects/take_home/take_home_be)

## Database Design

### Customers
has many Subscriptions
| Attribute   |  Data Type  |
| ----------- | ----------- |
| first_name      | string       |
| last_name   | string   |
| email   | string   |
| street   | string   |
| city   | string   |
| state   | string   |
| zip   | integer   |
| full_address   | string   |
| updated_at   | datetime   |
| created_at   | datetime   |

### Teas
has many Subscriptions
| Attribute   |  Data Type  |
| ----------- | ----------- |
| title      | string       |
| description   | string   |
| temperature   | integer   |
| brew_time   | integer   |
| created_at   | datetime   |
| updated_at   | datetime   |

### Subscriptions
belongs to Tea, Customer
| Attribute   |  Data Type  |
| ----------- | ----------- |
| tea_id      | bigint       |
| customer_id   | bigint   |
| title   | string   |
| price   | float   |
| status   | integer   |
| frequency   | integer   |
| created_at   | datetime   |
| updated_at   | datetime   |


## Endpoints

View all of a customer’s subscriptions (active and cancelled)
```
GET 'api/v0/customers/:customer_id/subscriptions'
```
Subscribe a customer to a tea subscription
```
POST 'api/v0/customers/:customer_id/subscriptions'
```
Cancel a customer’s tea subscription
```
PATCH 'api/v0/customers/:customer_id/subscriptions/:id'
```

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
