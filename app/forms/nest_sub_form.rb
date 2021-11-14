class NestSubForm
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :calorie, :integer
  attribute :sugar, :float
  attribute :lipid, :float
  attribute :salt, :float
end