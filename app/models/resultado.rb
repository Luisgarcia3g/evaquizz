class Resultado < ActiveRecord::Base
    self.table_name = 'resultado'

     self.primary_key = "Codigo"
     belongs_to :grupo_quizz
end
