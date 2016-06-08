class Tema < ActiveRecord::Base

  scope :active, -> { where(is_active: true) }
    validates_uniqueness_of :nombretema
    validates(:nombretema, presence: true)
    validates(:descripcion, presence: true)
  has_many :quizzs
  belongs_to :temario
end
