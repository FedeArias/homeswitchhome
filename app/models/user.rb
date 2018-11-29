class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nombre, :apellido, :DNI, :fechaNacimiento, :codigoTarjeta, :numeroTarjeta, :vencimientoTarjeta, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 end     
