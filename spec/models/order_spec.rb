require 'rails_helper'

RSpec.describe Order, type: :model do
  factory :order do
  item_id {1}
  user_id {1}
  end
end
