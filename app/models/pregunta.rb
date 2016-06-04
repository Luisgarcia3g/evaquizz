class Pregunta < ActiveRecord::Base
  self.table_name = 'preguntas'
  
  validates(:texto, presence: true)
  validates(:respuesta1, presence: true)
  validates(:respuesta2, presence: true)
  validates(:respuesta3, presence: true)
  validates(:respuesta4, presence: true)

#has_and_belongs_to_many :quizzs
  has_many :quizzs,  :through => :pregunta_quizzs
  has_many :pregunta_quizzs, :dependent => :destroy

  mount_uploader :image, ImageUploader


end
