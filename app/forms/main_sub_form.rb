class MainSubForm
  include ActiveModel::Model

  concerning :Mainbuilder do
    def main
      @main ||= Main.new
    end
  end

  attr_accessor :name, :image, :stores, :genre, :calorie, :sugar, :lipid, :salt

  concerning :SubBuilder do
    attr_reader :subs_attributes

    def subs_params
      params[:subs_attributes]
    end

    def subs
      @subs_attributes ||= Sub.new
    end

    def subs_attributes=(attributes)
      @subs_attributes = Sub.new(attributes)
    end
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
        salt: salt,
      }
    end
  
    def sub_build_asscociations
      main.subs << subs
    end
end