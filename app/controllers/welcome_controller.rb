class WelcomeController < ApplicationController
    def validar
@usuario = params[:welcome][:usuarios]
@contraseña = params[:welcome][:contraseñas]
@tokencreado=nil

host = 'http://evafisica.com/learn'

   configuration          = Moodle::Api::Configuration.new
   configuration.host     = host
   configuration.username = @usuario
   configuration.password = @contraseña
   configuration.service  = 'eva-prac-2016'
   p configuration

   token =  Moodle::Api::TokenGenerator.new(configuration).call
@tokencreado=token
  Moodle::Api.configure({host: host, token: token })

  params = { 'criteria[0][key]' => 'username', 'criteria[0][value]' => configuration.username }
     @user = Moodle::Api.core_user_get_users(params)
     p @user


    #puedo acceder a un array con esto [0], pero no se como referenciar que quiero SOLO el id
     @userid=@user
     #List courses of a user


rescue
@mensaje="Usuario no encontrado"

end

end
