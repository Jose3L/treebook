class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # relación de tener muchos estatus
  has_many :statuses

  # método de instancia para mostrar el nombre completo
  def full_name
    first_name + " " + last_name
  end
end
