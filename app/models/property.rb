class Property < ApplicationRecord
    validates :nombre, :descripcion, :lugar, :descripcionLug, presence: true
   has_many :auction1s
   has_many :purchases
end
