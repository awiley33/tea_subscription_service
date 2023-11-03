require 'rails_helper'

RSpec.describe "Subscriptions Endpoints", type: :request do
  before do
    create_list(:customer, 3)
    @customer_1 = Customer.all[0]
    @customer_2 = Customer.all[1]
    @customer_3 = Customer.all[2]

    create_list(:tea, 3)
    @tea_1 = Tea.all[0]
    @tea_2 = Tea.all[1]
    @tea_3 = Tea.all[2]

    @sub_1 = Subscription.create!(customer_id: @customer_1.id, tea_id: @tea_1.id, title: "my tea", price: "15.99", status: 0, frequency: 0)
    Subscription.create!(customer_id: @customer_1.id, tea_id: @tea_2.id, title: "my tea", price: "15.99", status: 1, frequency: 2)
    Subscription.create!(customer_id: @customer_1.id, tea_id: @tea_3.id, title: "my tea", price: "15.99", status: 0, frequency: 1)
    Subscription.create!(customer_id: @customer_2.id, tea_id: @tea_2.id, title: "my tea", price: "15.99", status: 0, frequency: 2)
  end

  it "sends all of a customer's subscriptions" do
    get "/api/v0/customers/#{@customer_1.id}/subscriptions"
    expect(response).to be_successful

    subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(subscriptions[:data].count).to eq(3)

    subscriptions[:data].each do |subscription|
      expect(subscription).to have_key(:id)
      expect(subscription[:id]).to be_a(String)

      expect(subscription[:attributes]).to have_key(:tea_id)
      expect(subscription[:attributes][:tea_id]).to be_an(Integer)

      expect(subscription[:attributes]).to have_key(:customer_id)
      expect(subscription[:attributes][:customer_id]).to be_an(Integer)

      expect(subscription[:attributes]).to have_key(:title)
      expect(subscription[:attributes][:title]).to be_a(String)

      expect(subscription[:attributes]).to have_key(:price)
      expect(subscription[:attributes][:price]).to be_a(Float)

      expect(subscription[:attributes]).to have_key(:status)
      expect(subscription[:attributes][:status]).to be_a(String)

      expect(subscription[:attributes]).to have_key(:frequency)
      expect(subscription[:attributes][:frequency]).to be_a(String)
    end
  end

  it "creates a new subscription" do
    params = ({
        "user_id": @customer_3.id,
        "tea_id": @tea_3.id,
        "title": "new sub",
        "price": 10.99,
        "status": "active",
        "frequency": "biweekly"
      })

    post "/api/v0/customers/#{@customer_3.id}/subscriptions", params: params, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(201)

    new_sub = Subscription.last
    
    expect(new_sub.title).to eq("new sub")
    expect(new_sub.price).to eq(10.99)
    expect(new_sub.status).to eq("active")
    expect(new_sub.frequency).to eq("biweekly")
  end

  it "does not create a new subscription if necessary information is missing" do
    params = ({
        "user_id": @customer_3.id,
        "tea_id": @tea_3.id,
        "price": 10.99,
        "status": "active",
        "frequency": "biweekly"
      })

    post "/api/v0/customers/#{@customer_3.id}/subscriptions", params: params, as: :json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end

  it "cancels a customer's subscription" do
    expect(@sub_1.status).to eq("active")
    
    sub_params = ({ status: "cancelled" })
    
    patch "/api/v0/customers/#{@customer_1.id}/subscriptions/#{@sub_1.id}", params: sub_params, as: :json
    expect(response).to be_successful

    @sub_1.reload
    expect(@sub_1.status).to eq("cancelled")
  end
end