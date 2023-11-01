class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer

  validates_presence_of :title, :price, :status, :frequency

  enum status: { active: 0, inactive: 1, frozen: 2 }
  enum frequency: { biweekly: 0, monthly: 1, three_months: 2 }
end
