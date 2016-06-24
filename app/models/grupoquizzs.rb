class Grupoquizzs < ActiveRecord::Base
self.table_name = 'grupoquizzs'
belongs_to :quizz
belongs_to :grupo
has_many :resultados

end
