class Tema < ActiveRecord::Base
    validates_uniqueness_of :nombretema
    validates(:nombretema, presence: true)
    validates(:descripcion, presence: true)
  has_many :quizzs
  belongs_to :temario
end
