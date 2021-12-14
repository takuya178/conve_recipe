class FoodCombination < ApplicationRecord
  belongs_to :main
  belongs_to :sub

  scope :preload_food_image, -> { preload(main: { image_attachment: :blob }, sub: { image_attachment: :blob }) }

  def plus_sugar
    main.sugar + sub.sugar <= 100
  end

  def plus_lipid
    main.lipid + sub.lipid <= 25
  end

  def plus_salt
    main.salt + sub.salt <= 3
  end

  def overdose_sugar
    main.sugar + sub.sugar >= 101
  end

  def overdose_lipid
    main.lipid + sub.lipid >= 26
  end

  def overdose_salt
    main.salt + sub.salt >= 3.1
  end
end
