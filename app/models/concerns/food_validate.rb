module FoodValidate
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true
    validates :calorie, presence: true
    validates :sugar, presence: true
    validates :lipid, presence: true
    validates :salt, presence: true
    validates :name, length: { maximum: 30 }
  end
end
