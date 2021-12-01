class RemoveImageFromSubs < ActiveRecord::Migration[6.0]
  def change
    remove_column :subs, :image, :string
  end
end
