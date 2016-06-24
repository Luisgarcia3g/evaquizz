class Grupo < ActiveRecord::Base
    self.table_name = 'grupo'

    has_many :quizzs, :through => :grupoquizzs
end
