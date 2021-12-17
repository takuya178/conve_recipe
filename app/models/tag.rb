class Tag < ApplicationRecord
  scope :where_component, ->(id, component) { where(id: id, component: component) }
  scope :where_genre, ->(id, genre) { where(id: id, genre: genre) }
end
