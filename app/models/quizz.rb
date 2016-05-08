class Quizz < ActiveRecord::Base
  belongs_to :tema
   has_and_belongs_to_many :preguntas
end
