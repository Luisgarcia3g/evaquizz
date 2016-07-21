class Maestro::DashboardController < ApplicationController
  layout "maestro"
  require 'pusher'

  Pusher.app_id = '215714'
  Pusher.key = '75159ef1c6a366266edb'
  Pusher.secret = 'c62f3def449b7e35a42a'
  Pusher.logger = Rails.logger
  Pusher.encrypted = true

  require 'securerandom'

  def cursogrupo

  end

  def filtrar

  end


  def quizz
    @quizz = Quizz.find(params[:idq])
    @codigo = params[:codigo]
    @gquizz = Grupoquizzs.find_by(codigo_id: @codigo)
    @gquizz.update_attribute(:iniciado, true)
    @index = params[:index]
    @index = @index.to_i
    @preguntaquizz = PreguntaQuizz.where(quizz_id: @quizz.id)

    if @preguntaquizz.count == @index
      redirect_to  maestro_finalquizz_path
    else
      @pregunta = Pregunta.find_by!(id: @preguntaquizz[@index].pregunta_id)
      Pusher.trigger('channel', 'pregunta', codigo: @codigo)
      @tiempo = (@pregunta.tiempo)+1
      @index = @index+1;
    end
  end

  def finalquizz
    @saludo = "Hola  #{session[:nombre]}"
    Pusher.trigger('channel', 'finquizz', codigo: @codigo)
  end

  def logout
    session[:tokenusuario] = nil
    session[:rol] = nil
    session[:nombre] = nil
    redirect_to '/welcome'
  end


  def checar
    if (session[:tokenusuario] == nil)
      redirect_to '/welcome'
    else
      if(session[:rol] == 2)
        redirect_to :alumno
      elsif (session[:rol] == 3)
        redirect_to :admin
      end
    end
  end

  def verquizz
    @saludo = "Hola  #{session[:nombre]}"
    @quizz = Quizz.active.find(params[:id])
    @temas = Tema.all
  end

  # def index2
  #     @saludo = "Hola  #{session[:nombre]}"
  #     @grupo=Grupo.where(maestro: session[:nombre]).second
  #     @temario=Temario.active.all
  #
  #     @temas=Tema.all
  #     @grupoquizz=Grupoquizzs.where(Grupo:  @grupo.id)
  # #checar
  # end


  def index
    @saludo = "Hola  #{session[:nombre]}"
    @grupo = Grupo.where(maestro: 'maestro1').first
    @temario = Temario.active.all
    @temas = Tema.active.all
    @grupoquizz = Grupoquizzs.where(Grupo: @grupo.id)
    #  @resultados=Resultado.where(Codigo: @grupoquizz.Codigo)
    checar
  end


  def grupo


    @grupo=Grupo.find_by(id: params[:grupo])
    @grupoquizz=Grupoquizzs.where(grupo_id: @grupo.id, iniciado: true).order(:updated_at => 'DESC')
    @cantidadquizzes=Grupoquizzs.where(grupo_id: @grupo.id, iniciado: true)
    @cantidadquizzes=@cantidadquizzes.count
    @puntajes=Puntaje.all
    @puntajes=@puntajes.pluck(:alumno).uniq
    @saludo = "Hola  #{session[:nombre]}"

    checar
  end

  def especificacion
    checar
    @saludo = "Hola  #{session[:nombre]}"
  end

  def iniciar
    checar
    @saludo = "Hola  #{session[:nombre]}"
    @quizz = Quizz.find(params[:id])
    @grupo = Grupo.second
    @grupoquizz=Grupoquizzs.find_by(grupo_id: @grupo.id, quizz_id: @quizz.id)
  end

  def siguiente
    checar
    @codigo= SecureRandom.hex(3)
    Pusher.trigger('channel', 'event', codigo: @codigo)
    render nothing: true
  end

  def grafica
    @saludo = "Hola  #{session[:nombre]}"
      @alumno=params[:alumno]
      @grupo=Grupo.where(params[:grupo]).first
    @puntajes=Puntaje.where(alumno: @alumno).order(:updated_at => 'ASC')
    @quizzes=@puntajes.count
    @contador=1

    @puntajesarreglo=Array.new
    Array.new(@quizzes)
  @puntajes.each do |pun|
    @puntajesarreglo.push(

      {
        :seriesname => "Quizz #{@contador}",
        :data =>  [
         {

                  :value => pun.puntaje }
        ]}




    )
    @contador=@contador+1

  end

    @cantidad=@puntajes.count
    checar
    @titulo= "Calificaciones del alumno #{@alumno}"
    contador=1
    @chart = Fusioncharts::Chart.new({

    	:height => 400,
    	:width => 600,
    	:type => 'mscolumn2d',
    	:renderAt => 'chart-container',



    	:dataSource => {

    		:chart => {
    			:caption =>  @titulo,
          :adjustDiv => '1',
          :numDivLines => '10',
            :yAxisMaxvalue => 100,


    			#:xAxisname => 'Quizzes',
    			:yAxisName => 'Puntaje'

    			#:theme => 'fint',
    		},
        :categories => [{
          :category => [
            { :label => 'Quizzes' }


          ]
        }],
    	:dataset =>@puntajesarreglo




    	}
    })


  end


  def gestion
    checar
    @saludo = "Hola  #{session[:nombre]}"

    @codigo=params[:codigo]
    @quizz=Quizz.find_by(id: params[:quizz])
    @preguntas=PreguntaQuizz.where(quizz_id: @quizz)
    @cantidadpreguntas=PreguntaQuizz.where(quizz_id: @quizz.id)
    @cantidadpreguntas=@cantidadpreguntas.count
    @chart=Array.new
    Array.new (@cantidadpreguntas)
    for i in 0..@cantidadpreguntas-1
    @pregunta=Pregunta.find_by(id: @preguntas[i].pregunta_id)
      @r1=@pregunta.respuesta1
      @r2=@pregunta.respuesta2
      @r3=@pregunta.respuesta3
      @r4=@pregunta.respuesta4
      @respuestas=Resultado.where(Codigo: @codigo, pregunta: @pregunta.id,respuesta: 1)
    @v1=@respuestas.count
    @respuestas=Resultado.where(Codigo: @codigo, pregunta: @pregunta.id,respuesta: 2)
    @v2=@respuestas.count
    @respuestas=Resultado.where(Codigo: @codigo, pregunta: @pregunta.id,respuesta: 3)
    @v3=@respuestas.count
    @respuestas=Resultado.where(Codigo: @codigo, pregunta: @pregunta.id,respuesta: 4)
    @v4=@respuestas.count
    @respuestas=Resultado.where(Codigo: @codigo, pregunta: @pregunta.id,respuesta: 5)
    @v5=@respuestas.count
    @maximo=[@v1,@v2,@v3,@v4,@v5].max
