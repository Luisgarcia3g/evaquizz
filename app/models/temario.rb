class Temario < ActiveRecord::Base
  validates_uniqueness_of :nombretemario
   validates(:nombretemario, presence: true)
   validates(:descripcion, presence: true)
  has_many :temas
end
