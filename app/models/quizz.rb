class Quizz < ActiveRecord::Base
validates_uniqueness_of :nombre
 validates(:nombre, presence: true)
  belongs_to :tema
   has_and_belongs_to_many :preguntas
end
