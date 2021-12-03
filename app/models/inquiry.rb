class Inquiry < ApplicationRecord
  validates :name,  presence: true
  validates :email,  presence: true
  validates :message, presence: true, length: { maximum: 3000 }
end
