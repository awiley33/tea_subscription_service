class Api::V0::SubscriptionsController < ApplicationController
  before_action :set_customer

  def create
    new_sub = @customer.subscriptions.create!(subscription_params)
    render json: { message: "Subscription #{new_sub.title} created!" }, status: 201
  end

    def update
      subscription = Subscription.find(params[:id])
      if subscription.update(subscription_params)
        render json: { message: "Subscription #{subscription.title} is updated and #{subscription.status}!" }, status: 201
      else
        render json: subscription.errors, status: :unprocessable_entity
      end
    end

  def index
    render json: SubscriptionSerializer.new(@customer.subscriptions)
  end

  private
  def subscription_params
    params.permit(:tea_id, :customer_id, :title, :price, :status, :frequency)
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
end