class FoodCombination < ApplicationRecord
  belongs_to :main
  belongs_to :sub

  def get_sugar
    { '組み合わせ成分値': sprintf("%.1f", main.sugar + sub.sugar) }
  end

  def get_lipid
    { '組み合わせ成分値': sprintf("%.1f", main.lipid + sub.lipid) }
  end

  def get_salt
    { "組み合わせ成分値": sprintf("%.1f", main.salt + sub.salt) }
  end

  def chart_sugar
    { name: '炭水化物(g)', data: { '組み合わせ成分値': sprintf("%.1f", main.sugar + sub.sugar) } }
  end


  def plus_component
    self.main.sugar + self.sub.sugar <= 80
  end

end
