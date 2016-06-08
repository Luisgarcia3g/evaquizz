class Temario < ActiveRecord::Base
  scope :active, -> { where(is_active: true) }
  validates_uniqueness_of :nombretemario
   validates(:nombretemario, presence: true)
   validates(:descripcion, presence: true)
  has_many :temas
end
