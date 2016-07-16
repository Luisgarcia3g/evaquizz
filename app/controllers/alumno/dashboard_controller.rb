# config/initializers/pusher.rb
require 'pusher'

Pusher.app_id = '215714'
Pusher.key = '75159ef1c6a366266edb'
Pusher.secret = 'c62f3def449b7e35a42a'
Pusher.logger = Rails.logger
Pusher.encrypted = true

# app/controllers/hello_world_controller.rb


class Alumno::DashboardController < ApplicationController

  layout "alumno"

  def logout

    session[:tokenusuario]=nil
    session[:rol]=nil
    session[:nombre]=nil

    redirect_to '/welcome'
  end


  def checar


    if (session[:tokenusuario]==nil)


      redirect_to '/welcome'
    else

      if(session[:rol]==1)

        redirect_to :maestro

      elsif(session[:rol]==3)

        redirect_to :admin
      end

    end

  end
  def index
    @saludo = "Hola  #{session[:nombre]}"

    checar
  end

  def validarCodigo
    @codigo = params[:dashboard][:codigo]

    valido= Grupoquizzs.find_by(codigo: params[:dashboard][:codigo])


    if (valido)
      @quizz=Quizz.find_by(id: valido.Quizz)

      redirect_to :action => :esperar, :idq => @quizz.id, :codigo =>  @codigo

    else

      flash[:notice] = "Código Incorrecto"
      redirect_to :back
    end

  end
  def esperar
    #@quizz=Grupoquizzs.find_by(Codigo:params[:codigo]).first
    @quizz=Quizz.find_by(id: params[:idq])
    @codigo=params[:codigo]
    Pusher.trigger('channel', 'registro', codigo: @codigo.id, idq: @quizz.id)

  end
  def respuestas
    @codigo=params[:Codigo]
    @respuesta=5
    @aleatorio=rand(4)
    @quizz=Quizz.find_by(params[:idq])
    @index=params[:index]
    @index=@index.to_i
    #@quizz.pregunta[]
    #@preguntaquizz=PreguntaQuizz.where(quizz_id: @quizz.id)

    if @quizz.preguntas.count==@index
      redirect_to :action => :puntaje, :codigo => @codigo
    else
      #@pregunta=Pregunta.find_by!(id: @preguntaquizz[@index].pregunta_id)
      @pregunta = @quizz.preguntas[@index].id
      @index = @index + 1
    end

  end

  def enviada
    Pusher.trigger('channel', 'contestados', codigo: @codigo)

    @quizz=Quizz.find_by(id: params[:idq])
    @pregunta=Pregunta.find_by(id: params[:pregunta])
    @index=params[:index]
    @index=@index.to_i
    @codigo=params[:codigo]
    @res=params[:respuesta]
    if(@res==@pregunta.respuesta1)
      @resultado=Resultado.create(Codigo: @codigo, Alumno: session[:nombre],respuesta: 1, pregunta: @pregunta.id  )

  elsif (@res==@pregunta.respuesta2)

    @resultado=Resultado.create(Codigo: @codigo, Alumno: session[:nombre],respuesta: 2, pregunta: @pregunta.id  )

elsif (@res==@pregunta.respuesta3)

  @resultado=Resultado.create(Codigo: @codigo, Alumno: session[:nombre],respuesta: 3, pregunta: @pregunta.id  )


elsif (@res==@pregunta.respuesta4)
  @resultado=Resultado.create(Codigo: @codigo, Alumno: session[:nombre],respuesta: 4, pregunta: @pregunta.id  )

else
  @resultado=Resultado.create(Codigo: @codigo, Alumno: session[:nombre],respuesta: 5, pregunta: @pregunta.id  )


end
end
def puntaje
  @codigo=params[:Codigo]
  @alumno=session[:nombre]
  @puntaje=Resultado.where(Codigo: @codigo)
  @puntaje=@puntaje.where(Alumno: @alumno)


  @score=@puntaje.where(respuesta: 1)
  @score=@score.count
  @califa=(@score*1.0)/@puntaje.count
  @califa=@califa*100

  @puntajealumno=Puntaje.create(codigo: @codigo, alumno:@alumno, puntaje: @califa)
end




end
