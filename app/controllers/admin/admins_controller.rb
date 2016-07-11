class Admin::AdminsController < ApplicationController
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

def desactivar
@admin = Admin.find(params[:id])

@admin.destroy
redirect_to :back

end
def index
  checar
  @saludo = "Hola  #{session[:nombre]}"
  @admins=Admin.all

end

def show
    @saludo = "Hola  #{session[:nombre]}"
  @admin = Admin.find(params[:id])
end

def new
  @saludo = "Hola  #{session[:nombre]}"
  @path_prefix = :admin
  @admin = Admin.new
end

def create

  @admin = Admin.new(admin_params)
  if @admin.save
    redirect_to :action => :show, :id => @admin.id
  else
    render :new
  end
end

private
  def admin_params
    params.require(:admin).permit(:name, :email,:password,:password_confirmation)
  end
end
