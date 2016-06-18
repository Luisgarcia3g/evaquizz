class Grupo < ActiveRecord::Base
    self.table_name = 'grupo'
    belong_to :Temario
    has_many :quizzs, :through => :grupo_quizzs
end
