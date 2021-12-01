class RemoveImageFromMains < ActiveRecord::Migration[6.0]
  def change
    remove_column :mains, :image, :string
  end
end
