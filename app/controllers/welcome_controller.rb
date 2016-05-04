class WelcomeController < ApplicationController
    def validar

 @usuario = params[:welcome][:usuarios]
 $usuarioNombre=@usuario
@contraseña = params[:welcome][:contraseñas]
@tokencreado=nil
if(@usuario=="Evelin")
  redirect_to :admin
else
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
     if (@usuario=="luis")
       redirect_to :alumno
     #List courses of a user
   elsif (@usuario=="kendra")
     redirect_to :maestro


   end
end

rescue
@mensaje="Usuario no encontrado"
 flash[:notice] = "Usuario o contraseña incorrectos"
 redirect_to :back


end

end
