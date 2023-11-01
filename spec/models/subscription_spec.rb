require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "relationships" do
    it { should belong_to(:customer) }
    it { should belong_to(:tea) }
  end

  describe "validations" do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:price)}
    it { should validate_presence_of(:status)}
    it { should validate_presence_of(:frequency)}
  end

  describe "enum definitions" do
    it { should define_enum_for(:status).with_values([:active, :cancelled]) }
    it { should define_enum_for(:frequency).with_values([:biweekly, :monthly, :three_months]) }
  end
end
