class Admin::AdminsController < ApplicationController
  layout "admin"

def desactivar
@admin = Admin.find(params[:id])

@admin.destroy
redirect_to :back

end
def index
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
