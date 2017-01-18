class WelcomeController < ApplicationController

def servicio

  host = 'http://evafisica.com/learn'

  configuration          = Moodle::Api::Configuration.new
  configuration.host     = host
  configuration.username = "maestroevaclicker"
  configuration.password = 'Evaclicker#1'
  configuration.service  = 'eva-prac-2016'
  token =  Moodle::Api::TokenGenerator.new(configuration).call
  #Find authenthicated user
Moodle::Api.configure({host: host, token: token })
params = { 'criteria[0][key]' => 'username', 'criteria[0][value]' => configuration.username }
@user = Moodle::Api.core_user_get_users(params)

params = { 'criteria[0][key]' => 'email', 'criteria[0][value]' => '%%' }
    @users = Moodle::Api.core_user_get_users(params)

params = { 'criteria[0][key]' => 'username', 'criteria[0][value]' => configuration.username }
@user = Moodle::Api.core_user_get_users(params)


@userid=@user.values[0]
@userid=@userid[0]


@userid=@userid.values[0]

params = { 'userid' => @userid }
@courses = Moodle::Api.core_enrol_get_users_courses(params)
#@courses = Moodle::Api.core_course_get_courses()
  #@courses = Moodle::Api.core_course_get_courses()

@cantidadcursos=@courses.length

@cursos= Array.new

Array.new(@cantidadcursos)
@grupo= Array.new
@cursosid= Array.new
Array.new(@cantidadcursos)
#@otro= Array.new
#Array.new(@cantidadcursos)
@rol=2

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
  session[:rol]=1
  @userionomnbre= @user.values[0]
@userionomnbre=@userionomnbre[0]
@userionomnbre=@userionomnbre.values[2]
@userionomnbre=@userionomnbre.to_s
   session[:nombre]=@userionomnbre

end
#@userid=@user.values[0]
#@userid=@userid[0]


#@userid=@userid.values[0]


  #List courses of a user
  #  params = { 'userid' => @userid }
  #  @courses = Moodle::Api.core_enrol_get_users_courses(params)



    #@courses=@courses[0]
    #@courses=@courses.values[1]
#@courses= @courses.slice(0..(@courses.index(' -')))


end

  def validar
    @admins=Admin.all
    @usuario = params[:welcome][:usuarios]
#vamos a ver
    session[:nombre]=nil
    @contraseña = params[:welcome][:contraseñas]
    @tokencreado=nil
    session[:rol]=nil
    session[:tokencreado]=nil
    admin= Admin.find_by(name: params[:welcome][:usuarios])


    if (admin && admin.authenticate(params[:welcome][:contraseñas]))
      session[:nombre]=@usuario
      redirect_to :admin
      session[:rol]=3
      session[:tokenusuario]=10
    else

      host = 'http://evafisica.com/learn'

      configuration          = Moodle::Api::Configuration.new
      configuration.host     = host
      configuration.username = @usuario
      configuration.password = @contraseña
      configuration.service  = 'eva-prac-2016'


      token =  Moodle::Api::TokenGenerator.new(configuration).call
    Moodle::Api.configure({host: host, token: token })
      session[:tokenusuario]=token

      params = { 'criteria[0][key]' => 'email', 'criteria[0][value]' => '%%' }
          @users = Moodle::Api.core_user_get_users(params)

      params = { 'criteria[0][key]' => 'username', 'criteria[0][value]' => configuration.username }
      @user = Moodle::Api.core_user_get_users(params)


      @userid=@user.values[0]
      @userid=@userid[0]


      @userid=@userid.values[0]

      params = { 'userid' => @userid }
      @courses = Moodle::Api.core_enrol_get_users_courses(params)
      #@courses = Moodle::Api.core_course_get_courses()
        #@courses = Moodle::Api.core_course_get_courses()

      @cantidadcursos=@courses.length

      @cursos= Array.new

      Array.new(@cantidadcursos)
      @grupo= Array.new
      @cursosid= Array.new
      Array.new(@cantidadcursos)
      #@otro= Array.new
      #Array.new(@cantidadcursos)
      @rol=2

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
        session[:rol]=1
        @userionomnbre= @user.values[0]
  @userionomnbre=@userionomnbre[0]
  @userionomnbre=@userionomnbre.values[2]
  @userionomnbre=@userionomnbre.to_s
         session[:nombre]=@userionomnbre
        redirect_to :maestro
        # gid: (session[:cursos][0])

      elsif(@rol==2)
        session[:rol]=2
        @userionomnbre= @user.values[0]

  @userionomnbre=@userionomnbre[0]

  @userionomnbre=@userionomnbre.values[2]

  @userionomnbre=@userionomnbre.to_s
       @userionomnbre=@userionomnbre[6, 50]
     session[:rol]=2

     session[:nombre]=@userionomnbre

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
