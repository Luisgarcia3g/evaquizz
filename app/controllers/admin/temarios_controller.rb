class Admin::TemariosController < ApplicationController
layout 'admin'
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

    @temario = Temario.find(params[:id])

    @temario.update_attribute(:is_active, false
    )
    redirect_to :back

  end

  def logout

    session[:tokenusuario]=nil

    session[:rol]=nil

    redirect_to '/welcome'

  end

  def index

    checar
    @saludo = "Hola #{session[:nombre]}"
    @temario = Temario.active.all.paginate(page: params[:page], per_page: 10)

  end

  def new
    checar
      @saludo = "Hola #{session[:nombre]}"
    @path_prefix = :admin
    @temario = Temario.new
  end

  def show
    checar
      @saludo = "Hola #{session[:nombre]}"
    @path_prefix = :admin
    @temario = Temario.find(params[:id])
    @temas=Tema.where(temarioid: @temario.id ).paginate(page: params[:page], per_page: 10)
  end

  def create
    checar
    @temario = Temario.new(temario_params)
    if @temario.save
      redirect_to :action => :show, :id => @temario.id
    else
      render :new
    end

  end

  def edit
    checar
    # @path_prefix = :admin
      @saludo = "Hola #{session[:nombre]}"
    @temario = Temario.find(params[:id])
  end

  def update
    checar
    @temario = Temario.find(params[:id])
    if @temario.update_attributes(temario_params)
      redirect_to :action => :show, :id => @temario.id
    else
      render :edit
    end
  end

  private
  def temario_params
    params.require(:temario).permit(:nombretemario, :descripcion)
  end


end
