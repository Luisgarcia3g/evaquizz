class Alumno::DashboardController < ApplicationController

  layout "alumno"

  def logout

  session[:tokenusuario]=nil
  session[:rol]=nil

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
    @saludo = "Hola alumno"

    checar
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

sleep 5
render :respuestas

  end
def respuestas
sleep 5

end

def enviada


end

def puntaje

end

end
