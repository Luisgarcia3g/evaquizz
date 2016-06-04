class Admin::AdminsController < ApplicationController
def index
  @message="Hola Administrador tal"

  
end

def show
  @admin = Admin.find(params[:id])
end

def new

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
