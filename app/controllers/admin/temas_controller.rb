class Admin::TemasController < ApplicationController

require 'will_paginate/array'
  def index
    @tema = Tema.all.paginate(page: params[:page], per_page: 10).order('nombretema ASC')
@temarios=Temario.all
  end

  def new
     @temarios_options = Temario.all.map{ |te| [ te.nombretemario, te.id ] }
    @path_prefix = :admin
    @tema = Tema.new
  end

  def show
    @path_prefix = :admin

    @tema = Tema.find(params[:id])
      @temario=Temario.where(id: @tema.temarioid)
      @quizzes=Quizz.where(temaid: @tema.id ).paginate(page: params[:page], per_page: 10)
  end

  def create
    @tema = Tema.new(tema_params)

    if @tema.save
      redirect_to :action => :show, :id => @tema.id
    else
      render :new
    end

  end

  def edit
    # @path_prefix = :admin

    @tema = Tema.find(params[:id])

  #redirect_to :action => :show, :id => @tema.id
  end


def update
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
