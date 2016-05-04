
  class WelcomeController < ApplicationController
    def index

      host = 'http://evafisica.com/learn'

      configuration          = Moodle::Api::Configuration.new
      configuration.host     = host
      configuration.username = 'kendra'
      configuration.password = 'Kendra2016#'
      configuration.service  = 'eva-prac-2016'
      token =  Moodle::Api::TokenGenerator.new(configuration).call
      # The client can also be instantiated and used.
      #p token
 rescue
    @message = "No se genero token"

end
end
