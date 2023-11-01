class Customer < ApplicationRecord
  has_many :subscriptions
  has_many :teas, through: :subscriptions

  validates_presence_of :first_name, :last_name, :email, :street, :city, :state, :zip
  validates_length_of :zip, is: 5
  validates_uniqueness_of :email

  before_save :concat_address


  private
  def concat_address
    self.full_address = "#{self.street} #{self.city}, #{self.state} #{self.zip}"
  end
end
