class Tag < ApplicationRecord
  scope :find_component, ->(id, component) { find_by(id: id, component: component) }
  scope :find_genre, ->(id, genre) { find_by(id: id, genre: genre) }
end