@rcorrecta= "#{@r1} (Correcta)"
    @titulo = "Respuestas de la pregunta #{@pregunta.texto}"
    @contenedor=i.to_s
    @chart[i]=Fusioncharts::Chart.new({
    :height => 370,
    :width => 530,
    :type => 'mscolumn2d',
    :renderAt => @contenedor,

    :dataSource => {
    :chart => {
      :caption => @titulo ,

      #:xAxisname => 'Respuestas',
      :yAxisName => 'Alumnos',

      :showXAxisLine =>'1',
      :yAxisValueDecimals => '0',
        :xAxisLineColor => '#999999',
        :divlineColor => '#999999',
        :divLineDashed => '1',
        :borderAlpha => '20',
        :showYAxisValues => '1',
        :yAxisMaxvalue => @maximo,
        :borderThickness => "4",
        :adjustDiv => '1',
        :numDivLines => '0',
        :showPlotBorder => '1',
        :rotateValues => '0',
      :theme => 'ocean',
    },
    :categories => [{
      :category => [
        { :label => 'Respuestas' }


      ]
    }],
    :dataset =>  [{
      :seriesname => @rcorrecta,
      :data =>  [
        {
          :link => maestro_path,
                :value => @v1 }
      ]},
      {
        :seriesname => @r2,
        :data =>  [

            { :value => @v2 }

        ]},
        {
      :seriesname => @r3,
      :data =>  [

            { :value => @v3 }
          ]},
          {
            :seriesname => @r4,
            :data =>  [
              { :value =>@v4 }
            ]},
          {
            :seriesname => 'No Contesto',
            :data =>  [
              { :value =>@v5 }
          ]},
        ]
      }
      })
    end
  end

  def mostrargrafica

    @quizz=Quizz.find(params[:idq])
    @pregunta=Pregunta.find_by(id: params[:pregunta])
    @index=params[:index]
    @codigo=params[:codigo]
    Pusher.trigger('channel', 'cerrar', codigo: @codigo)


    @saludo = "Hola  #{session[:nombre]}"
    @r1=@pregunta.respuesta1
    @r2=@pregunta.respuesta2
    @r3=@pregunta.respuesta3
    @r4=@pregunta.respuesta4
    @respuestas=Resultado.where(Codigo: @codigo, pregunta: @pregunta.id,respuesta: 1)
    @v1=@respuestas.count
    @respuestas=Resultado.where(Codigo: @codigo, pregunta: @pregunta.id,respuesta: 2)
    @v2=@respuestas.count
    @respuestas=Resultado.where(Codigo: @codigo, pregunta: @pregunta.id,respuesta: 3)
    @v3=@respuestas.count
    @respuestas=Resultado.where(Codigo: @codigo, pregunta: @pregunta.id,respuesta: 4)
    @v4=@respuestas.count
    @respuestas=Resultado.where(Codigo: @codigo, pregunta: @pregunta.id,respuesta: 5)
    @v5=@respuestas.count
    @maximo=[@v1,@v2,@v3,@v4,@v5].max
    @rcorrecta= "#{@r1} (Correcta)"
    @titulo = "Respuestas de la pregunta #{@pregunta.texto}"
      @chart = Fusioncharts::Chart.new({
    :height => 370,
    :width => 750,
    :type => 'mscolumn2d',
    :renderAt => 'chart-container',
    :dataSource => {
      :chart => {
        :caption => @titulo ,
        #:xAxisname => 'Respuestas',
        :yAxisName => 'Alumnos',
        :showXAxisLine =>'1',
        :yAxisValueDecimals => '0',
          :xAxisLineColor => '#999999',
          :divlineColor => '#999999',
          :divLineDashed => '1',
          :borderAlpha => '20',
          :showYAxisValues => '1',
          :yAxisMaxvalue => @maximo,
          :adjustDiv => '1',
          :numDivLines => '0',
          :showPlotBorder => '1',
          :rotateValues => '0',
        :theme => 'fint',
      },
      :categories => [{
        :category => [
          { :label => 'Respuestas' }
        ]
      }],
      :dataset =>  [{
        :seriesname => @rcorrecta,
        :data =>  [
          { :value => @v1 }
        ]},
        {
          :seriesname => @r2,
          :data =>  [
            { :value => @v2 }
          ]},
          {
            :seriesname => @r3,
            :data =>  [
              { :value => @v3 }
            ]},
            {
              :seriesname => @r4,
              :data =>  [
                { :value =>@v4 }
              ]},
              {
                :seriesname => 'No Contesto',
                :data =>  [
      { :value =>@v5 }
                ]},
      ]
    }
    })

  end

end
