class FoodCombination < ApplicationRecord
  belongs_to :main
  belongs_to :sub

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
