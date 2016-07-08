class Resultado < ActiveRecord::Base
    self.table_name = 'resultados'

     self.primary_key = "Codigo"
     belongs_to :grupo_quizz
end
