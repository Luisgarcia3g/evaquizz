tclass GrupoQuizz < ActiveRecord::Base
    self.table_name = 'grupo_quizz'
belongs_to :quizz
belongs_to :grupo
has_many :resultados

end
