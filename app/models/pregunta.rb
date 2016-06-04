class Pregunta < ActiveRecord::Base
  validates(:texto, presence: true)
  validates(:respuesta1, presence: true)
    validates(:respuesta2, presence: true)
      validates(:respuesta3, presence: true)
        validates(:respuesta4, presence: true)
 has_and_belongs_to_many :quizzs
mount_uploader :image, ImageUploader
end
