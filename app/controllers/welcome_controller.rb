class WelcomeController < ApplicationController
    def validar
@admins=Admin.all
 @usuario = params[:welcome][:usuarios]
 $usuarioNombre=@usuario
@contraseña = params[:welcome][:contraseñas]
@tokencreado=nil
if (Admin.exists?(name: @usuario))


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

     @userid=@user.values[0]
    @userid=@userid[0]
     @usernomnbre= @userid.values[2]
    @userid=@userid.values[0]

     params = { 'userid' => @userid }
      @courses = Moodle::Api.core_enrol_get_users_courses(params)


@cantidadcursos=@courses.length

@cursos= Array.new
Array.new(@cantidadcursos)
@cursosid= Array.new
Array.new(@cantidadcursos)
#@otro= Array.new
#Array.new(@cantidadcursos)
@rol=0

for i in 0..@cantidadcursos-1
@cursos[i]=@courses[i].values[0]
end

for i in 0..@cantidadcursos-1
params = { 'courseid' => @cursos[i] }
    @course_users = Moodle::Api.core_enrol_get_enrolled_users(params)

@cantidadgente=@course_users.length
for x in 0..@cantidadgente-1
@indice=@course_users[x]["roles"]

if (@indice[0].values[2]=="teacher")
if(@course_users[x].values[0]==@userid)
@rol=1
end
end
end
end

if (@rol==1)
  redirect_to :maestro

else
redirect_to :alumno
end




#@otro=@otro[0].values[2]



    # @userid=@user
     #if (@usuario=="luis")
      # redirect_to :alumno

   #elsif (@usuario=="kendra")
    # redirect_to :maestro



end

rescue
@mensaje="Usuario no encontrado"
 flash[:notice] = "Usuario o contraseña incorrectos"
 redirect_to :back


end

end
