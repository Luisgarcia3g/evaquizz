class Tema < ActiveRecord::Base
    validates_uniqueness_of :nombretema
  has_many :quizzs
  belongs_to :temario
end
