# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

3.times do
  FactoryBot.create :customer
end

3.times do
  FactoryBot.create :tea
end

@customer_1 = Customer.all[0]
@customer_2 = Customer.all[1]
@customer_3 = Customer.all[2]

@tea_1 = Tea.all[0]
@tea_2 = Tea.all[1]
@tea_3 = Tea.all[2]

Subscription.create!(customer_id: @customer_1.id, tea_id: @tea_1.id, title: "my tea", price: "15.99", status: 0, frequency: 0)
Subscription.create!(customer_id: @customer_1.id, tea_id: @tea_2.id, title: "my tea", price: "15.99", status: 1, frequency: 2)
Subscription.create!(customer_id: @customer_1.id, tea_id: @tea_3.id, title: "my tea", price: "15.99", status: 0, frequency: 1)
Subscription.create!(customer_id: @customer_2.id, tea_id: @tea_2.id, title: "my tea", price: "15.99", status: 0, frequency: 2)