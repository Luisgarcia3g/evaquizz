class Admin::DashboardController < ApplicationController

  add_breadcrumb "Inicio/Admin", :root_path
  def index

    @saludo = "Hola administrador"

  end

end
