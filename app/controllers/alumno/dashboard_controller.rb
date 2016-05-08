class Alumno::DashboardController < ApplicationController
  def index
    @saludo = "Hola alumno"
  end

  def validarCodigo
     @codigo = params[:dashboard][:codigo]

     if(@codigo=="XYZ123")
      redirect_to :action => :esperar

     else

        flash[:notice] = "Código Incorrecto"
             redirect_to :back
end

  end
  def esperar


  end
def respuestas

end

def enviada

end

def puntaje

end

end
