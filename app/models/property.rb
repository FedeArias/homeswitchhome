class Property < ApplicationRecord
    validates :nombre, :descripcion, :lugar, :descripcionLug, presence: true
end
