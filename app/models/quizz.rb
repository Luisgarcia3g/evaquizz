class Quizz < ActiveRecord::Base
validates_uniqueness_of :nombre
 validates(:nombre, presence: true)
  belongs_to :tema
  #has_many :pregunta_quizzs,:dependent => :destroy
# has_many :preguntas,  :through => :pregunta_quizzs
 #accepts_nested_attributes_for :pregunta_quizzs

 has_and_belongs_to_many :preguntas
accepts_nested_attributes_for :preguntas
 end
