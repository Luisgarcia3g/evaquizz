class PreguntaQuizz < ActiveRecord::Base
	belongs_to :quizz
	belongs_to :pregunta
end
