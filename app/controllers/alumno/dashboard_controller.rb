class Alumno::DashboardController < ApplicationController
  def index
    @saludo = "Hola alumno"
  end

  def validarCodigo
     @codigo = params[:dashboard][:codigo]

     if(@codigo=="XYZ123")
       flash[:notice] = "Código Correcto"

     else

        flash[:notice] = "Código Incorrecto"
end
       redirect_to :back



  end
end
