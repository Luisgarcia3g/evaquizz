class Maestro::DashboardController < ApplicationController

  layout "maestro"
  require 'securerandom'
  def filtrar

  end
  def logout

    session[:tokenusuario]=nil
    session[:rol]=nil

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

  def index
    @saludo = "Hola  #{$usuarioNombre}"

    checar
  end


  def grupo

    @saludo = "Hola  #{$usuarioNombre}"
    checar
  end

  def especificacion
    checar
    @saludo = "Hola #{$usuarioNombre}"
  end



def iniciar
checar
  @saludo = "Hola #{$usuarioNombre}"
  @codigo= SecureRandom.hex(3)

end
  def grafica
    @saludo = "Hola administrador #{$usuarioNombre}"
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
			:numberPrefix => '$',
			:theme => 'fint',
		},
		:categories => [{
			:category => [
				{ :label => 'Q1' },
				{ :label => 'Q2' },
				{ :label => 'Q3' },
				{ :label => 'Q4' }
			]
		}],
		:dataset =>  [{
			:seriesname => 'Puntaje de quizzes',
			:data =>  [
				{ :value => '100' },
				{ :value => '90' },
				{ :value => '80' },
			{ :value => '70' }
			]}
		]
	}
})

  end



  def gestion
    @saludo = "Hola #{$usuarioNombre}"
    checar
  end

end
