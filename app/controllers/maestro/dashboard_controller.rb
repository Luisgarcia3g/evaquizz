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
  checar
  end


  def index
  @saludo = "Hola  #{session[:nombre]}"
      @grupo=Grupo.where(maestro: session[:nombre]).first
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
  @saludo = "Hola  #{session[:nombre]}"
  @chart = Fusioncharts::Chart.new({
:height => 500,
:width => 750,
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
    :seriesname => 'Newton',
    :data =>  [
      { :value => '1' }
    ]},
    {
      :seriesname => 'Copernico',
      :data =>  [
        { :value => nil},
          { :value => '' }

      ]},
      {
        :seriesname => 'Einstein',
        :data =>  [
          { :value => nil },
            { :value => nil },
              { :value => '' }

        ]},
        {
          :seriesname => 'Galileo',
          :data =>  [
            { :value => nil },
              { :value => nil },
                { :value => nil },
{ :value => '' }
          ]},

  ]
}
})

end

end
