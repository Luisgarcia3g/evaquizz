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
    @quizz=Quizz.find(params[:idq])
      @codigo=params[:codigo]
    @index=params[:index]
    @index=@index.to_i
    @preguntaquizz=PreguntaQuizz.where(quizz_id: @quizz.id)

    if @preguntaquizz.count==@index
    redirect_to '/maestro'

  else
    @pregunta=Pregunta.find_by!(id: @preguntaquizz[@index].pregunta_id)
@index=@index+1;
end


  end
  def finalquizz
@saludo = "Hola  #{session[:nombre]}"

  end

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
          if(session[:rol]==2)
            redirect_to :alumno
          elsif (session[:rol]==3)
            redirect_to :admin
          end
        end


  end

def verquizz
    @saludo = "Hola  #{session[:nombre]}"
  @quizz = Quizz.active.find(params[:id])
  @temas=Tema.all

end

  def index2
      @saludo = "Hola  #{session[:nombre]}"
      @grupo=Grupo.where(maestro: session[:nombre]).second
      @temario=Temario.active.all

      @temas=Tema.all
      @grupoquizz=Grupoquizzs.where(Grupo:  @grupo.id)
  #checar
  end


  def index
  @saludo = "Hola  #{session[:nombre]}"
      @grupo=Grupo.first
        @temario=Temario.active.all

        @temas=Tema.all
        @grupoquizz=Grupoquizzs.where(Grupo: @grupo.id)

    checar
  end


  def grupo

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
    @grupo = Grupo.first
@grupoquizz=Grupoquizzs.find_by(Grupo: @grupo.id, Quizz: @quizz.id)



end


def siguiente
  checar
  @codigo= SecureRandom.hex(3)
  Pusher.trigger('channel', 'event', codigo: @codigo)
  render nothing: true
end


def grafica
    @saludo = "Hola  #{session[:nombre]}"
    checar
    @chart = Fusioncharts::Chart.new({
	:height => 400,
	:width => 600,
	:type => 'mscolumn2d',
	:renderAt => 'chart-container',
	:dataSource => {
		:chart => {
			:caption => 'Calificaciones del alumno Luis',

			:xAxisname => 'Quizzes',
			:yAxisName => 'Puntaje',

			:theme => 'fint',
		},
		:categories => [{
			:category => [
				{ :label => 'Q1' },
				{ :label => 'Q2' },
				{ :label => 'Q3' },
				{ :label => 'Q4' },
        { :label => 'Q5' }
			]
		}],
		:dataset =>  [{
			:seriesname => 'Puntaje de quizzes',
			:data =>  [
				{ :value => '100' },
				{ :value => '90' },
				{ :value => '80' },
			{ :value => '70' },
      { :value => '70' }
			]}
		]
	}
})

  end



  def gestion
    @saludo = "Hola  #{session[:nombre]}"
    checar
    @chart = Fusioncharts::Chart.new({
  :height => 400,
  :width => 550,
  :type => 'mscolumn2d',
  :renderAt => 'chart-container',
  :dataSource => {
    :chart => {
      :caption => 'Respuestas de pregunta 1, Sumatoria de fuerzas',

      :xAxisname => 'Quizzes',
      :yAxisName => 'Puntaje',

      :theme => 'fint',
    },
    :categories => [{
      :category => [
        { :label => 'R1' },
        { :label => 'R2' },
        { :label => 'R3' },
        { :label => 'R4' },

      ]
    }],
    :dataset =>  [{
      :seriesname => '110 N',
      :data =>  [
        { :value => '10' }
      ]},
      {
        :seriesname => '220 N',
        :data =>  [
          { :value => nil},
            { :value => '8' }

        ]},
        {
          :seriesname => '300 N',
          :data =>  [
            { :value => nil },
              { :value => nil },
                { :value => '6' }

          ]},
          {
            :seriesname => '50 N',
            :data =>  [
              { :value => nil },
                { :value => nil },
                  { :value => nil },
{ :value => '5' }
            ]},

    ]
  }
})

