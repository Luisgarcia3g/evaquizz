class Admin::DashboardController < ApplicationController
  layout "admin"
  
  def index

    @saludo = "Hola administrador"

  end

end
