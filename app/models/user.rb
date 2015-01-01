class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validación de los campos de usuario
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true,
                           uniqueness: true


  # relación de tener muchos estatus
  has_many :statuses

  # método de instancia para mostrar el nombre completo
  def full_name
    first_name + " " + last_name
  end

  # crea la url para el avatar del usuario
  # primero quita los espacios al principio o al final del email
  # segundo cambia el formato a minúsculas de todos caracteres del email
  # tercero preparar el hash del email para la url
  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)

    "http://gravatar.com/avatar/#{hash}"
  end
end
