class MainSubForm
  include ActiveModel::Model

  concerning :Mainbuilder do
    def main
      @main ||= Main.new
    end
  end

  attr_accessor :name, :image, :stores, :genre, :calorie, :sugar, :lipid, :salt

  concerning :SubBuilder do
    def subs
      @subs ||= Sub.new
    end

    def subs_attributes=(attributes)
      @subs = Sub.new(attributes)
    end
  end

  def sub_build_asscociations
    main.subs << subs
  end

  def save
    return false if invalid?

    main.assign_attributes(main_params)
    sub_build_asscociations

    if main.save
      true
    else
      false
    end
  end

  private

  def main_params
    {
      name: name,
      image: image,
      stores: stores,
      genre: genre,
      calorie: calorie,
      sugar: sugar,
      lipid: lipid,
      salt: salt
    }
  end
end
