class FoodCombination < ApplicationRecord
  belongs_to :main
  belongs_to :sub

  scope :preload_food_image, -> { preload(main: { image_attachment: :blob }, sub: { image_attachment: :blob }) }

  def plus_sugar
    self.main.sugar + self.sub.sugar <= 100
  end

  def plus_lipid
    self.main.lipid + self.sub.lipid <= 25
  end

  def plus_salt
    self.main.salt + self.sub.salt <= 3
  end

  def overdose_sugar
    self.main.sugar + self.sub.sugar >= 101
  end

  def overdose_lipid
    self.main.lipid + self.sub.lipid >= 26
  end

  def overdose_salt
    self.main.salt + self.sub.salt >= 3.1
  end
end
