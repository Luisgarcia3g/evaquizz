class Admin::TemasController < ApplicationController


  require 'will_paginate/array'
  layout 'temas'
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

    @tema = Tema.find(params[:id])

    @tema.update_attribute(:is_active, false)

    redirect_to :back

  end

  def logout

    session[:tokenusuario]=nil
    session[:rol]=nil

    redirect_to '/welcome'
  end
  def index
    checar
    @saludo = "Hola  #{$usuarioNombre}"
    @tema = Tema.active.all.paginate(page: params[:page], per_page: 10).order('nombretema ASC')
    @temarios=Temario.all
  end

  def new
    checar
    @temarios_options = Temario.active.all.map{ |te| [ te.nombretemario, te.id ] }
    @path_prefix = :admin
    @tema = Tema.new
  end

  def show
    checar
    @saludo = "Hola  #{$usuarioNombre}"
    @path_prefix = :admin

    @tema = Tema.find(params[:id])
    @temario=Temario.active.where(id: @tema.temarioid)
    @quizzes=Quizz.active.where(temaid: @tema.id ).paginate(page: params[:page], per_page: 10)
  end

  def create
    checar
    @tema = Tema.new(tema_params)

    if @tema.save
      redirect_to :action => :show, :id => @tema.id
    else
      render :new
    end

  end

  def edit
    checar
    # @path_prefix = :admin

    @tema = Tema.find(params[:id])

    #redirect_to :action => :show, :id => @tema.id
  end


  def update
    checar
    @tema = Tema.find(params[:id])

    if @tema.update_attributes(tema_params)
      redirect_to :action => :show, :id =>@tema.id
    else
      render :edit
    end
  end


  private
  def tema_params
    params.require(:tema).permit(:nombretema, :descripcion, :temarioid)
  end

end
