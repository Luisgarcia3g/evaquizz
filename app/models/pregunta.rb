class Pregunta < ActiveRecord::Base
 has_and_belongs_to_many :quizzs
mount_uploader :image, ImageUploader
end
