class User < ApplicationRecord
  has_many :petitions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nombre, :apellido, :DNI, :edad, :codigoTarjeta, :numeroTarjeta, :vencimientoTarjeta, presence: true
  validate  :mayor_de_edad, :tarjeta_no_vencida, :numero_menor, :codigo_menor         

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def mayor_de_edad
    if edad.present? && edad < 18
      errors.add(:edad, "Debes ser mayor de edad") 
  end   
  end 
  def tarjeta_no_vencida
    if vencimientoTarjeta? && Date.today > vencimientoTarjeta
      errors.add(:vencimientoTarjeta, "La tarjeta no debe estar vencida") 
    end 
  end
  def numero_menor
    if numeroTarjeta.present? && numeroTarjeta.length < 16
      errors.add(:numeroTarjeta, "EL numero de la tarjeta debe tener 16 digitos") 
    end
  end
  def codigo_menor 
    if codigoTarjeta.present? && codigoTarjeta < 100
      errors.add(:codigoTarjeta, "EL codigo de la tarjeta debe tener 3 digitos")
    end
  end
 end     
