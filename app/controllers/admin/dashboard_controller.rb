class Admin::DashboardController < ApplicationController
  layout "admin"

  def checar
    if (session[:tokenusuario]==nil)


          redirect_to '/welcome'
    else

      if(session[:rol]==1)

        redirect_to :maestro

      elsif (session[:rol]==2)
        redirect_to :alumno



      end

    end


  end

  def logout

  session[:tokenusuario]=nil
  session[:rol]=nil
  session[:nombre]=nil

      redirect_to '/welcome'
  end

  def index
checar
@saludo = "Hola  #{session[:nombre]}"


  end



end
