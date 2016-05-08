class Tema < ActiveRecord::Base
  has_many :quizzs
  belongs_to :temario
end
