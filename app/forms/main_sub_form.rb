class MainSubForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  concerning :Mainbuilder do
    def main
      @main ||= Main.new
    end
  end

  attr_accessor :name, :image, :stores, :genre, :calorie, :sugar, :lipid, :salt

  # メインのみvalidateかかる
  validates :name, presence: true
  validates :calorie, presence: true
  validates :sugar, presence: true
  validates :lipid, presence: true
  validates :salt, presence: true


  concerning :SubBuilder do
    attr_reader :subs_attributes

    def subs_params
      params[:subs_attributes]
    end

    def subs
      # 左辺が存在しない場合、右辺が代入
      @subs_attributes ||= Sub.new
    end

    # セッター 外部から変更するためのメソッド
    # attrubutesでSubの属性を代入する
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