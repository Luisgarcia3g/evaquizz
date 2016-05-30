class Admin::PreguntasController < ApplicationController

  def index
    @preguntas = Pregunta.all.paginate(page: params[:page], per_page: 10)
  end

  def new
    @path_prefix = :admin
    @pregunta = Pregunta.new
  end

  def show
    @pregunta = Pregunta.find(params[:id])
  end

  def create
    @pregunta = Pregunta.new(pregunta_params)
    if @pregunta.save
      redirect_to :action => :show, :id => @pregunta.id
    else
      render :new
    end
  #@pregunta = Pregunta.new(pregunta_params)
  end

  def edit
    # @path_prefix = :admin
    @pregunta = Pregunta.find(params[:id])


  end

   private
     def pregunta_params
       params.require(:pregunta).permit(:image, :texto,  :respuesta1,:respuesta2, :respuesta3, :respuesta4, :tiempo)
     end


end