@chart2 = Fusioncharts::Chart.new({
:height => 400,
:width => 550,
:type => 'mscolumn2d',
:renderAt => 'chart-container2',
:dataSource => {
:chart => {
  :caption => 'Respuestas de pregunta 2, Fuerza del angulo',

  :xAxisname => 'Quizzes',
  :yAxisName => 'Puntaje',

  :theme => 'fint',
},
:categories => [{
  :category => [
    { :label => 'R1' },
    { :label => 'R2' },
    { :label => 'R3' },
    { :label => 'R4' },

  ]
}],
:dataset =>  [{
  :seriesname => '110 N',
  :data =>  [
    { :value => '10' }
  ]},
  {
    :seriesname => '220 N',
    :data =>  [
      { :value => nil},
        { :value => '8' }

    ]},
    {
      :seriesname => '300 N',
      :data =>  [
        { :value => nil },
          { :value => nil },
            { :value => '6' }

      ]},
      {
        :seriesname => '50 N',
        :data =>  [
          { :value => nil },
            { :value => nil },
              { :value => nil },
{ :value => '5' }
        ]},

]
}
})
@chart3 = Fusioncharts::Chart.new({
:height => 400,
:width => 550,
:type => 'mscolumn2d',
:renderAt => 'chart-container3',
:dataSource => {
:chart => {
  :caption => 'Respuestas de pregunta 3, Resta de fuerzas',

  :xAxisname => 'Quizzes',
  :yAxisName => 'Puntaje',

  :theme => 'fint',
},
:categories => [{
  :category => [
    { :label => 'R1' },
    { :label => 'R2' },
    { :label => 'R3' },
    { :label => 'R4' },

  ]
}],
:dataset =>  [{
  :seriesname => '110 N',
  :data =>  [
    { :value => '10' }
  ]},
  {
    :seriesname => '220 N',
    :data =>  [
      { :value => nil},
        { :value => '8' }

    ]},
    {
      :seriesname => '300 N',
      :data =>  [
        { :value => nil },
          { :value => nil },
            { :value => '6' }

      ]},
      {
        :seriesname => '50 N',
        :data =>  [
          { :value => nil },
            { :value => nil },
              { :value => nil },
{ :value => '5' }
        ]},

]
}
})

@chart4 = Fusioncharts::Chart.new({
:height => 400,
:width => 550,
:type => 'mscolumn2d',
:renderAt => 'chart-container4',
:dataSource => {
:chart => {
  :caption => 'Respuestas de pregunta 4, Sumatoria de fuerzas',

  :xAxisname => 'Quizzes',
  :yAxisName => 'Puntaje',

  :theme => 'fint',
},
:categories => [{
  :category => [
    { :label => 'R1' },
    { :label => 'R2' },
    { :label => 'R3' },
    { :label => 'R4' },

  ]
}],
:dataset =>  [{
  :seriesname => '110 N',
  :data =>  [
    { :value => '10' }
  ]},
  {
    :seriesname => '220 N',
    :data =>  [
      { :value => nil},
        { :value => '8' }

    ]},
    {
      :seriesname => '300 N',
      :data =>  [
        { :value => nil },
          { :value => nil },
            { :value => '6' }

      ]},
      {
        :seriesname => '50 N',
        :data =>  [
          { :value => nil },
            { :value => nil },
              { :value => nil },
{ :value => '5' }
        ]},

]
}
})


  end

def mostrargrafica
  @quizz=Quizz.find(params[:idq])
  @pregunta=Pregunta.find_by(id: params[:pregunta])
  @index=params[:index]
  @codigo=params[:codigo];


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


@titulo = "Respuestas de la pregunta #{@pregunta.texto}"
  @chart = Fusioncharts::Chart.new({
:height => 370,
:width => 750,
:type => 'mscolumn2d',
:renderAt => 'chart-container',

:dataSource => {
  :chart => {
    :caption => @titulo ,

    :xAxisname => 'Respuestas',
    :yAxisName => 'Alumnos',

    :theme => 'fint',
  },
  :categories => [{
    :category => [
      { :label => @r1 },
      { :label => @r2 },
      { :label => @r3 },
      { :label => @r4 },

    ]
  }],
  :dataset =>  [{
    :seriesname => @r1,
    :data =>  [
      { :value => @v1 }
    ]},
    {
      :seriesname => @r2,
      :data =>  [
        { :value => nil},
          { :value => @v2 }

      ]},
      {
        :seriesname => @r3,
        :data =>  [
          { :value => nil },
            { :value => nil },
              { :value => @v3 }

        ]},
        {
          :seriesname => @r4,
          :data =>  [
            { :value => nil },
              { :value => nil },
                { :value => nil },
{ :value =>@v4 }
          ]},

  ]
}
})

end

end
