class Grupo < ActiveRecord::Base
    self.table_name = 'grupos'

    has_many :quizzs, :through => :grupoquizzs
end
